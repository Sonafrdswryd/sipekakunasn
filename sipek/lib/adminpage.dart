import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIPEK AKUN ASN"),
      ),
      body: Column(
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
          Padding(
            padding: EdgeInsets.only(top: 16.0),
          ),
          Text(
            'Selamat, akun ASN dengan username $username, telah aktif.',
            style: TextStyle(fontSize: 15.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
          ),
          RaisedButton(
            child: Text("LOGOUT"),
            onPressed: () {
            Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
          ),
        ],
      ),
    );
  }
}
