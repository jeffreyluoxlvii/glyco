import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../lib/screens/accounts/create_account_screen.dart';


void main() {

  Future<void> _buildCreateAcc(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CreateAccount(),
      ),
    );
  }

  testWidgets('Create accounts screen has a form', (WidgetTester tester) async {
    await _buildCreateAcc(tester);
    expect(find.widgetWithText(Container, "Welcome to Glyco"),
        findsOneWidget);
    expect(find.widgetWithText(Container, "Let's get started!"),
        findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(5));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.text(""), findsNWidgets(6));
  });
}