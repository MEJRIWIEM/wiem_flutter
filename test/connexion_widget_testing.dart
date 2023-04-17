import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wiem_test_project/UI/pages/login.page.dart';

void main() {
  //Permet de construire l'app
  final login = MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      home: loginPage(),
    ),
  );

  Future<void> ajouterNom(String nom, WidgetTester tester) async {
    final withTextName = find.byKey(Key('nomField'));
    expect(withTextName, findsOneWidget);
    await tester.enterText(withTextName, nom);
  }

  Future<void> ajouterMotDePasse(String mdp, WidgetTester tester) async {
    final withTextName = find.byKey(Key('mdpField'));
    expect(withTextName, findsOneWidget);
    await tester.enterText(withTextName, mdp);
  }

  Future<void> cliquerBtn(WidgetTester tester) async {
    final btn = find.byKey(Key('btn'));
    await tester.tap(btn);
    await tester.pumpAndSettle();
  }

  Future<void> msgSnackBar(String msg) async {
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(msg), findsOneWidget);
  }

  testWidgets(
    'Test de connexion avec un nom valide et un mot de passe valide',
    (WidgetTester tester) async {
      //il va attendre que le widget tester pump
      await tester.pumpWidget(login);

      //tester l'existence du textfield nom et écriture d'un nom
      await ajouterNom("Wiem", tester);

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      await ajouterMotDePasse("12345678", tester);

      //vérifier l'existence du bouton et cliquer
      await cliquerBtn(tester);

      //vérifier le passage à la 2eme page
      final findNextPage = find.byKey(Key('message'));
      expect(findNextPage, findsOneWidget);

      //vérifier le message du snackbar
      await msgSnackBar("Bienvenue");

      print(' ✔ Test de connexion avec un nom valide et un mot de passe valide');

    },
  );

  testWidgets(
    'Test de connexion avec un nom valide et un mot de passe invalide',
    (WidgetTester tester) async {
      //il va attendre que le widget tester pump
      await tester.pumpWidget(login);

      //tester l'existence du textfield nom et écriture d'un nom
      await ajouterNom("Wiem", tester);

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      await ajouterMotDePasse("", tester);

      //vérifier l'existence du bouton et cliquer
      await cliquerBtn(tester);

      //vérifier que le message d'alerte s'affiche
      final textFinder = find.text('Le mot de passe est obligatoire*');
      expect(textFinder, findsOneWidget);

      //vérifier le message du snackbar
      await msgSnackBar("Veuillez remplir le formulaire");

      print(' ✔ Test de connexion avec un nom valide et un mot de passe invalide');
    },
  );

  testWidgets(
    'Test de connexion avec un nom invalide et un mot de passe valide',
    (WidgetTester tester) async {
      //il va attendre que le widget tester pump
      await tester.pumpWidget(login);

      //tester l'existence du textfield nom et écriture d'un nom
      await ajouterNom("", tester);

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      await ajouterMotDePasse("12345678", tester);

      //vérifier l'existence du bouton et cliquer
      await cliquerBtn(tester);

      //vérifier que le message d'alerte s'affiche
      final textFinder = find.text('Le nom est obligatoire*');
      expect(textFinder, findsOneWidget);

      //vérifier le message du snackbar
      await msgSnackBar("Veuillez remplir le formulaire");

      print(' ✔ Test de connexion avec un nom invalide et un mot de passe valide');

    },
  );

  testWidgets(
    'Test de connexion avec un nom invalide et un mot de passe invalide',
    (WidgetTester tester) async {
      //il va attendre que le widget tester pump
      await tester.pumpWidget(login);

      //tester l'existence du textfield nom et écriture d'un nom
      await ajouterNom("", tester);

      //tester l'existence du textfield mot de passe et écriture d'un mot de passe
      await ajouterMotDePasse("", tester);

      //vérifier l'existence du bouton et cliquer
      await cliquerBtn(tester);

      //vérifier que les messages d'alerte s'affichent
      final textFinder1 = find.text('Le mot de passe est obligatoire*');
      expect(textFinder1, findsOneWidget);
      final textFinder2 = find.text('Le nom est obligatoire*');
      expect(textFinder2, findsOneWidget);

      //vérifier le message du snackbar
      await msgSnackBar("Veuillez remplir le formulaire");

      print(' ✔ Test de connexion avec un nom invalide et un mot de passe invalide');
    },
  );
  testWidgets(
    'Test checkbox cliquable',
        (WidgetTester tester) async {
      //il va attendre que le widget testeur pump
      await tester.pumpWidget(login);

      final checkboxFinder = find.byKey(const Key('aKey'));

      var checkbox = tester.firstWidget< CheckboxListTile>(checkboxFinder);
      expect(checkbox.value, false);

      await tester.tap(checkboxFinder);
      await tester.pump();

      checkbox = tester.firstWidget< CheckboxListTile>(checkboxFinder);
      expect(checkbox.value, true);
      print(' ✔ Test checkbox cliquable');

    },
  );


}

/*
     //on peut chercher avec un type par exemple le customappbar
      final type = find.byType(AppBar);
      expect(type, findsOneWidget);

      //on peut chercher par rapport une key
      final byKey = find.byKey(Key('_formKey'));
      expect(byKey, findsNothing);*/
