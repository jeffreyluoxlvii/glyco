import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../../lib/screens/settings_screen.dart';


void main() {

  //To do: Properly build screen so that all providers can be used

  Future<void> _buildSettings(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SettingsScreen(),
      ),
    );
  }

  // testWidgets('Settings screen has all of its widgets', (WidgetTester tester) async {
  //   await _buildSettings(tester);
  //   expect(find.byType(TextFormField), findsNWidgets(5));
    // expect(find.widgetWithText(Container, "Forgot password?"),
    //     findsOneWidget);
    // expect(find.byType(TextFormField), findsNWidgets(1));
    // expect(find.byType(ClipRRect), findsOneWidget);
    // expect(find.text(""), findsNWidgets(2));
  // });
}