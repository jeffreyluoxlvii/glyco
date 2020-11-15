import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../lib/providers/auth.dart';
import '../../../../../lib/screens/change_settings_screen.dart';
import '../../../../../lib/screens/edits/edit_profile_screen.dart';
import '../../../../../lib/screens/accounts/change_email_screen.dart';
import '../../../../../lib/screens/accounts/change_name_screen.dart';
import '../../../../../lib/screens/accounts/change_password_screen.dart';
import 'package:mockito/mockito.dart';


class MockAuth extends Mock implements Auth {}

void main() async {
  const email = "test@gmail.com";
  const firstName = "First";
  const lastName = "Test";
  const token = "123123qwerty";
  const userID = "FirstTest123";
  Auth mockAuth;
  setUp(() {
    mockAuth = MockAuth();
    when(mockAuth.userEmail).thenReturn(email);
    when(mockAuth.userName).thenReturn(firstName + " " + lastName);
    when(mockAuth.token).thenReturn(token);
    when(mockAuth.userId).thenReturn(userID);
  });

  Future<void> _buildChangeEmail(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Auth>.value(
          value: mockAuth,
          child: Scaffold(
            body: ChangeEmail(),
          ),
        ),
      ),
    );
  }

  Future<void> _buildChangeName(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Auth>.value(
          value: mockAuth,
          child: Scaffold(
            body: ChangeName(),
          ),
        ),
      ),
    );
  }

  Future<void> _buildChangePassword(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Auth>.value(
          value: mockAuth,
          child: Scaffold(
            body: ChangePassword(),
          ),
        ),
      ),
    );
  }

  Future<void> _buildEditProfile(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Auth>.value(
          value: mockAuth,
          child: Scaffold(
            body: EditProfile(),
          ),
        ),
      ),
    );
  }

  Future<void> _buildChangeSettingsScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Auth>.value(
          value: mockAuth,
          child: Scaffold(
            body: ChangeSettingsScreen(),
          ),
        ),
      ),
    );
  }

  testWidgets('Change Email has a form', (WidgetTester tester) async {
    await _buildChangeEmail(tester);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(Padding), findsNWidgets(2));
    expect(find.byType(Spacer), findsNWidgets(2));
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(9));
    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('Change Name has a form', (WidgetTester tester) async {
    await _buildChangeName(tester);
    expect(find.byType(Container), findsNWidgets(4));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(Padding), findsNWidgets(2));
    expect(find.byType(Spacer), findsNWidgets(2));
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(9));
    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('Change Password has a form', (WidgetTester tester) async {
    await _buildChangePassword(tester);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(Padding), findsNWidgets(2));
    expect(find.byType(Spacer), findsNWidgets(2));
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(9));
    expect(find.byType(ClipRRect), findsOneWidget);
  });

  testWidgets('Edit Profile is built correctly', (WidgetTester tester) async {
    await _buildEditProfile(tester);
    expect(find.byType(Container), findsNWidgets(4));
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(Row), findsNWidgets(3));
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(8));
    expect(find.byType(Padding), findsNWidgets(6));
    expect(find.byType(Spacer), findsNWidgets(3));
    expect(find.byType(SizedBox), findsNWidgets(8));
  });

  testWidgets('Change Settings Screen is built correctly', (WidgetTester tester) async {
    await _buildChangeSettingsScreen(tester);
    expect(find.byType(Scaffold), findsNWidgets(2));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(5));
    expect(find.byType(Column), findsNWidgets(3));
  });
}
