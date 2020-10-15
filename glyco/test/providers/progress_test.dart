import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/measurements.dart';
import 'package:glyco/providers/measurement.dart';

void main() async {
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

      progress.generateChallenge();
      expect(progress.getChallenge(), 'steps');
      expect(progress.getChallengeGoal(), 7900);
    });
  });
  // group('Progess Update', () {
  //   test('Check progress update for steps challenge', () {
  //     final progress = Measurements(
  //         avgMonthSteps: 6609,
  //         avgWeekSteps: 7809,
  //         avgMonthActivity: 0,
  //         avgWeekActivity: 0,
  //         avgMonthCarbs: 0,
  //         avgWeekCarbs: 0,
  //         providerChallengeGiven: 'null',
  //         providerChallengeGoal: -1,
  //         stepsProgress: 0,
  //         activityProgress: 0,
  //         carbProgress: 0);
  //     final measurement = Measurement(
  //         a1cLevel: 0,
  //         avgGlucoseLevel: 0,
  //         calories: 0,
  //         carbs: 0,
  //         currGlucoseLevel: 0,
  //         date: DateTime.now(),
  //         exerciseTime: 0,
  //         id: 'test1',
  //         lastUpdate: DateTime.now(),
  //         steps: 20);

  //     progress.generateChallenge();
  //     expect(progress.providerChallengeGiven, 'steps');
  //     expect(progress.stepsProgress, 20);
  //   });
  // });
}
