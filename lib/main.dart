import 'package:firebase_core/firebase_core.dart';
import 'package:fit_plan_proyecto/firebase_options.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/paginas/login.dart';
import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:flutter/material.dart';
import 'paginas/login.dart';
import 'paginas/menu.dart';
import 'package:firebase_auth/firebase_auth.dart'; //cadena para metodos de autentificacion

void main() {
  runApp(const MyApp());
} 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menu(),
    );
  }
}
