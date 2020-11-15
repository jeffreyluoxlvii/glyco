import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/measurement.dart';

void main() {
  group('Measurement', () {
    test('Carbs and calories should be set accordingly', () {
      final measurement = Measurement(
        a1cLevel: 0,
        avgGlucoseLevel: 0,
        calories: 0,
        carbs: 0,
        currGlucoseLevel: 0,
        date: DateTime.now(),
        exerciseTime: 0,
        id: '1',
        lastUpdate: DateTime.now(),
        steps: 0,
        userId: '1',
      );

      measurement.setNutrition(10, '1');
      expect(measurement.calories, 40);
      expect(measurement.carbs, 10);
    });

    test('Carbs and calories should be added accordingly', () {
      final measurement = Measurement(
        a1cLevel: 0,
        avgGlucoseLevel: 0,
        calories: 0,
        carbs: 0,
        currGlucoseLevel: 0,
        date: DateTime.now(),
        exerciseTime: 0,
        id: '1',
        lastUpdate: DateTime.now(),
        steps: 0,
        userId: '1',
      );

      measurement.addNutrition(10, '1');
      expect(measurement.calories, 40);
      expect(measurement.carbs, 10);
    });

    test('Exercise should be set accordingly', () {
      final measurement = Measurement(
        a1cLevel: 0,
        avgGlucoseLevel: 0,
        calories: 0,
        carbs: 0,
        currGlucoseLevel: 0,
        date: DateTime.now(),
        exerciseTime: 0,
        id: '1',
        lastUpdate: DateTime.now(),
        steps: 0,
        userId: '1',
      );

      measurement.setExercise(10, '1');
      expect(measurement.exerciseTime, 10);
    });

    test('Exercise should be added accordingly', () {
      final measurement = Measurement(
        a1cLevel: 0,
        avgGlucoseLevel: 0,
        calories: 0,
        carbs: 0,
        currGlucoseLevel: 0,
        date: DateTime.now(),
        exerciseTime: 0,
        id: '1',
        lastUpdate: DateTime.now(),
        steps: 0,
        userId: '1',
      );

      measurement.addExercise(10, '1');
      expect(measurement.exerciseTime, 10);
    });

    test('Glucose should be set accordingly', () {
      final measurement = Measurement(
        a1cLevel: 0,
        avgGlucoseLevel: 0,
        calories: 0,
        carbs: 0,
        currGlucoseLevel: 0,
        date: DateTime.now(),
        exerciseTime: 0,
        id: '1',
        lastUpdate: DateTime.now(),
        steps: 0,
        userId: '1',
      );

      measurement.setGlucose(10, '1');
      expect(measurement.currGlucoseLevel, 10);
    });
  });
}
