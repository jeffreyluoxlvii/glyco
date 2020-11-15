import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../glyco/lib/screens/view_analytics.dart';
import '../../../glyco/lib/providers/auth.dart';
import 'package:mockito/mockito.dart';
import 'dart:async';

class MockAuth extends Mock implements Auth {}

void main() async {
  Auth mockAuth;
  const firstName = "First";
  const lastName = "Test";

  setUp(() {
    mockAuth = MockAuth();
    when(mockAuth.userName).thenReturn(firstName + " " + lastName);
  });

  Future<void> _buildViewAnalyticsScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Auth>.value(
          value: mockAuth,
          child: Scaffold(
            body: ViewAnalyticsScreen(),
          ),
        ),
      ),
    );
  }

  testWidgets('Exercise Bars is built correctly', (WidgetTester tester) async {
    await _buildViewAnalyticsScreen(tester);
    expect(find.byType(Scaffold), findsNWidgets(3));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(4));
    expect(find.byType(Padding), findsNWidgets(17));
  });
}
