import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../../../lib/screens/settings_screen.dart';
import '../../../../../lib/widgets/shortcuts/shortcuts_summary.dart';
import '../../../../../lib/providers/auth.dart';
import '../../../../../lib/providers/options.dart';
import '../../../../../lib/providers/settings.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock implements Auth {}

class MockOptions extends Mock implements Options {}

class MockSettings extends Mock implements Settings {}

void main() {
  const email = "test@gmail.com";
  const firstName = "First";
  const lastName = "Test";
  const token = "123123qwerty";
  const userID = "FirstTest123";
  Auth mockAuth;
  Options mockOptions;
  Settings mockSettings;

  setUp(() {
    mockAuth = MockAuth();
    mockOptions = MockOptions();
    mockSettings = MockSettings();
    when(mockAuth.userEmail).thenReturn(email);
    when(mockAuth.userName).thenReturn(firstName + " " + lastName);
    when(mockAuth.token).thenReturn(token);
    when(mockAuth.userId).thenReturn(userID);
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

  Future<void> _buildSettingsScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Options>.value(
            value: mockOptions,
          ),
          ChangeNotifierProvider<Auth>.value(
            value: mockAuth,
          ),
          ChangeNotifierProvider<Settings>.value(
            value: mockSettings,
          ),
        ],
        child: MaterialApp(
          home: SettingsScreen(),
        ),
      ),
    );
  }

  testWidgets('Settings screen has all of its widgets',
      (WidgetTester tester) async {
    await _buildSettingsScreen(tester);
    // expect(find.byType(TextFormField), findsNWidgets(5));
    // expect(find.widgetWithText(Container, "Forgot password?"),
    //     findsOneWidget);
    // expect(find.byType(TextFormField), findsNWidgets(1));
    // expect(find.byType(ClipRRect), findsOneWidget);
    // expect(find.text(""), findsNWidgets(2));
  });
}
