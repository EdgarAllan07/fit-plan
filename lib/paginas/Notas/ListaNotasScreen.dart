import 'package:fit_plan_proyecto/paginas/Notas/CrearNotaScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ListaNotasScreen extends StatelessWidget {
  const ListaNotasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? usuarioActual = FirebaseAuth.instance.currentUser;

    if (usuarioActual == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          title: const Text(
            'Mis Notas',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: const Color(0xFFFFA07A), // Color pastel naranja
        ),
        body:
            const Center(child: Text("No se encontró un usuario autenticado")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: const Text(
          'Mis Notas',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFFFA07A), // Color pastel naranja
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('usuarios')
            .doc(usuarioActual.uid)
            .collection('notas')
            .orderBy('fecha', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No hay notas disponibles.'));
          }

          final notas = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notas.length,
            itemBuilder: (context, index) {
              final nota = notas[index];
              final String titulo = nota['titulo'] ?? 'Sin título';
              final String contenido = nota['contenido'] ?? 'Sin contenido';

              final Timestamp? fechaTimestamp = nota['fecha'] as Timestamp?;
              final String fechaFormateada = fechaTimestamp != null
                  ? DateFormat('dd/MM/yyyy HH:mm')
                      .format(fechaTimestamp.toDate())
                  : 'Fecha no disponible';

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 241, 240),
                    border: Border.all(
                      color: const Color.fromARGB(255, 235, 114, 8),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        contenido,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Fecha de creación: $fechaFormateada',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // Abrir el diálogo para editar la nota
                              _editarNotaDialog(context, usuarioActual.uid,
                                  nota.id, titulo, contenido);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _confirmarEliminacion(
                                  context, usuarioActual.uid, nota.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar nueva nota
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CrearNotaScreen(),
            ),
          );
        },
        tooltip: 'Agregar Nota',
        backgroundColor: const Color(0xffffa07a),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _confirmarEliminacion(
      BuildContext context, String userId, String notaId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmar eliminación"),
          content:
              const Text("¿Estás seguro de que deseas eliminar esta nota?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.blueAccent, // Color de fondo para el botón
              ),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('usuarios')
                    .doc(userId)
                    .collection('notas')
                    .doc(notaId)
                    .delete();

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Nota eliminada con éxito",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.redAccent, // Color de fondo para el botón
              ),
              child: const Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }

  // Función para abrir el dialog de edición
  void _editarNotaDialog(BuildContext context, String userId, String notaId,
      String titulo, String contenido) {
    final TextEditingController tituloController =
        TextEditingController(text: titulo);
    final TextEditingController contenidoController =
        TextEditingController(text: contenido);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Nota'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Título'),
                TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese el título de la nota',
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text('Contenido'),
                TextField(
                  controller: contenidoController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese el contenido de la nota',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final nuevoTitulo = tituloController.text;
                final nuevoContenido = contenidoController.text;

                if (nuevoTitulo.isNotEmpty && nuevoContenido.isNotEmpty) {
                  // Actualizar en Firestore
                  await FirebaseFirestore.instance
                      .collection('usuarios')
                      .doc(userId)
                      .collection('notas')
                      .doc(notaId)
                      .update({
                    'titulo': nuevoTitulo,
                    'contenido': nuevoContenido,
                    'fecha': FieldValue.serverTimestamp(),
                  });

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Nota actualizada con éxito"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  // Mostrar error si hay campos vacíos
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Por favor completa todos los campos"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Guardar cambios'),
            ),
          ],
        );
      },
    );
  }
}
