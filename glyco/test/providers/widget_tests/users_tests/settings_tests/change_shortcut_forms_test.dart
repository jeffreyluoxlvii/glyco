import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:glyco/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import '../../../../../lib/providers/options.dart';
import '../../../../../lib/providers/settings.dart';
import '../../../../../lib/widgets/shortcuts/shortcuts_summary.dart';
import '../../../../../lib/widgets/shortcuts/exercise_shortcut_form.dart';
import '../../../../../lib/widgets/shortcuts/nutrition_shortcut_form.dart';
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

  Widget wrapWithMaterial() => MaterialApp(
        home: Provider<Options>(
          create: (_) => mockOptions,
          child: ExerciseShortcutForm(),
        ),
      );

  Future<void> _buildExerciseForm(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Options>.value(
          value: mockOptions,
          child: Column(
            children: [
              ExerciseShortcutForm(),
            ],
          ),
        ),
      ),
    );
  }

  // );
  // await tester.pumpWidget(
  //   ChangeNotifierProvider<Settings>.value(
  //     value: MockSettings(),
  //     child: ShortcutsSummary(),
  //   ),

  // );
  // await tester.pumpWidget(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider<Options>(
  //         create: (_) => mockOptions,
  //       ),
  //       ChangeNotifierProvider<Settings>(
  //         create: (_) => mockSettings,
  //       ),
  //     ],
  //     child: Builder(
  //       builder: (_) => ShortcutsSummary(),
  //     ),
  //   ),
  // );
  // }

  testWidgets('Forgot password screen has a form', (WidgetTester tester) async {
    print(mockSettings.mealCarbs);
    await _buildExerciseForm(tester);
  });
}
