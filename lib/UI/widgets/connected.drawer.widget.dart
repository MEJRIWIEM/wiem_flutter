import 'package:flutter/material.dart';

class connectedDrawer extends StatelessWidget {
  const connectedDrawer({Key? key}) : super(key: key);

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
            title: Text('Mes favoris', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.favorite, color: Colors.black54),
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
          ),
          Divider(height: 2,),
          ListTile(
            title: Text('Déconnexion', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.person, color: Colors.black54),
            onTap: (){
              Navigator.pushNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }
}
