import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFFFA07A);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Iniciar Sesion', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Boton de iniciar sesion
                },
                child: const Text('Entrar', style: TextStyle(color: primaryColor)),
              ),
              const SizedBox(height: 24),
              const Text('¿Todavía no tienes cuenta?', style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 12),
              _buildNavigationButton(context, 'Registrarse', () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Registro()));
              }),
            ],
          ),
        ),
      ),
    );
  }
  ElevatedButton _buildNavigationButton(BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Color(0xFFFFA07A))),
    );
  }
}
