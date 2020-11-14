import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../../lib/widgets/mainSettings/editShortcuts/exercise_row.dart';
import '../../../../../lib/widgets/mainSettings/editShortcuts/food_rows.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {

  Future<void> _buildExerciseRow(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExerciseRow(
            icon: Icon(
              FontAwesomeIcons.running,
              color: Colors.black,
              size: 45,
            ),
            minutes: "40",
          ),
        ),
      ),
    );
  }

  Future<void> _buildFoodRow(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FoodRow(
            icon: Icon(
              FontAwesomeIcons.running,
              color: Colors.black,
              size: 45,
            ),
            carbs: "40",
          ),
        ),
      ),
    );
  }

  testWidgets('Exercise Row is built correctly', (WidgetTester tester) async {
    await _buildExerciseRow(tester);
    // expect(find.byType(Container), findsNWidgets(3));
    // expect(find.byType(SingleChildScrollView), findsOneWidget);
    // expect(find.byType(Column), findsNWidgets(2));
    // expect(find.byType(Text), findsNWidgets(5));
    // expect(find.byType(TextFormField), findsNWidgets(2));
    // expect(find.byType(Padding), findsNWidgets(2));
    // expect(find.byType(Spacer), findsNWidgets(2));
    // expect(find.byType(FlatButton), findsOneWidget);
    // expect(find.byType(SizedBox), findsNWidgets(9));
    // expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('Food Row is built correctly', (WidgetTester tester) async {
    await _buildFoodRow(tester);
    // expect(find.byType(Container), findsNWidgets(3));
    // expect(find.byType(SingleChildScrollView), findsOneWidget);
    // expect(find.byType(Column), findsNWidgets(2));
    // expect(find.byType(Text), findsNWidgets(5));
    // expect(find.byType(TextFormField), findsNWidgets(2));
    // expect(find.byType(Padding), findsNWidgets(2));
    // expect(find.byType(Spacer), findsNWidgets(2));
    // expect(find.byType(FlatButton), findsOneWidget);
    // expect(find.byType(SizedBox), findsNWidgets(9));
    // expect(find.byType(ClipRRect), findsOneWidget);
  });


}
