
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wiem_test_project/UI/widgets/connected.drawer.widget.dart';

void main() {
  testWidgets('Le test du drawer d\'un profil connecté', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          drawer: connectedDrawer(),
        ),
      ),
    );

    scaffoldKey.currentState?.openDrawer();
    await tester.pump();
    expect(find.byType(ListTile),findsNWidgets(2));

  });
}