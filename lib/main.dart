import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, GoogleAuthProvider;

import 'package:firebase_core/firebase_core.dart';
import 'package:game_finder/firebase_options.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
