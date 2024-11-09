import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class AgregarComidas extends StatefulWidget {
  @override
  _AgregarComidasState createState() => _AgregarComidasState();
}

class _AgregarComidasState extends State<AgregarComidas> {
  final _formKey = GlobalKey<FormState>();
  final _descripcionController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void _mostrarFormulario(String tipoComida) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Agregar $tipoComida'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.8, // 80% del ancho de la pantalla
          height: MediaQuery.of(context).size.height *
              0.15, // 40% del alto de la pantallaF
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: '¿Qué comiste?',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa lo que comiste';
                }
                return null;
              },
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final usuario = _auth.currentUser;
                if (usuario != null) {
                  await _firestore.collection('MisComidas').add({
                    'userId': usuario.uid,
                    'tipoComida': tipoComida,
                    'descripcion': _descripcionController.text,
                    'fecha': DateTime.now(),
                  });
                  _descripcionController.clear();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$tipoComida guardado con éxito')),
                  );
                }
              }
            },
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: const Text(
          'Agregar Comidas',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFFFA07A),
      ),
      body: Container(
        color: Colors.grey[100], // Fondo gris claro para toda la pantalla
        child: ListView(
          padding: const EdgeInsets.all(
              16.0), // Aumenta el espacio alrededor de cada ListTile
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: const Icon(Icons.free_breakfast,
                  size: 40), // Icono más grande
              title: const Text(
                'Desayuno',
                style: TextStyle(fontSize: 22), // Texto más grande
              ),
              onTap: () => _mostrarFormulario('Desayuno'),
            ),
            const Divider(),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: const Icon(Icons.lunch_dining, size: 40),
              title: const Text(
                'Almuerzo',
                style: TextStyle(fontSize: 22),
              ),
              onTap: () => _mostrarFormulario('Almuerzo'),
            ),
            const Divider(),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: const Icon(Icons.dinner_dining, size: 40),
              title: const Text(
                'Cena',
                style: TextStyle(fontSize: 22),
              ),
              onTap: () => _mostrarFormulario('Cena'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    super.dispose();
  }
}
