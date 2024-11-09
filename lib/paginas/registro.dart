import 'package:fit_plan_proyecto/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/utils/toast_msj.dart';
import 'package:fit_plan_proyecto/paginas/login.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey =
      GlobalKey<FormState>(); // Aquí se define el id del formulario
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA07A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Registro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            )),
        elevation: 0,
      ),
      body: SizedBox(
        child: Container(
          color: const Color(0xFFFFA07A),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: new Color.fromRGBO(255, 255, 255, 0.2),
                child: Form(
                  key: _formKey, // Asigna el id del formulario aquí
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa un email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller:
                            _passwordController, // Asocia el controlador
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.black),
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
                      SizedBox(height: 30),
                      TextFormField(
                        controller:
                            _repeatPasswordController, // Asocia el controlador
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Repite la contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.black),
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
                      SizedBox(height: 30),
                      TextFormField(
                        controller:
                            _nicknameController, // Asocia el controlador
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Nickname',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa un nickname';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller:
                            _birthDateController, // Asocia el controlador
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Fecha de Nacimiento',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        readOnly: true, // Hace que el campo sea solo de lectura
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _birthDateController.text =
                                  "${pickedDate.toLocal()}".split(' ')[0];
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor selecciona una fecha de nacimiento';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 45), // Ajuste de espacio antes del botón
                      ElevatedButton(
                        child: Text('Registrarse',
                            style: TextStyle(color: Color(0xFFFFA07A))),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            // Obtén los valores de email, password, nickname y fecha
                            String correo = _emailController.text;
                            String pass = _passwordController.text;
                            String nickname = _nicknameController.text;
                            String fechaNA = _birthDateController.text;

                            // Llama a la función createAccount
                            var resultado = await _auth.createAccount(
                                correo, pass, nickname, fechaNA);
                            if (resultado == 1) {
                              ToastUtils.mostrarMensajeError(
                                  'La contraseña que intentas ingresar es muy débil');
                            } else if (resultado == 2) {
                              ToastUtils.mostrarMensajeError(
                                  "Ya existe una cuenta con ese correo electrónico");
                            } else if (resultado != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            }
                          } else {
                            print('Formulario inválido');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
