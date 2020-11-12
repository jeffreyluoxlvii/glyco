import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../lib/providers/options.dart';
import '../../../../../lib/providers/settings.dart';
import '../../../../../lib/widgets/shortcuts/shortcuts_summary.dart';
import '../../../../../lib/widgets/shortcuts/exercise_shortcut_form.dart';
import '../../../../../lib/widgets/shortcuts/nutrition_shortcut_form.dart';
import 'package:mockito/mockito.dart';

class MockOptions extends Mock implements Options {}

class MockSettings extends Mock implements Settings {}

void main() {
  //final mockOptions = MockOptions();

  // Widget widgetForTesting({Widget child}) {
  //   return MaterialApp(
  //     home: child,
  //   );
  // }

  Future<void> _buildExerciseForm(WidgetTester tester) async {
    // await tester.pumpWidget(
    //   ChangeNotifierProvider<Options>.value(
    //     value: MockOptions(),
    //     child: ShortcutsSummary(),
    //   ),

    // );
    // await tester.pumpWidget(
    //   ChangeNotifierProvider<Settings>.value(
    //     value: MockSettings(),
    //     child: ShortcutsSummary(),
    //   ),

    // );
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Options>(
            create: (_) => MockOptions(),
          ),
          ChangeNotifierProvider<Settings>(
            create: (_) => MockSettings(),
          ),
        ],
        child: Builder(
          builder: (_) => ShortcutsSummary(),
        ),
      ),
    );
  }

  testWidgets('Forgot password screen has a form', (WidgetTester tester) async {
    await _buildExerciseForm(tester);
  });
}
