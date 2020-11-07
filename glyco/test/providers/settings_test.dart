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
        userId: '1',
      );

      settings.setDrinkSettings(10, '1');
      expect(settings.drinkCarbs, 10);
    });
    test('Drink carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
        userId: '1',
      );

      settings.setDrinkSettings(15, '1');
      expect(settings.drinkCarbs, 15);
    });
    test('Meal carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
        userId: '1',
      );

      settings.setMealSettings(10, '1');
      expect(settings.mealCarbs, 10);
    });
    test('Meal carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
        userId: '1',
      );

      settings.setMealSettings(20, '1');
      expect(settings.mealCarbs, 20);
    });
    test('Snack carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
        userId: '1',
      );

      settings.setSnackSettings(10, '1');
      expect(settings.snackCarbs, 10);
    });

    test('Snack carbs should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
        userId: '1',
      );

      settings.setSnackSettings(20, '1');
      expect(settings.snackCarbs, 20);
    });

    test('Exercise time should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
        userId: '1',
      );

      settings.setExerciseTime(30, '1');
      expect(settings.exerciseTime, 30);
    });

    test('Exercise time should be set accordingly', () {
      final settings = Settings(
        drinkCarbs: 0,
        exerciseTime: 0,
        mealCarbs: 0,
        snackCarbs: 0,
        userId: '1',
      );

      settings.setExerciseTime(60, '1');
      expect(settings.exerciseTime, 60);
    });
  });
}
