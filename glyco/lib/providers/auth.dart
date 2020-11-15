import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/http_exception.dart';
import 'dart:async';

//Author: Justin Wu

//This class creates the Auth provider that is used to deal with user authentication in our Firebase Database.
//Has functions dedicated to features like creating accounts, logging in, and changing profile data.

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;
  String _userName;
  String _userEmail;

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

  String get userId {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _userId;
    }
    return null;
  }

  // Sign up and Sign in

  //This function signs a user up if the inputs are valid (if email isn't registered yet,
  //if password is longer than 6 characters, etc.)
  Future<void> signUp(
      String email, String password, String firstName, String lastName) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    email = email.trim();
    firstName = firstName.trim();
    lastName = lastName.trim();
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      if (response.body.isNotEmpty) {
        final responseData = json.decode(response.body);
        if (responseData['error'] != null) {
          throw HttpException(responseData['error']['message']);
        }
        _token = responseData['idToken'];
      }
    } catch (error) {
      return Future.error(error);
    }
    updateName(firstName, lastName);
  }

  //This function signs a user into the app if the inputs are valid (if account exists and password is correct).
  Future<void> signIn(String email, String password) async {
    email = email.trim();
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
      _autoLogout();
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

  //This function automatically logs a user in if they were already previously logged in.
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    setData(_token);
    notifyListeners();
    _autoLogout();
    return true;
  }

  //Change account data

  //This function connects a newly-created account's name to its email in the database.
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
    } catch (error) {
      return Future.error(error);
    }
  }

  //This function stores the user's name and email to local variables that are reset after each session.
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

  //This function sends an email containing instructions on how to reset their password, to the user's email.
  Future<void> resetPassword(String email) async {
    email = email.trim();
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

  //This function updates a user's password or email when they change it in the settings screen.
  Future<void> changeProfile(String type, String input) async {
    if (type == 'email') {
      input = input.trim();
    }
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    try {
      final response = await http.post(url,
          body: json.encode({
            'idToken': _token,
            '$type': input,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      if (responseData['idToken'] != null) {
        _token = responseData['idToken'];
      }
      _userName = responseData['displayName'];
      _userEmail = responseData['email'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout();
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
  }

  //This function updates a user's name when they change it in the settings screen. This is a different
  //function from "changeProfile" because when changing name, a new token is used, so we have to update it.
  Future<void> changeName(String input) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCZKCqoWvymtxc4YTUfMeeFLkbSasnDm20';
    try {
      final response = await http.post(url,
          body: json.encode({
            'idToken': _token,
            'displayName': input,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      if (responseData['idToken'] != null) {
        _token = responseData['idToken'];
      }
      _userName = responseData['displayName'];
      notifyListeners();
    } catch (error) {
      return Future.error(error);
    }
  }

  //Logout

  //This function logs a user out of our app.
  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    _userName = null;
    _userEmail = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  //This function automatically logs a user out of our app after a certain amount of time (this can be optional).
  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
