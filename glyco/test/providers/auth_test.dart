import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../lib/providers/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// class MockAuth extends Mock implements Auth {}

void main() {
  Auth auth;

  setUp(() {
    auth = Auth();
  });

  Future<void> _buildAuth(WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<Auth>.value(
        value: auth,
        child: Container(),
      ),
    );
  }

  testWidgets(
    'Created an account successfully',
    (WidgetTester tester) async {
      await _buildAuth(tester);
    },
  );
}
