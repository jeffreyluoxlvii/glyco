import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../lib/providers/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// class MockAuth extends Mock implements Auth {}

void main() {
  const email = "test@gmail.com";
  const password = "123456";
  const firstName = "First";
  const lastName = "Test";
  const token = "123123qwerty";
  const userID = "FirstTest123";
  const secondEmail = "test@gmail.com";
  const secondName = "Second";
  

  Auth mockAuth;

  // setUp(() {
  //   mockAuth = MockAuth();
  // });

  Future<void> _buildAuth(WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<Auth>.value(
        value: Auth(),
        child: Container(),
      ),
    );
  }

  testWidgets(
    'Created an account successfully',
    (WidgetTester tester) async {
      // await _buildAuth(tester);
      // // when(Auth().signUp(email, password, firstName, lastName)).thenAnswer();
      // when(mockAuth.userName).thenReturn(firstName + " " + lastName);
      // await Auth().signUp(email, password, firstName, lastName);
      // await Auth().signIn(email, password);
      // when(mockAuth.userEmail).thenReturn(email);
      // when(mockAuth.userName).thenReturn(firstName + " " + lastName);
      // when(mockAuth.token).thenReturn(token);
      // when(mockAuth.userId).thenReturn(userID);
      // expect(mockAuth.userEmail, email);
      // expect(mockAuth.userName, firstName + " " + lastName);
      // expect(mockAuth.token, token);
      // expect(mockAuth.userId, userID);
    },
  );

  // testWidgets(
  //   'Changed profile settings successfully',
  //   (WidgetTester tester) async {
  //     await _buildAuth(tester);
  //     await mockAuth.changeName(secondName + " " +lastName);
  //     when(mockAuth.userName).thenReturn(secondName + " " + lastName);
  //     expect(mockAuth.userName, secondName + " " + lastName);

  //     await mockAuth.changeProfile("email", secondEmail);
  //     when(mockAuth.userEmail).thenReturn(secondEmail);
  //     expect(mockAuth.userEmail, secondEmail);
  //   },
  // );

  // testWidgets(
  //   'Logged out successfully',
  //   (WidgetTester tester) async {
  //     await _buildAuth(tester);
  //     await mockAuth.logout();
  //     when(mockAuth.userEmail).thenReturn(null);
  //     when(mockAuth.userName).thenReturn(null);
  //     when(mockAuth.token).thenReturn(null);
  //     when(mockAuth.userId).thenReturn(null);
  //     expect(mockAuth.userEmail, null);
  //     expect(mockAuth.userName, null);
  //     expect(mockAuth.token, null);
  //     expect(mockAuth.userId, null);
  //   },
  // );
}
