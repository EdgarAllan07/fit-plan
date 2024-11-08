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
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _descripcionController,
            decoration: const InputDecoration(
              labelText: '¿Qué comiste?',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa lo que comiste';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
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
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Comidas'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.free_breakfast),
            title: const Text('Desayuno'),
            onTap: () => _mostrarFormulario('Desayuno'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lunch_dining),
            title: const Text('Almuerzo'),
            onTap: () => _mostrarFormulario('Almuerzo'),
          ),
          const Divider(),
          ListTile(
            leading:const Icon(Icons.dinner_dining),
            title: const Text('Cena'),
            onTap: () => _mostrarFormulario('Cena'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    super.dispose();
  }
}