
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wiem_test_project/UI/widgets/mydrawer.widget.dart';

void main() {
  testWidgets('Le test du drawer d\'un visiteur', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          drawer: myDrawer(),
        ),
      ),
    );

    scaffoldKey.currentState?.openDrawer();
    await tester.pump();
    expect(find.byType(ListTile),findsNWidgets(2));

  });
}