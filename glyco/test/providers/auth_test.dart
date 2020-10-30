import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../lib/providers/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;


class MockClient extends Mock implements http.Client{}
void main() {
  const email = "test@gmail.com";
  const password = "test123";
  const firstName = "First";
  const lastName = "Test";
  //   testWidgets('Created an account successfully', 
  //   (WidgetTester tester) async {
  //     //var currentContext;
  //     await tester.pumpWidget(
  //       ChangeNotifierProvider<Auth>(
  //         create: (_) => Auth(firstName: firstName, lastName: lastName),
  //         child: Container(),
  //       ),
  //     );
  //     final context = tesfter.element(find.byType(Container));
  //     await Provider.of<Auth>(context, listen:false).signUp(email, password, firstName, lastName);
  //     expect(Provider.of<Auth>(context, listen:false).userEmail, email);
  //   });
  // });
}
