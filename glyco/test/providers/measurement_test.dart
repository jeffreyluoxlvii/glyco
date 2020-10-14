// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/measurement.dart';

void main() {
  group('Measurement', () {
    test('Measurement calories and carbs should be incremented', () {
      final measurement = Measurement(
          a1cLevel: 0,
          avgGlucoseLevel: 0,
          calories: 0,
          carbs: 0,
          currGlucoseLevel: 0,
          date: DateTime.now(),
          exerciseTime: 0,
          id: 'test1',
          lastUpdate: DateTime.now(),
          steps: 0);

      measurement.addNutrition(10);
      expect(measurement.calories, 40);
      expect(measurement.carbs, 10);
    });
    test('Measurement exercise time should be incremented', () {
      final measurement = Measurement(
          a1cLevel: 0,
          avgGlucoseLevel: 0,
          calories: 0,
          carbs: 0,
          currGlucoseLevel: 0,
          date: DateTime.now(),
          exerciseTime: 0,
          id: 'test1',
          lastUpdate: DateTime.now(),
          steps: 0);

      measurement.addExercise(30);
      expect(measurement.exerciseTime, 30);
    });
  });
}
