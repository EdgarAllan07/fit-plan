import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';

class Login extends StatelessWidget {
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
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        width: 16.0, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        width: 16.0, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 300),
              ElevatedButton(
                child:
                    Text('Ingresar', style: TextStyle(color: Color(0xFFFFA07A))),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle registration logic
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Menu()));
                },
              ),
              SizedBox(height: 24),
              Text(
                  overflow: TextOverflow.ellipsis, 'Todavia no tienes cuenta?'),
              SizedBox(height: 12),
              ElevatedButton(
                child: Text('Registrarse',
                    style: TextStyle(color: Color(0xFFFFA07A))),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ), // cod que nos enviara a la interface de registro
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Registro())); // registro, nombre de interface de registro :/
                },
              ), // este boton para prueba que llega a la pantalla de crear una nota
             
          //fin del boton de prueba
            ],
          ),
        ),
      ),
    );
  }
}
