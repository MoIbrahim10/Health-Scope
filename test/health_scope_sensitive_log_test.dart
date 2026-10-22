import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthscope/components/search_field.dart' as shared_search;
import 'package:healthscope/screens/Doctor/DoctorCurrentPatients/Doctor_currentpatient_screen.dart'
    as doctor_search;
import 'package:healthscope/screens/Patient/Appoinment_screen/body.dart'
    as appointment_search;
import 'package:healthscope/size_config.dart';

const _syntheticSearchText = 'health-scope-private-search-regression-marker';

Widget _testApp(Widget child) {
  return MaterialApp(
    home: Builder(
      builder: (context) {
        SizeConfig().init(context);
        return Scaffold(body: child);
      },
    ),
  );
}

Future<void> _expectSearchFieldAcceptsText(
  WidgetTester tester,
  Widget searchField,
) async {
  await tester.pumpWidget(_testApp(searchField));
  await tester.enterText(find.byType(TextField), _syntheticSearchText);
  await tester.pump();
  expect(find.text(_syntheticSearchText), findsOneWidget);
}

void main() {
  testWidgets('shared search field accepts text', (tester) async {
    await _expectSearchFieldAcceptsText(
      tester,
      const shared_search.SearchField(),
    );
  });

  testWidgets('doctor search field accepts text', (tester) async {
    await _expectSearchFieldAcceptsText(
      tester,
      const doctor_search.SearchField(),
    );
  });

  testWidgets('appointment search field accepts text', (tester) async {
    await _expectSearchFieldAcceptsText(
      tester,
      const appointment_search.SearchField(),
    );
  });

  test('sensitive inputs and Firebase snapshots are not printed', () {
    final sourceFiles = <String>[
      'lib/components/search_field.dart',
      'lib/screens/Doctor/DoctorCurrentPatients/Doctor_currentpatient_screen.dart',
      'lib/screens/Doctor/DoctorCurrentPatients/PatientResust_dscreen.dart',
      'lib/screens/Patient/Appoinment_screen/body.dart',
      'lib/screens/Patient/PatientMyResultScreen/Patient_result_screen.dart',
    ];
    final sensitivePrint = RegExp(
      r'print\s*\(\s*(?:value|snapshot\.value)\s*\)',
    );

    for (final path in sourceFiles) {
      final source = File(path).readAsStringSync();
      expect(sensitivePrint.hasMatch(source), isFalse, reason: path);
    }
  });
}
