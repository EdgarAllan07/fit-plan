import 'package:firebase_auth/firebase_auth.dart';
 
class Autentificacion{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future crearCuenta (String correo, String contra) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: correo, password: contra);
      print(userCredential.user);
      return (userCredential.user?.uid);
    
    }on FirebaseAuthException catch(e) {
      if(e.code == 'contraseña muy corta'){
        print('la contraseña es debil');
        return 1;
      }else if (e.code == 'correo en uso'){
      print('la cuenta ya existe');
      return 2;
      }
    }catch (e){
    print(e);
    }
  } 

  Future iniciarSesion(String email, String pass)async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: pass);

      final a = userCredential.user;
      if(a?.uid != null){
        return a?.uid;
      }
    } on FirebaseAuthException catch (e){
      if(e.code == 'usuario no existe'){
        return 1;
      }else if(e.code == 'contraseña mala'){
        return 2;
      }
    }
  }
}