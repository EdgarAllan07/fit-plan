import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../paginas/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método asíncrono para crear una cuenta
  Future createAccount(
      String correo, String pass, String nickname, String fechaNA) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: correo,
        password: pass,
      );
      print(userCredential.user);
     await _firestore.collection('datosUsuario').add({
        'id': userCredential.user?.uid,
        'correo': correo,
        'nickname': nickname,
        'fechaNA': fechaNA,
        'created_at': DateTime.now(),
        'updated_at': DateTime.now()
      });
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
      } else if (e.code == 'wrong-password') {
        // Código corregido
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
      MaterialPageRoute(
          builder: (context) =>
              Login()), // Cambia `Login()` por tu widget de pantalla de inicio de sesión
      (Route<dynamic> route) => false,
    );
  }

 Future<UserCredential> iniciarSesionConGoogle() async {
  try {
    // Revocar la sesión anterior
    await GoogleSignIn().signOut();

// Inicia el flujo de autenticación
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtén los detalles de autenticación
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Crea la credencial de Google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Inicia sesión en Firebase con la credencial de Google
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Verifica si el usuario ya existe en Firestore
      final userDoc = await _firestore.collection('datosUsuario').doc(userCredential.user?.uid).get();
      if (!userDoc.exists) {
        // Si el usuario no existe, agrega un nuevo documento en Firestore
        await _firestore.collection('datosUsuario').doc(userCredential.user?.uid).set({
          'id': userCredential.user?.uid,
          'correo': userCredential.user?.email,
          'nickname': userCredential.user?.displayName ?? "",
          'fechaNA': "",  // Puedes ajustar esto según los datos disponibles
          'created_at': DateTime.now(),
          'updated_at': DateTime.now(),
        });
      }
      
    return userCredential;
  } catch (e) {
    print("Error de autenticación con Google: $e");
    throw Exception("Error de inicio de sesión con Google: $e");
  }
}


  Future datosUsuario() async {
    final user = auth.currentUser;
    if (user != null) {
      final docSnapshot =
          await _firestore.collection('datosUsuario').doc(user.uid).get();
      if (docSnapshot.exists) {
        return docSnapshot.data(); // Devuelve los datos si existen
      } else {
        print('No se encontraron datos para el usuario');
        return null;
      }
    }
    return null;
  }
}
