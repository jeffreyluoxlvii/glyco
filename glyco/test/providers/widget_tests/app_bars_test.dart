import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../lib/widgets/appBars/analytics_app_bar.dart';
import '../../../lib/widgets/appBars/settings_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {

  Future<void> _buildAnalyticsAppBar(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnalyticsAppBar(),
        ),
      ),
    );
  }

  Future<void> _buildSettingsAppBar(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SettingsAppBar(),
        ),
      ),
    );
  }

  testWidgets('Analytics App Bar is built correctly', (WidgetTester tester) async {
    await _buildAnalyticsAppBar(tester);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('Settings App Bar is built correctly', (WidgetTester tester) async {
    await _buildSettingsAppBar(tester);
    expect(find.byType(AppBar), findsOneWidget);
  });


}
