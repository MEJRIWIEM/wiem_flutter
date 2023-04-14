import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wiem_test_project/UI/pages/login.page.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  //Permet de créer la page
  final baseApp = MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      home: loginPage(),
    ),
  );
  // on doit toujours récupérer le materialApp

  testWidgets(
    'Test connexion avec des données correctes',
    (WidgetTester tester) async {
      String name = "Wiem";
      //il va attendre que le widget testeur pump
      await tester.pumpWidget(baseApp);

      //tester l'existence du textfield nom et écriture d'un nom
      final withTextName = find.byKey(Key('nom'));
      expect(withTextName, findsOneWidget);
      await tester.enterText(withTextName, name);

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      final withTextPassword = find.byKey(Key('mdp'));
      expect(withTextPassword, findsOneWidget);
      await tester.enterText(withTextPassword, "12345678");

      //vérifier l'existence du bouton et cliquer
      final btn = find.byKey(Key('btn'));
      await tester.tap(btn);
      await tester.pumpAndSettle();

      //vérifier le passage à la 2eme page
      final findNextPage = find.byType(Column);
      expect(findNextPage, findsOneWidget);

      /*
     //on peut chercher avec un type par exemple le customappbar
      final type = find.byType(AppBar);
      expect(type, findsOneWidget);

      //on peut chercher par rapport une key
      final byKey = find.byKey(Key('_formKey'));
      expect(byKey, findsNothing);*/
    },
  );

  testWidgets(
    'Test connexion avec un nom valide et mot de passe invalide',
        (WidgetTester tester) async {
      String name = "Wiem";
      //il va attendre que le widget testeur pump
      await tester.pumpWidget(baseApp);

      //tester l'existence du textfield nom et écriture d'un nom
      final withTextName = find.byKey(Key('nom'));
      expect(withTextName, findsOneWidget);
      await tester.enterText(withTextName, name);

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      final withTextPassword = find.byKey(Key('mdp'));
      expect(withTextPassword, findsOneWidget);
      await tester.enterText(withTextPassword, "");

      //vérifier l'existence du bouton et cliquer
      final btn = find.byKey(Key('btn'));
      await tester.tap(btn);
      await tester.pumpAndSettle();

      final textFinder = find.text('Le mot de passe est obligatoire*');
      expect(textFinder, findsOneWidget);


    },
  );
  testWidgets(
    'Test connexion avec un nom invalide et mot de passe valide',
        (WidgetTester tester) async {
      //il va attendre que le widget testeur pump
      await tester.pumpWidget(baseApp);

      //tester l'existence du textfield nom et écriture d'un nom
      final withTextName = find.byKey(Key('nom'));
      expect(withTextName, findsOneWidget);
      await tester.enterText(withTextName, "");

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      final withTextPassword = find.byKey(Key('mdp'));
      expect(withTextPassword, findsOneWidget);
      await tester.enterText(withTextPassword, "12345678");

      //vérifier l'existence du bouton et cliquer
      final btn = find.byKey(Key('btn'));
      await tester.tap(btn);
      await tester.pumpAndSettle();

      final textFinder = find.text('Le nom est obligatoire*');
      expect(textFinder, findsOneWidget);


    },
  );
  testWidgets(
    'Test connexion avec un nom invalide et mot de passe invalide',
        (WidgetTester tester) async {
      //il va attendre que le widget testeur pump
      await tester.pumpWidget(baseApp);

      //tester l'existence du textfield nom et écriture d'un nom
      final withTextName = find.byKey(Key('nom'));
      expect(withTextName, findsOneWidget);
      await tester.enterText(withTextName, "");

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      final withTextPassword = find.byKey(Key('mdp'));
      expect(withTextPassword, findsOneWidget);
      await tester.enterText(withTextPassword, "");

      //vérifier l'existence du bouton et cliquer
      final btn = find.byKey(Key('btn'));
      await tester.tap(btn);
      await tester.pumpAndSettle();

      final textFinder1 = find.text('Le nom est obligatoire*');
      expect(textFinder1, findsOneWidget);

      final textFinder2 = find.text('Le mot de passe est obligatoire*');
      expect(textFinder2, findsOneWidget);

    },
  );

  testWidgets(
    'Test checkbox cliquable',
        (WidgetTester tester) async {
      //il va attendre que le widget testeur pump
      await tester.pumpWidget(baseApp);

      final checkboxFinder = find.byKey(const Key('aKey'));

      var checkbox = tester.firstWidget< CheckboxListTile>(checkboxFinder);
      expect(checkbox.value, false);

      await tester.tap(checkboxFinder);
      await tester.pump();

      checkbox = tester.firstWidget< CheckboxListTile>(checkboxFinder);
      expect(checkbox.value, true);

    },
  );

}
