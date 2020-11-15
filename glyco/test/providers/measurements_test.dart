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

    test('Testing month average steps', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now(),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 10,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.monthSteps(), 0);
    });

    test('Testing week average steps', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 3)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 500,
            exerciseTime: 10,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 4)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 500,
            exerciseTime: 10,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.weekSteps(), 500);
    });

    test('Testing month average activity', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 8)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 9)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.monthActivity(), 60);
    });

    test('Testing month average activity should not be reading these days', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 3)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 4)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.monthActivity(), 0);
    });

    test('Testing week average activity', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 3)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 4)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.weekActivity(), 60);
    });

    test('Testing month average carbs', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 8)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 100,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 9)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 100,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.monthCarbs(), 100);
    });

    test('Testing week average carbs', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 3)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 100,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 4)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 0,
            exerciseTime: 60,
            calories: 0,
            carbs: 100,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.weekCarbs(), 100);
    });

    test('Testing generate challenge', () {
      final measurements = Measurements('0', '0', [
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 3)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 1000,
            exerciseTime: 10,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 4)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 1000,
            exerciseTime: 10,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '0',
            date: DateTime.now().subtract(Duration(days: 8)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 500,
            exerciseTime: 10,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0'),
        Measurement(
            id: '1',
            date: DateTime.now().subtract(Duration(days: 9)),
            lastUpdate: DateTime.now(),
            avgGlucoseLevel: 0,
            currGlucoseLevel: 0,
            steps: 500,
            exerciseTime: 10,
            calories: 0,
            carbs: 0,
            a1cLevel: 0,
            userId: '0')
      ]);

      expect(measurements.generateChallenge(),
          'Your steps this week have been 100% higher than the rest of the month. Keep up the good work!');
    });
  });
}
