import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Notas/CrearNotaScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart'; // Importa intl para formatear la fecha

class ListaNotasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? usuarioActual = FirebaseAuth.instance.currentUser;

    if (usuarioActual == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Mis Notas")),
        body:
            const Center(child: Text("No se encontró un usuario autenticado")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Notas'),
        backgroundColor: const Color(0xffffa07a),
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

              // Obtener y formatear la fecha de creación
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _confirmarEliminacion(
                                context, usuarioActual.uid, nota.id);
                          },
                        ),
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
              child: const Text("Cancelar"),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xffffa07a), // Color del texto
              ),
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
                    content: Text("Nota eliminada con éxito",
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Color(0xffffa07a),
                  ),
                );
              },
              child: const Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }
}
