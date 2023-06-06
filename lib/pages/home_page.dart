import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class Homescreen extends StatelessWidget {
  User user;
  Homescreen(this.user);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          TextButton.icon(
            onPressed: () async {
              AuthService().signOut();
            },
            icon: Icon(Icons.logout),
            label: Text("Sign out"),
            style: TextButton.styleFrom(primary: Colors.white),
          ),
        ],
      ),
      body: Text("Hello Home page"),
    );
  }
}
