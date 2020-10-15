import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/measurements.dart';
import 'package:glyco/providers/measurement.dart';

void main() async {
  List<Measurement> measurements = [];

  for (int i = 0; i < 31; i++) {
    measurements.add(Measurement(
        a1cLevel: 0,
        avgGlucoseLevel: 0,
        calories: 0,
        carbs: (70 - i),
        currGlucoseLevel: 0,
        date: DateTime.now().subtract(Duration(days: i)),
        exerciseTime: (50 - i),
        id: 'progressTest',
        lastUpdate: DateTime.now().subtract(Duration(days: i)),
        steps: (5000 - i)));
  }

  group('Averages functions', () {
    test('Check monthSteps()', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.monthSteps();
      expect(progress.avgMonthSteps, 4981.5);
    });
    test('Check weekSteps()', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.weekSteps();
      expect(progress.avgWeekSteps, 4996.5);
    });
    test('Check monthActivity()', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.monthActivity();
      expect(progress.avgMonthActivity, 31.5);
    });
    test('Check weekActivity()', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.weekActivity();
      expect(progress.avgWeekActivity, 46.5);
    });
    test('Check monthCarbs()', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.monthCarbs();
      expect(progress.avgMonthCarbs, 51.5);
    });
    test('Check weekCarbs()', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.weekCarbs();
      expect(progress.avgWeekCarbs, 66.5);
    });
  });
}
