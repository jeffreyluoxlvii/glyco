import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import '../../../../lib/screens/login_screen.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  NavigatorObserver mockObserver;

  setUp(() {
    mockObserver = MockNavigatorObserver();
  });

  Future<void> _buildLogin(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
        navigatorObservers: [mockObserver],
      ),
    );
  }

  testWidgets('Login screen has a form', (WidgetTester tester) async {
    await _buildLogin(tester);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(GestureDetector, "or Create an Account"),
        findsOneWidget);
    expect(find.widgetWithText(GestureDetector, "Forgot Password?"),
        findsOneWidget);
    expect(find.text(""), findsNWidgets(3));
    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('Tapping create account button should navigate to that page',
      (WidgetTester tester) async {
    await _buildLogin(tester);
    await tester
        .tap(find.widgetWithText(GestureDetector, "or Create an Account"));
    await tester.pumpAndSettle();
    verify(mockObserver.didPush(any, any));
  });
}
