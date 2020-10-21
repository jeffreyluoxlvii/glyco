import 'package:flutter_test/flutter_test.dart';
import 'package:glyco/providers/measurements.dart';

void main() async {
  group('Challenges Steps', () {
    test('weekSteps() > monthSteps() returns congratulatory remark', () {
      final challenges = Measurements(
          avgMonthSteps: 6609,
          avgWeekSteps: 7809,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'steps');
      expect(challenges.providerChallengeGoal, 7900);
    });
    test(
        'weekSteps() > monthSteps() returns congratulatory remark if monthSteps() == 0',
        () {
      final challenges = Measurements(
          avgMonthSteps: 0,
          avgWeekSteps: 7809,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'steps');
      expect(challenges.providerChallengeGoal, 7900);
    });
    test('15%+ reduction in steps returns a step goal to increase steps by 25%',
        () {
      final challenges = Measurements(
          avgMonthSteps: 7500,
          avgWeekSteps: 5600,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'steps');
      expect(challenges.providerChallengeGoal, 7000);
    });
    test('Below daily recommended steps edge case', () {
      final challenges = Measurements(
          avgMonthSteps: 2500,
          avgWeekSteps: 2450,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'steps');
      expect(challenges.providerChallengeGoal, 3000);
    });
    test('Above daily recommended steps edge case', () {
      final challenges = Measurements(
          avgMonthSteps: 10100,
          avgWeekSteps: 10050,
          avgMonthActivity: 0,
          avgWeekActivity: 0,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'steps');
      expect(challenges.providerChallengeGoal, 10200);
    });
  });

  group('Challenges Activity', () {
    test('weekActivity() > monthActivity() returns congratulatory remark', () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 30,
          avgWeekActivity: 35,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'activity');
      expect(challenges.providerChallengeGoal, 50);
    });
    test(
        'weekActivity() > monthActivity() returns congratulatory remark if monthActivity() == 0',
        () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 0,
          avgWeekActivity: 35,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'activity');
      expect(challenges.providerChallengeGoal, 50);
    });
    test(
        '15%+ reduction in activity returns a goal to increase activity by 25%',
        () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 50,
          avgWeekActivity: 40,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'activity');
      expect(challenges.providerChallengeGoal, 50);
    });
    test('Below daily recommended activity edge case', () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 26,
          avgWeekActivity: 25,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'activity');
      expect(challenges.providerChallengeGoal, 30);
    });
    test('Above daily recommended activity edge case', () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 70,
          avgWeekActivity: 65,
          avgMonthCarbs: 0,
          avgWeekCarbs: 0,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'activity');
      expect(challenges.providerChallengeGoal, 80);
    });
  });

  group('Challenges Carbs', () {
    test('weekCarbs() < monthCarbs() returns congratulatory remark', () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 40,
          avgWeekActivity: 35,
          avgMonthCarbs: 50,
          avgWeekCarbs: 45,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'carbs');
      expect(challenges.providerChallengeGoal, 60);
    });
    test(
        'weekCarbs() < monthCarbs() returns congratulatory remark if monthCarbs() == 0',
        () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 40,
          avgWeekActivity: 35,
          avgMonthCarbs: 0,
          avgWeekCarbs: 45,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'carbs');
      expect(challenges.providerChallengeGoal, 60);
    });
    test('15%+ increase in carbs returns a goal to decrease carbs by 15%', () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 40,
          avgWeekActivity: 35,
          avgMonthCarbs: 40,
          avgWeekCarbs: 50,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'carbs');
      expect(challenges.providerChallengeGoal, 43);
    });
    test('Above daily recommended carbs edge case', () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 40,
          avgWeekActivity: 35,
          avgMonthCarbs: 75,
          avgWeekCarbs: 76,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'carbs');
      expect(challenges.providerChallengeGoal, 75);
    });
    test('Below daily recommended carbs edge case', () {
      final challenges = Measurements(
          avgMonthSteps: 3100,
          avgWeekSteps: 3050,
          avgMonthActivity: 40,
          avgWeekActivity: 35,
          avgMonthCarbs: 35,
          avgWeekCarbs: 36,
          providerChallengeGiven: 'null',
          providerChallengeGoal: -1);

      challenges.setTestingTrue();
      challenges.generateChallenge();
      expect(challenges.providerChallengeGiven, 'carbs');
      expect(challenges.providerChallengeGoal, 50);
    });
  });

  // possibly go back in and add a group for complicated inputs
}
