import 'package:fit_plan_proyecto/paginas/Notas/ListaNotasScreen.dart';
import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';
import 'package:fit_plan_proyecto/utils/toast_msj.dart'; 
import 'menu.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA07A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Iniciar Sesion', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 16.0, color: const Color.fromARGB(255, 0, 0, 0),
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
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 16.0, color: const Color.fromARGB(255, 0, 0, 0),
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
                SizedBox(height: 300),
                ElevatedButton(
                  child: Text('Entrar', style: TextStyle(color: Color(0xFFFFA07A))),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    // Manejo de la lógica de inicio de sesión
                    if (_formKey.currentState?.validate() == true) {
                      String correo = _emailController.text;
                      String pass = _passwordController.text;

                      var resultado = await _auth.iniciarSesion(correo, pass);
                      if (resultado == 1) {
                        ToastUtils.mostrarMensajeError('El correo y la contraseña son incorrectos');
                      } else if (resultado == 2) {
                        ToastUtils.mostrarMensajeError("El correo y la contraseña son incorrectos");
                      } else if (resultado != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Menu())
                        );
                      }
                    } else {
                      print('Formulario inválido');
                    }
                  },
                ),
                SizedBox(height: 24),
                Text('Todavía no tienes cuenta?', overflow: TextOverflow.ellipsis),
                SizedBox(height: 12),
                ElevatedButton(
                  child: Text('Registrarse', style: TextStyle(color: Color(0xFFFFA07A))),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registro())
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
