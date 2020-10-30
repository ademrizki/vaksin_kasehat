import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vaksin_kasehat/app.dart';

void main() async {
  runApp(App());

  await Firebase.initializeApp();
}
