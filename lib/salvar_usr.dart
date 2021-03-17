import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simp/homesimp.dart';
import 'package:simp/util/database_helper.dart';

import 'model/note.dart';


class SalvarUsr extends StatefulWidget {


  @override
  _SalvarUsrState createState() => _SalvarUsrState();
}

class _SalvarUsrState extends State<SalvarUsr> {
  DatabaseHelper db = DatabaseHelper();

  Future<String> total() async {

  var prefs = await SharedPreferences.getInstance();
  String logo = (prefs.getString("logo") ?? "");
  String token = (prefs.getString("tokenjwt") ?? "");
  String nome = (prefs.getString("nome") ?? "");
  String email = (prefs.getString("email") ?? "");
  String login = (prefs.getString("login") ?? "");

  Contato c = Contato(null,nome,email,logo,token,login);
    db.insertContato(c);

    await Future.delayed(Duration(seconds: 1));
    return '$token';
  }

  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Salvar Usuário?', style: TextStyle(fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Sim', style: TextStyle(fontSize: 20),),
                    onPressed: () {total(); Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSimp3()));},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Nao', style: TextStyle(fontSize: 20),),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSimp3()));},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}