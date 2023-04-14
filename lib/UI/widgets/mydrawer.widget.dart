import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.purple,
                ])),
            child: Container(
              margin: EdgeInsets.only(top: 5),
              width: 300,
              height: 300,
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/tessi.png',
                height: 150,
                width: 150,
              ),
            ),
          ),
          ListTile(
            title: Text('Accueil', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.home, color: Colors.black54),
            onTap: (){
              Navigator.pushNamed(context, '/home');
            },
          ),
          Divider(height: 2,),
          ListTile(
            title: Text('Se connecter', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.person, color: Colors.black54),
            onTap: (){
              Navigator.pushNamed(context, '/login');
            },
          )
        ],
      ),
    );
  }
}
