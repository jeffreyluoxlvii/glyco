import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:glyco/widgets/challenge_container.dart';
import 'package:glyco/widgets/progress_container.dart';
import '../../../../lib/screens/challenges_screen.dart';

void main() {
  Future<void> _buildChallenges(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChallengesScreen(),
      ),
    );
  }

  testWidgets('Challenges screen has the correct containers', (WidgetTester tester) async {
    await _buildChallenges(tester);
    expect(find.widgetWithText(Container, "Hear are today's goals:"), findsOneWidget);
    expect(
        find.widgetWithText(Container, "Your progress:"), findsOneWidget);
    expect(find.byType(ChallengeContainer), findsOneWidget);
    expect(find.byType(ProgressContainer), findsOneWidget);
  });
}
