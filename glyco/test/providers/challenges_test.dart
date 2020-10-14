// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/measurements.dart';

void main() {
  group('Challenges', () {
    test('Measurement calories and carbs should be incremented', () {
      final challenges = Measurements(
          avgMonthSteps: 8609,
          avgWeekSteps: 7809,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,

          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'steps');
      expect(challenges.providerChallengeGoal, 10);
    });
  });
}
