import 'package:flutter/material.dart';
import 'login.dart';

class Registro  extends StatelessWidget {

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
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              //Caja de texto correo
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 16.0, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              //Caja de texto contraseña
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 16.0, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              //Caja de texto repetir contraseña
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Repite la contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:  const BorderSide(width: 16.0, color:  Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height:300),
              //Boton registrarse
              ElevatedButton(
                child: Text('Registrarse', style: TextStyle(color: Color(0xFFFFA07A))),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                ),
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

