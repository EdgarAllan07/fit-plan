import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrearNotaScreen extends StatefulWidget {
  const CrearNotaScreen({super.key});

  @override
  _CrearNotaScreenState createState() => _CrearNotaScreenState();
}

class _CrearNotaScreenState extends State<CrearNotaScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  bool _isSaving = false; // Variable para controlar el estado del botón

  // Función para guardar la nota en Firestore
  Future<void> _guardarNota() async {
    User? usuarioActual =
        FirebaseAuth.instance.currentUser; // Obtiene el usuario actual

    if (usuarioActual != null &&
        _tituloController.text.isNotEmpty &&
        _contenidoController.text.isNotEmpty) {
      setState(() {
        _isSaving = true; // Desactiva el botón al iniciar el guardado
      });

      try {
        // Referencia a la colección de notas del usuario actual
        final CollectionReference notasRef = FirebaseFirestore.instance
            .collection('usuarios')
            .doc(usuarioActual.uid)
            .collection('notas');

        // Añade una nueva nota a la subcolección del usuario actual
        await notasRef.add({
          'titulo': _tituloController.text,
          'contenido': _contenidoController.text,
          'fecha': FieldValue
              .serverTimestamp(), // Guarda la fecha actual del servidor
        });

        // Muestra un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Nota guardada con éxito",
              style: TextStyle(color: Colors.white), // Color del texto
            ),
            backgroundColor: Colors.green, // Color de fondo del SnackBar
          ),
        );

        // Limpia los campos después de guardar
        _tituloController.clear();
        _contenidoController.clear();
      } catch (e) {
        // Muestra un mensaje de error si falla al guardar la nota
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al guardar la nota: $e")),
        );
      } finally {
        setState(() {
          _isSaving = false; // Reactiva el botón después de guardar
        });
        // Navegar de regreso a la pantalla anterior
        Navigator.pop(context);
      }
    } else {
      // Muestra un mensaje si los campos están vacíos o el usuario no está autenticado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor ingresa título y contenido")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){Navigator.pop(context);},
        ),
        centerTitle: false,
        title: const Text(
          'Crear Nota',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFFFA07A), // Color pastel naranja
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título de la nota',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _contenidoController,
              decoration: InputDecoration(
                labelText: 'Escribe tu nota aquí',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              maxLines: 8,
              minLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isSaving
                  ? null
                  : _guardarNota, // Desactivar el botón si está guardando
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 242, 239, 237),
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: _isSaving
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                  : const Text(
                      'Guardar Nota'), // Mostrar indicador de carga mientras se guarda
            ),
          ],
        ),
      ),
    );
  }
}
