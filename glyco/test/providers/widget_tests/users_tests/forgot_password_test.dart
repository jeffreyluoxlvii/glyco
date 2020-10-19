import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../lib/screens/accounts/forgot_password_screen.dart';


void main() {

  Future<void> _buildForgotPass(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ForgotPassword(),
      ),
    );
  }

  testWidgets('Forgot password screen has a form', (WidgetTester tester) async {
    await _buildForgotPass(tester);
    expect(find.widgetWithText(Container, "Forgot password?"),
        findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(1));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.text(""), findsNWidgets(2));
  });
}