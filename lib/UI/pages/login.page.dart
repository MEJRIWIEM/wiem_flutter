import 'package:flutter/material.dart';

import '../widgets/mydrawer.widget.dart';
import 'first.page.dart';
import 'home.page.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool? _checkBox = false;

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
        title: Text("Se connecter",
            style: TextStyle(color: Colors.black54, fontSize: 20)),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    key: Key('nom'),
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Nom"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Le nom est obligatoire*';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: TextFormField(
                    key: Key('mdp'),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Mot de passe"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Le mot de passe est obligatoire*';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: CheckboxListTile(
                      key: Key('aKey'),
                      selectedTileColor: Colors.white38,
                      title: Text("Accepter les notifications"),
                      checkColor: Colors.white,
                      activeColor: Colors.pink,
                      value: _checkBox,
                      onChanged: (val) {
                        setState(() {
                          _checkBox = val;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      key: Key('btn'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black54),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(17)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 17))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigate the user to the Home page
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Bienvenue')),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => firstPage(
                                      name: nameController.text,
                                    )),
                          );
                          setState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Veuillez remplir le formulaire')),
                          );
                          setState(() {});
                        }
                      },
                      child: const Text('Valider'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
