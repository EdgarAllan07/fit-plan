import 'package:firebase_core/firebase_core.dart';
import 'package:fit_plan_proyecto/firebase_options.dart';
import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:flutter/material.dart';
import 'paginas/Notas/CrearNotaScreen.dart';
import 'paginas/menu.dart';

Future<void> main() async {
  //cadena de conexion a flutter 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
    );
  }
}
