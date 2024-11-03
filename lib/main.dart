import 'package:flutter/material.dart';
import 'paginas/Notas/CrearNotaScreen.dart';
import 'paginas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Login(),
    );
  }
}
