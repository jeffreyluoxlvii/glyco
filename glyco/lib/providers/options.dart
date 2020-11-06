import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './settings.dart';

class Options with ChangeNotifier {
  final String authToken;
  final String userId;

  // default settings
  Settings _settings = Settings(
    mealCarbs: 35,
    snackCarbs: 15,
    drinkCarbs: 10,
    exerciseTime: 30,
  );

  Options(this.authToken, this.userId, this._settings);

  Settings get settings {
    return _settings;
  }

  Future<void> fetchSettings() async {
    final url =
        'https://glyco-6f403.firebaseio.com/userSettings/$userId/settings.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        try {
          await http.post(url,
              body: json.encode({
                'mealCarbs': 35,
                'snackCarbs': 15,
                'drinkCarbs': 10,
                'exerciseTime': 30,
              }));
        } catch (error) {
          return Future.error(error);
        }
      } else {
        extractedData.forEach((settingsId, settingsData) {
          _settings = Settings(
            drinkCarbs: settingsData['drinkCarbs'],
            exerciseTime: settingsData['exerciseTime'],
            mealCarbs: settingsData['mealCarbs'],
            snackCarbs: settingsData['snackCarbs'],
          );
        });
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }
}
