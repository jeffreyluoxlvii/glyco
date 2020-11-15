import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../lib/widgets/viewAnalytics/exercise_bars.dart';
import '../../../../lib/widgets/viewAnalytics/carb_pie.dart';
import '../../../../lib/widgets/viewAnalytics/glucose_line.dart';
import '../../../../lib/widgets/viewAnalytics/glucose_pie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {

  Future<void> _buildExerciseBars(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExerciseBarChart(),
        ),
      ),
    );
  }

  Future<void> _buildCarbPie(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CarbPie(),
        ),
      ),
    );
  }

  Future<void> _buildGlucoseLine(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GlucoseLineChart(),
        ),
      ),
    );
  }

  Future<void> _buildGlucosePie(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GlucosePie(),
        ),
      ),
    );
  }

  testWidgets('Exercise Row is built correctly', (WidgetTester tester) async {
    await _buildExerciseBars(tester);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(AspectRatio), findsOneWidget);
    expect(find.byType(BarChart), findsOneWidget);
  });

  testWidgets('Food Row is built correctly', (WidgetTester tester) async {
    await _buildCarbPie(tester);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(Row), findsNWidgets(5));
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('Food Row is built correctly', (WidgetTester tester) async {
    await _buildGlucoseLine(tester);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(2));
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('Food Row is built correctly', (WidgetTester tester) async {
    await _buildGlucosePie(tester);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Row), findsNWidgets(5));
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);
  });


}
