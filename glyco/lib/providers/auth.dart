import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String _userName;
  String _userEmail;
  String firstName;
  String lastName;

  Auth({
    @required this.firstName,
    @required this.lastName,
  });

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userName {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _userName;
    }
    return null;
  }

  String get userEmail {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _userEmail;
    }
    return null;
  }

  Future<void> signUp(
      String email, String password, String firstName, String lastName) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      //print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
    } catch (error) {
      return Future.error(error);
    }
    updateName(firstName, lastName);
  }

  Future<void> updateName(String firstName, String lastName) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    try {
      final response = await http.post(url,
          body: json.encode({
            'idToken': _token,
            'displayName': firstName + " " + lastName,
            'photoUrl': "",
            'deleteAttribute': new List(0),
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<void> signIn(String email, String password) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      return Future.error(error);
    }
    setData(_token);
  }

  Future<void> setData(String idToken) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    final response = await http.post(url,
        body: json.encode({
          'idToken': idToken,
        }));
    final responseData = json.decode(response.body);
    _userName = responseData['users'][0]['displayName'];
    _userEmail = responseData['users'][0]['email'];
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if(expiryDate.isBefore(DateTime.now())){
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    setData(_token);
    notifyListeners();
    return true;
  }

  Future<void> resetPassword(String email) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    try {
      final response = await http.post(url,
          body: json.encode({
            'requestType': "PASSWORD_RESET",
            'email': email,
          }));
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<void> logout() async{
    _token = null;
    _userId = null;
    _expiryDate = null;
    _userName = null;
    _userEmail = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }
}
