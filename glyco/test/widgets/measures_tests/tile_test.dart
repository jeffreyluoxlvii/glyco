import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:glyco/providers/measurement.dart';
import 'package:glyco/providers/measurements.dart';
import 'package:glyco/screens/measures_screen.dart';
import 'package:glyco/widgets/tiles/a1c_tile.dart';
import 'package:glyco/widgets/tiles/calories_tile.dart';
import 'package:glyco/widgets/tiles/exercise_tile.dart';
import 'package:glyco/widgets/tiles/glucose_tile.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockito/mockito.dart';

class MockMeasurements extends Mock implements Measurements {}

class MockMeasurement extends Mock implements Measurement {}

void main() async {
  Measurements mockMeasurements;
  Measurement mockMeasurement;
  setUp(() {
    mockMeasurements = MockMeasurements();
    mockMeasurement = MockMeasurement();
    when(mockMeasurement.a1cLevel).thenReturn(0);
    when(mockMeasurement.avgGlucoseLevel).thenReturn(0);
    when(mockMeasurement.calories).thenReturn(0);
    when(mockMeasurement.carbs).thenReturn(0);
    when(mockMeasurement.currGlucoseLevel).thenReturn(0);
    when(mockMeasurement.date).thenReturn(DateTime.now());
    when(mockMeasurement.exerciseTime).thenReturn(0);
    when(mockMeasurement.id).thenReturn('0');
    when(mockMeasurement.lastUpdate).thenReturn(DateTime.now());
    when(mockMeasurement.steps).thenReturn(0);
    when(mockMeasurement.userId).thenReturn('0');
    when(mockMeasurements.measurements).thenReturn([
      Measurement(
        id: '0',
        date: DateTime.now(),
        lastUpdate: DateTime.now(),
        avgGlucoseLevel: 0,
        currGlucoseLevel: 0,
        steps: 0,
        exerciseTime: 0,
        calories: 0,
        carbs: 0,
        a1cLevel: 0,
        userId: '0',
      )
    ]);
  });

  Future<void> _buildNutritionWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Measurement>.value(
            value: mockMeasurement,
          ),
          ChangeNotifierProvider<Measurements>.value(
            value: mockMeasurements,
          ),
        ],
        child: MaterialApp(
          home: CaloriesTile(),
        ),
      ),
    );
  }

  Future<void> _buildGlucoseWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Measurement>.value(
            value: mockMeasurement,
          ),
          ChangeNotifierProvider<Measurements>.value(
            value: mockMeasurements,
          ),
        ],
        child: MaterialApp(
          home: GlucoseTile(),
        ),
      ),
    );
  }

  Future<void> _buildA1CWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Measurement>.value(
            value: mockMeasurement,
          ),
          ChangeNotifierProvider<Measurements>.value(
            value: mockMeasurements,
          ),
        ],
        child: MaterialApp(
          home: A1CTile(),
        ),
      ),
    );
  }

  Future<void> _buildExerciseWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Measurement>.value(
            value: mockMeasurement,
          ),
          ChangeNotifierProvider<Measurements>.value(
            value: mockMeasurements,
          ),
        ],
        child: MaterialApp(
          home: ExerciseTile(),
        ),
      ),
    );
  }

  testWidgets('Nutrition Tile', (WidgetTester tester) async {
    await _buildNutritionWidget(tester);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('Glucose Tile', (WidgetTester tester) async {
    await _buildGlucoseWidget(tester);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(4));
    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('A1C Tile', (WidgetTester tester) async {
    await _buildA1CWidget(tester);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(4));
    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('Exercise Tile', (WidgetTester tester) async {
    await _buildExerciseWidget(tester);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(ClipRRect), findsOneWidget);
  });
}
