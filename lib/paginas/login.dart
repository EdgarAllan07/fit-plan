import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/utils/auth.dart';
import 'package:fit_plan_proyecto/utils/toast_msj.dart';
import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA07A),
        title: const Text('Iniciar Sesión',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            width: double.infinity,
            color: const Color(0xFFFFA07A),
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 300,
                    width: 300,
                  ),
                  const Text("Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ej: example@mail.com',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text("Contraseña",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ingresa tu contraseña para entrar a tu cuenta',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese una contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Color(0xFFFFA07A)),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() == true) {
                        String correo = _emailController.text;
                        String pass = _passwordController.text;

                        var resultado = await _auth.iniciarSesion(correo, pass);
                        if (resultado == 1 || resultado == 2) {
                          ToastUtils.mostrarMensajeError(
                              'El correo y la contraseña son incorrectos');
                        } else if (resultado != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Menu()));
                        }
                      } else {
                        print('Formulario inválido');
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: SignInButton(
                      Buttons.Google,
                      onPressed: () async {
                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                          var userCredential =
                              await _auth.iniciarSesionConGoogle();

                          Navigator.pop(context);

                          if (userCredential.user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Menu()));
                          }
                        } catch (e) {
                          if (Navigator.canPop(context)) Navigator.pop(context);

                          ToastUtils.mostrarMensajeError(
                              'Error al iniciar sesión con Google: ${e.toString()}');
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Todavía no tienes cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(color: Color(0xFFFFA07A)),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Registro()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
