import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../lib/providers/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

//class MockClient extends Mock implements TokenProvider{}
void main() {
  const email = "test@gmail.com";
  const password = "test123";
  const firstName = "First";
  const lastName = "Test";

  // test('returns a Post if the http call completes successfully', () async{
  //   final client = MockClient();
  //   when(client.get(''))
  // });
  testWidgets('Created an account successfully', (WidgetTester tester) async {
    //var currentContext;
    // await tester.pumpWidget(
    //   Provider<Auth>(
    //     child: Container(),
    //   ),
    // );
    final auth = Auth();
    
    final context = tester.element(find.byType(Container));
    await auth
        .signUp(email, password, firstName, lastName);
    expect(auth.userEmail, email);
  });
}
