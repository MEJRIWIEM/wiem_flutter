import 'package:flutter/material.dart';

import '../widgets/mydrawer.widget.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.purple,
              ])),
        ),
        title: Text("Accueil",
            style: TextStyle(color: Colors.black54, fontSize: 20)),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'App',
            children: [
              TextSpan(
                  text: 'tessi',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              TextSpan(
                  text: 'Testing',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink)),
            ],
          ),
        ),
      ),
    );
  }
}
