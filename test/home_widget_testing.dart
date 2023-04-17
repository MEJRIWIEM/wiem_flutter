import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wiem_test_project/UI/pages/home.page.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  //Permet de créer la page
  final baseApp = MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      home: homePage(),
    ),
  );
  // on doit toujours récupérer le materialApp

  testWidgets(
    'Test affichage du texte dans la page d\'acceuil',
    (WidgetTester tester) async {
      //il va attendre que le widget testeur pump
      await tester.pumpWidget(baseApp);

      //tester l'existence du textfield nom et écriture d'un nom
      final content= find.byKey(Key('contenu'));
      expect(content, findsOneWidget);
      print(' ✔ Affichage du home');
    },
  );
}
