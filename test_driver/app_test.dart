import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  //trouver nos éléments dans l'app
  final textFieldNom = find.byValueKey('nomField');
  final textFieldMdp = find.byValueKey('mdpField');
  final button = find.byValueKey('btn');

  //crée un driver
  late FlutterDriver flutterDriver; //late = pas initialisé de suite

  //mettre en place le driver
  setUpAll(() async {
    flutterDriver = await FlutterDriver.connect();
    await flutterDriver.waitUntilFirstFrameRasterized();
  });


  //lancer le test
  test('Se connecter avec des données valides', () async {
    await flutterDriver.tap(textFieldNom);
    await flutterDriver.enterText('Wiem');

    await flutterDriver.tap(textFieldMdp);
    await flutterDriver.enterText('12345678');

    await flutterDriver.tap(button);
  });

  //supprimer à la fin du test
  tearDown(() async {
    flutterDriver.close();
  });
}
