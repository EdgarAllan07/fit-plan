import 'package:firebase_core/firebase_core.dart';
import 'package:fit_plan_proyecto/firebase_options.dart';
import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:flutter/material.dart';
import 'paginas/login.dart';
import 'paginas/menu.dart';

  void main() {
    //cadena de conexion a flutter 
    //nuevas librerias 
/**    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  ); */
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

      home:Login(),
    );
  }
}
