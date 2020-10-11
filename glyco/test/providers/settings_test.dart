// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/settings.dart';

void main() {
  group('Settings', () {
    test('Drink calories and carbs should be set accordingly', () {
      final settings = Settings(
        drinkCalories: 0,
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCalories: 0,
        mealCarbs: 0,
        snackCalories: 0,
        snackCarbs: 0,
      );

      settings.setDrinkSettings(10, 10);
      expect(settings.drinkCalories, 10);
      expect(settings.drinkCarbs, 10);
    });
    test('Meal calories and carbs should be set accordingly', () {
      final settings = Settings(
        drinkCalories: 0,
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCalories: 0,
        mealCarbs: 0,
        snackCalories: 0,
        snackCarbs: 0,
      );

      settings.setMealSettings(10, 10);
      expect(settings.mealCalories, 10);
      expect(settings.mealCarbs, 10);
    });
    test('Snack calories and carbs should be set accordingly', () {
      final settings = Settings(
        drinkCalories: 0,
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCalories: 0,
        mealCarbs: 0,
        snackCalories: 0,
        snackCarbs: 0,
      );

      settings.setSnackSettings(10, 10);
      expect(settings.snackCalories, 10);
      expect(settings.snackCarbs, 10);
    });
  });
}
