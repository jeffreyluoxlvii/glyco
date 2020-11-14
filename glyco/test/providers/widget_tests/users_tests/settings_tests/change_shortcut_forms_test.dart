import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../lib/providers/options.dart';
import '../../../../../lib/providers/settings.dart';
import '../../../../../lib/widgets/shortcuts/shortcuts_summary.dart';
import '../../../../../lib/widgets/shortcuts/exercise_shortcut_form.dart';
import '../../../../../lib/widgets/shortcuts/nutrition_shortcut_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockito/mockito.dart';

class MockOptions extends Mock implements Options {}

class MockSettings extends Mock implements Settings {}

void main() async {
  Options mockOptions;
  Settings mockSettings;
  setUp(() {
    mockOptions = MockOptions();
    mockSettings = MockSettings();
    when(mockSettings.drinkCarbs).thenReturn(15);
    when(mockSettings.exerciseTime).thenReturn(45);
    when(mockSettings.mealCarbs).thenReturn(50);
    when(mockSettings.snackCarbs).thenReturn(25);
    when(mockOptions.settings).thenReturn(Settings(
        drinkCarbs: 15,
        exerciseTime: 45,
        mealCarbs: 50,
        snackCarbs: 25,
        userId: "123456"));
  });

  Future<void> _buildExerciseForm(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Options>.value(
          value: mockOptions,
          child: Scaffold(
            body: ExerciseShortcutForm(),
          ),
        ),
      ),
    );
  }

  Future<void> _buildNutritionForm(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Options>.value(
          value: mockOptions,
          child: Scaffold(
            body: ShortcutForm(FontAwesomeIcons.mugHot, "DRINK"),
          ),
        ),
      ),
    );
  }

  Future<void> _buildShortcutsSummary(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Options>.value(
            value: mockOptions,
          ),
          ChangeNotifierProvider<Settings>.value(
            value: mockSettings,
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: ShortcutsSummary(),
          ),
        ),
      ),
    );
  }

  testWidgets('Exercise Shortcut has a form', (WidgetTester tester) async {
    await _buildExerciseForm(tester);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(3));
    expect(find.byType(RaisedButton), findsNWidgets(2));
  });

  testWidgets('Nutrition Shortcut has a form', (WidgetTester tester) async {
    await _buildNutritionForm(tester);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(3));
    expect(find.byType(RaisedButton), findsNWidgets(2));
  });

  testWidgets('Shortcuts Summary is built correctly', (WidgetTester tester) async {
    await _buildShortcutsSummary(tester);
    expect(find.byType(InkWell), findsNWidgets(4));
    expect(find.byType(Container), findsNWidgets(4));
    expect(find.byType(Row), findsNWidgets(6));
    expect(find.byType(Column), findsNWidgets(5));
    expect(find.byType(SizedBox), findsNWidgets(8));
    expect(find.byType(Icon), findsNWidgets(4));
    expect(find.byType(Padding), findsNWidgets(8));
  });
}
