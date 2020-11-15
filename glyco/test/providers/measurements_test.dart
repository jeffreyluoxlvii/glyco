import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/measurement.dart';
import 'package:glyco/providers/measurements.dart';

void main() {
  group('Measurements', () {
    test('Find by date should find the measurement', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now(),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 0,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.findByDate(DateTime.now()),
          measurements.measurements[0]);
    });

    test('Find by date should not find a measurement and return null', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now(),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 0,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.findByDate(DateTime.utc(2000, 1)), null);
    });

    test('Find by date averages should find the measurement', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now(),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 0,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.findByDateAverages(DateTime.now()),
          measurements.measurements[0]);
    });
    test('Find by date averages should not find a measurement and return null',
        () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now(),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 0,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.findByDateAverages(DateTime.utc(2000, 1)), null);
    });
  });
}
