import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../../../glyco/lib/widgets/mainSettings/export_data_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  Future<void> _buildExportDataButton(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExportDataButton(),
        ),
      ),
    );
  }

  testWidgets('Export Data Button is built correctly', (WidgetTester tester) async {
    await _buildExportDataButton(tester);
    expect(find.byType(ClipRRect), findsOneWidget);
  });

}
