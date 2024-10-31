import 'package:firebase_core/firebase_core.dart';
import 'package:fit_plan_proyecto/firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
//cadena de conexion a flutter 
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
}