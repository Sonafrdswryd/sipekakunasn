import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sipek/adminpage.dart';

void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISTEM PENGECEKAN KEAKTIFAN AKUN ASN',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/adminpage': (BuildContext context) => new AdminPage(
              username: username,
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _proseslogin() async {
    final response = await http
        .post("http://127.0.0.1/sipekphp/proses_login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var dataadmin = json.decode(response.body);

    if (dataadmin.length == 1) {
      Navigator.pushReplacementNamed(context, '/adminpage');
      setState(() {
        username = dataadmin[0]['username'];
      });
    } else {
      setState(() {
        msg = "Username / Password yang anda masukkan salah!";
      });
    }
    return dataadmin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIPEK AKUN ASN"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Sistem Pengecekan Keaktifan Akun ASN",
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              TextField(
                controller: user,
                decoration: InputDecoration(hintText: ' Username'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(hintText: ' Password'),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 10.0, color: Colors.red),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16.0),
              ),
              RaisedButton(
                child: Text("LOGIN"),
                onPressed: () {
                  _proseslogin();
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Sistem ini digunakan untuk melakukan pengecekan terhadap akun ASN. Apabila anda belum memiliki akun ASN, silahkan menghubungi operator.",
                style: TextStyle(fontSize: 10.0, color: Colors.black),
                textAlign: TextAlign.left,
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
