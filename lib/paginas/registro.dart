import 'package:fit_plan_proyecto/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/utils/toast_msj.dart'; 
import 'package:fit_plan_proyecto/paginas/login.dart';

class Registro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Aquí se define el id del formulario
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA07A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Registro', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Asigna el id del formulario aquí
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController, // Asocia el controlador
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController, // Asocia el controlador
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _repeatPasswordController, // Asocia el controlador
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Repite la contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor repite la contraseña';
                    }
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 300),
                ElevatedButton(
                  child: Text('Registrarse', style: TextStyle(color: Color(0xFFFFA07A))),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      // Obtén los valores de email y password
                      String correo = _emailController.text;
                      String pass = _passwordController.text;
                      
                      // Llama a la función createAccount
                      var resultado = await _auth.createAccount(correo, pass);
                      if(resultado == 1){
                        ToastUtils.mostrarMensajeError('La contraseña que intentas ingresar es muy debil');
                      }else if (resultado == 2 ){
                        ToastUtils.mostrarMensajeError("Ya existe una cuenta con ese correo electronico");
                      }else if (resultado != null){
                          Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Login()));
                      }
                      
                      
                    } else {
                      print('Formulario inválido');
                    }
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
