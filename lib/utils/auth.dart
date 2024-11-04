import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../paginas/login.dart';
class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Método asíncrono para crear una cuenta
  Future createAccount(String correo, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: correo,
        password: pass,
      );
      print(userCredential.user);
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña es muy débil: ${e.code}');
        return 1;
      } else if (e.code == 'email-already-in-use') {
        print('Ese correo ya está en uso: ${e.code}');
        return 2;
      }
    } catch (e) {
      print("Error desconocido: ${e}");
      return e;
    }
  }

  // Método asíncrono para iniciar sesión
  Future iniciarSesion(String correo, String pass) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: correo,
        password: pass,
      );
      final datosUsuario = userCredential.user;
      if (datosUsuario?.uid != null) {
        return datosUsuario?.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No se encontró una cuenta con ese correo: ${e.code}");
        return 1;
      } else if (e.code == 'wrong-password') { // Código corregido
        print("La contraseña es incorrecta: ${e.code}");
        return 2;
      }
    } catch (e) {
      print("Error desconocido: ${e}");
      return e;
    }
  }

Future<void> logOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Login()), // Cambia `Login()` por tu widget de pantalla de inicio de sesión
    (Route<dynamic> route) => false,
  );
}

}
