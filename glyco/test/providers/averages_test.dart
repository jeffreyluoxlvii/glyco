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

  List<Measurement> measurements2 = [];

  for (int i = 0; i < 31; i++) {
    measurements2.add(Measurement(
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

  measurements2[1] = Measurement(
      a1cLevel: 0,
      avgGlucoseLevel: 0,
      calories: 0,
      carbs: 0,
      currGlucoseLevel: 0,
      date: DateTime.now().subtract(Duration(days: 1)),
      exerciseTime: 0,
      id: 'progressTest',
      lastUpdate: DateTime.now().subtract(Duration(days: 1)),
      steps: 0);
  measurements2[7] = Measurement(
      a1cLevel: 0,
      avgGlucoseLevel: 0,
      calories: 0,
      carbs: 0,
      currGlucoseLevel: 0,
      date: DateTime.now().subtract(Duration(days: 7)),
      exerciseTime: 0,
      id: 'progressTest',
      lastUpdate: DateTime.now().subtract(Duration(days: 7)),
      steps: 0);

  // List<Measurement> measurements3 = [];

  // for (int i = 0; i < 30; i++) {
  //   if (i == 6) {
  //     continue;
  //   }
  //   measurements3.add(Measurement(
  //       a1cLevel: 0,
  //       avgGlucoseLevel: 0,
  //       calories: 0,
  //       carbs: (70 - i),
  //       currGlucoseLevel: 0,
  //       date: DateTime.now().subtract(Duration(days: i)),
  //       exerciseTime: (50 - i),
  //       id: 'progressTest',
  //       lastUpdate: DateTime.now().subtract(Duration(days: i)),
  //       steps: (5000 - i)));
  // }

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

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements);
      progress.monthSteps();
      expect(progress.avgMonthSteps, 4981.5);
    });
    test('Check monthSteps() with 0 value', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements2);
      progress.monthSteps();
      expect(progress.avgMonthSteps, 4981);
    });
    // test('Check monthSteps() with null value', () {
    //   final progress = Measurements(
    //       avgMonthSteps: -1,
    //       avgWeekSteps: -1,
    //       avgMonthActivity: -1,
    //       avgWeekActivity: -1,
    //       avgMonthCarbs: -1,
    //       avgWeekCarbs: -1,
    //       providerChallengeGiven: 'null',
    //       providerChallengeGoal: -1);

    //   progress.setTestingFalse();
    //   progress.setTestingMeasurements(measurements3);
    //   progress.monthSteps();
    //   expect(progress.avgMonthSteps, 4982);
    // });
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

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements);
      progress.weekSteps();
      expect(progress.avgWeekSteps, 4996.5);
    });
    test('Check weekSteps() with 0 value', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements2);
      progress.weekSteps();
      expect(progress.avgWeekSteps, 4996);
    });
    // test('Check weekSteps() with null value', () {
    //   final progress = Measurements(
    //       avgMonthSteps: -1,
    //       avgWeekSteps: -1,
    //       avgMonthActivity: -1,
    //       avgWeekActivity: -1,
    //       avgMonthCarbs: -1,
    //       avgWeekCarbs: -1,
    //       providerChallengeGiven: 'null',
    //       providerChallengeGoal: -1);

    //   progress.setTestingFalse();
    //   progress.setTestingMeasurements(measurements3);
    //   progress.weekSteps();
    //   expect(progress.avgWeekSteps, 4997);
    // });
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

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements);
      progress.monthActivity();
      expect(progress.avgMonthActivity, 31.5);
    });
    test('Check monthActivity() with 0 value', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements2);
      progress.monthActivity();
      expect(progress.avgMonthActivity, 31);
    });
    // test('Check monthActivity() with null value', () {
    //   final progress = Measurements(
    //       avgMonthSteps: -1,
    //       avgWeekSteps: -1,
    //       avgMonthActivity: -1,
    //       avgWeekActivity: -1,
    //       avgMonthCarbs: -1,
    //       avgWeekCarbs: -1,
    //       providerChallengeGiven: 'null',
    //       providerChallengeGoal: -1);

    //   progress.setTestingFalse();
    //   progress.setTestingMeasurements(measurements3);
    //   progress.monthActivity();
    //   expect(progress.avgMonthActivity, 32);
    // });
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

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements);
      progress.weekActivity();
      expect(progress.avgWeekActivity, 46.5);
    });
    test('Check weekActivity() with 0 value', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements2);
      progress.weekActivity();
      expect(progress.avgWeekActivity, 46);
    });
    // test('Check weekActivity() with null value', () {
    //   final progress = Measurements(
    //       avgMonthSteps: -1,
    //       avgWeekSteps: -1,
    //       avgMonthActivity: -1,
    //       avgWeekActivity: -1,
    //       avgMonthCarbs: -1,
    //       avgWeekCarbs: -1,
    //       providerChallengeGiven: 'null',
    //       providerChallengeGoal: -1);

    //   progress.setTestingFalse();
    //   progress.setTestingMeasurements(measurements3);
    //   progress.weekActivity();
    //   expect(progress.avgWeekActivity, 47);
    // });
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

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements);
      progress.monthCarbs();
      expect(progress.avgMonthCarbs, 51.5);
    });
    test('Check monthCarbs() with 0 value', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements2);
      progress.monthCarbs();
      expect(progress.avgMonthCarbs, 51);
    });
    // test('Check monthCarbs() with null value', () {
    //   final progress = Measurements(
    //       avgMonthSteps: -1,
    //       avgWeekSteps: -1,
    //       avgMonthActivity: -1,
    //       avgWeekActivity: -1,
    //       avgMonthCarbs: -1,
    //       avgWeekCarbs: -1,
    //       providerChallengeGiven: 'null',
    //       providerChallengeGoal: -1);

    //   progress.setTestingFalse();
    //   progress.setTestingMeasurements(measurements3);
    //   progress.monthCarbs();
    //   expect(progress.avgMonthCarbs, 52);
    // });
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

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements);
      progress.weekCarbs();
      expect(progress.avgWeekCarbs, 66.5);
    });
    test('Check weekCarbs() with 0 value', () {
      final progress = Measurements(
          avgMonthSteps: -1,
          avgWeekSteps: -1,
          avgMonthActivity: -1,
          avgWeekActivity: -1,
          avgMonthCarbs: -1,
          avgWeekCarbs: -1,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingFalse();
      progress.setTestingMeasurements(measurements2);
      progress.weekCarbs();
      expect(progress.avgWeekCarbs, 66);
    });
    // test('Check weekCarbs() with null value', () {
    //   final progress = Measurements(
    //       avgMonthSteps: -1,
    //       avgWeekSteps: -1,
    //       avgMonthActivity: -1,
    //       avgWeekActivity: -1,
    //       avgMonthCarbs: -1,
    //       avgWeekCarbs: -1,
    //       providerChallengeGiven: 'null',
    //       providerChallengeGoal: -1);

    //   progress.setTestingFalse();
    //   progress.setTestingMeasurements(measurements3);
    //   progress.weekCarbs();
    //   expect(progress.avgWeekCarbs, 67);
    // });
  });
}
