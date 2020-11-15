import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:glyco/providers/measurement.dart';
import 'package:glyco/providers/measurements.dart';
import 'package:glyco/screens/about_screen.dart';
import 'package:mockito/mockito.dart';

class MockMeasurements extends Mock implements Measurements {}

class MockMeasurement extends Mock implements Measurement {}

void main() async {
  Future<void> _buildMeasurementGrid(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AboutScreen(),
      ),
    );
  }

  testWidgets('About Screen', (WidgetTester tester) async {
    await _buildMeasurementGrid(tester);
    expect(find.byType(Text), findsNWidgets(10));
  });
}
