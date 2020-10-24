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
  group('Get functions', () {
    test('getChallenge() and getChallengeGoal()', () {
      final progress = Measurements(
          avgMonthSteps: 6609,
          avgWeekSteps: 7809,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingTrue();
      progress.generateChallenge();
      expect(progress.getChallenge(), 'steps');
      expect(progress.getChallengeGoal(), 7900);
    });
  });
  group('Progess Update', () {
    test('Check progress update for steps challenge', () {
      final progress = Measurements(
          avgMonthSteps: 6609,
          avgWeekSteps: 7809,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.setTestingTrue();
      progress.generateChallenge();
      progress.progressUpdate();
      expect(progress.providerChallengeGiven, 'steps');
      expect(progress.stepsProgress, 5000);
    });
    test('Check progress update for activity challenge', () {
      final progress = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 30,
          avgWeekActivity: 35,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.setTestingTrue();
      progress.generateChallenge();
      progress.progressUpdate();
      expect(progress.providerChallengeGiven, 'activity');
      expect(progress.activityProgress, 50);
    });
    test('Check progress update for carbs challenge', () {
      final progress = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 40,
          avgWeekActivity: 35,
          avgMonthCarbs: 40,
          avgWeekCarbs: 50,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      progress.setTestingMeasurements(measurements);
      progress.setTestingTrue();
      progress.generateChallenge();
      progress.progressUpdate();
      expect(progress.providerChallengeGiven, 'carbs');
      expect(progress.carbProgress, 70);
    });
  });
}
