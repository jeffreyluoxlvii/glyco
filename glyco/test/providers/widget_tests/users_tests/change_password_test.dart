import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../lib/screens/accounts/change_password_screen.dart';


void main() {

  Future<void> _buildChangePass(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangePassword(),
      ),
    );
  }

  testWidgets('Change password screen has a form', (WidgetTester tester) async {
    await _buildChangePass(tester);
    expect(find.widgetWithText(Column, "Change Password"),
        findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.text(""), findsNWidgets(3));
  });
}