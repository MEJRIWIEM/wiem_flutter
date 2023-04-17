import 'package:flutter/material.dart';
import 'package:wiem_test_project/UI/pages/first.page.dart';
import 'package:wiem_test_project/UI/pages/login.page.dart';

import 'UI/pages/home.page.dart';
import 'UI/widgets/mydrawer.widget.dart';

void main() => runApp(MyApp());

//chaque widget se met dans un fichier séparé
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      routes: {
        "/home": (context) => homePage(),
        "/login": (context) => loginPage(),
        "/first" : (context) => firstPage(name: ("")),
        "/drawer" : (context) => myDrawer(),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/home",
    );
  }

}

/*
flutter pub get s'il ne trouve pas packages

clique droit sur le projet ensuite mark direstory as test sources root
 */
