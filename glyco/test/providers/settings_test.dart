// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/settings.dart';

void main() {
  group('Settings', () {
    test('Drink carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setDrinkSettings(10);
      expect(settings.drinkCalories, 10);
      expect(settings.drinkCarbs, 10);
    });
    test('Drink carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setDrinkSettings(15);
      expect(settings.drinkCarbs, 15);
    });
    test('Meal carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setMealSettings(10);
      expect(settings.mealCarbs, 10);
    });
    test('Meal carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setMealSettings(20);
      expect(settings.mealCarbs, 20);
    });
    test('Snack carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setSnackSettings(10);
      expect(settings.snackCarbs, 10);
    });

    test('Snack carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setSnackSettings(20);
      expect(settings.snackCarbs, 20);
    });

    test('Exercise time should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setExerciseTime(30);
      expect(settings.exerciseTime, 30);
    });

    test('Exercise time should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
      );

      settings.setExerciseTime(60);
      expect(settings.exerciseTime, 60);
    });
  });
}
