import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wiem_test_project/UI/pages/login.page.dart';

/**
 * POUR EXECUTER LES TESTS D'INTEGRATION LANCEZ SUR LE TERMINAL:
 * flutter test integration_test/connexion.dart
 */

main() {
  final login = MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      home: loginPage(),

    ),
  );

  //Fonction qui permet de remplir le formulaire
  Future<void> remplirFormulaire(
      String nom, String mdp, WidgetTester tester) async {
    final nomField = await find.byKey(Key('nomField'));
    await tester.tap(nomField);
    await tester.enterText(nomField, nom);

    final mdpField = await find.byKey(Key('mdpField'));
    await tester.tap(mdpField);
    await tester.enterText(mdpField, mdp);

    final btn = find.byKey(Key('btn'));
    await tester.tap(btn, warnIfMissed: false);
    await tester.pumpAndSettle();
  } ;

  //Cherche le message d'alerte lié au mot de passe
  void msgAlerteMdp() {
    final textFinder = find.text('Le mot de passe est obligatoire*');
    expect(textFinder, findsOneWidget);
  }

  //Cherche le message d'alerte lié au nom
  void msgAlerteNom() {
    final textFinder = find.text('Le nom est obligatoire*');
    expect(textFinder, findsOneWidget);
  }

  group(
    "Tests d'intégration page de connexion",
    () {
      testWidgets(
        ('Test connexion avec données valides'),
        (tester) async {
          await tester.pumpWidget(login);
          await tester.pumpAndSettle();
          await remplirFormulaire("Wiem", "12345678", tester);
          //expect(find.byType(Scaffold), findsOneWidget);
          expect(find.byKey(Key('messageUser')),findsOneWidget);
        },
      );

      testWidgets(
        ('Test connexion avec un nom valide et un mot de passe invalide'),
        (tester) async {
          await tester.pumpWidget(login);
          await tester.pumpAndSettle();
          await remplirFormulaire("Wiem", "", tester);
          msgAlerteMdp();
        },
      );

      testWidgets(
        ('Test connexion avec un nom invalide et un mot de passe valide'),
        (tester) async {
          await tester.pumpWidget(login);
          await tester.pumpAndSettle();
          await remplirFormulaire("", "12345678", tester);
          msgAlerteNom();
        },
      );

      testWidgets(
        ('Test connexion avec un nom invalide et un mot de passe invalide'),
        (tester) async {
          await tester.pumpWidget(login);
          await tester.pumpAndSettle();
          await remplirFormulaire("", "", tester);
          msgAlerteNom();
          msgAlerteMdp();
        },
      );
    },
  );

}
