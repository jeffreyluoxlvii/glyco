import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../lib/providers/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MockClient extends Mock implements http.Client {}

class MockAuth extends Mock implements Auth {}

void main() {
  const email = "test@gmail.com";
  const password = "test123";
  const firstName = "First";
  const lastName = "Test";
  Auth _auth;
  StreamController<Auth> _controller;

  setUp(() {
    _controller = StreamController<Auth>();
    _auth = Auth();
  });

  Future<void> _buildAuth(WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<Auth>.value(
        value: MockAuth(),
        child: Container(),
      ),
    );
  }

  testWidgets(
    'Created an account successfully',
    (WidgetTester tester) async {
      // final _providerKey = GlobalKey();
      // final _childKey = GlobalKey();
      // BuildContext context;
      // await tester.pumpWidget(StreamProvider(
      //   key: _providerKey,
      //   builder: (c) {
      //     context = c;
      //     return _controller.stream;
      //   },
      //   child: Container(key: _childKey),
      // ));
      // await _buildAuth(tester);
      // final context = tester.element(find.byType(Container));
      // await MockAuth().signUp(email, password, firstName, lastName);
      // expect(MockAuth().userEmail, email);
      // expect(Provider.of<Auth>(context, listen:false).userEmail, email);
      // await Provider.of<Auth>(tester).signUp(email, password, firstName, lastName);
      // await tester.pumpWidget(
      //   ChangeNotifierProvider<Auth>(
      //     create: (_) => Auth(firstName: firstName, lastName: lastName),
      //     child: Container(),
      //   ),
      // );
      // final context = tesfter.element(find.byType(Container));
      // await Provider.of<Auth>(context, listen:false).signUp(email, password, firstName, lastName);
      // expect(Provider.of<Auth>(context, listen:false).userEmail, email);
    },
  );
}
