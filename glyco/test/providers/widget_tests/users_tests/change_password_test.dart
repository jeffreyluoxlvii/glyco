import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../lib/screens/accounts/change_password_screen.dart';

void main() {
  Future<void> _buildChangePass(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangePassword(),
        ),
      ),
    );
  }

  testWidgets('Change password screen has a form', (WidgetTester tester) async {
    await _buildChangePass(tester);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.text(""), findsNWidgets(3));
  });
}
