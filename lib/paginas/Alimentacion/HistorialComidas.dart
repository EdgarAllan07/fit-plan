import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class HistorialComidas extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> _eliminarComida(String docId) async {
    await _firestore.collection('MisComidas').doc(docId).delete();
  }

  Future<void> _eliminarTodasLasComidas() async {
    final usuario = _auth.currentUser;
    if (usuario != null) {
      final comidas = await _firestore
          .collection('MisComidas')
          .where('userId', isEqualTo: usuario.uid)
          .get();
      
      final batch = _firestore.batch();
      for (var doc in comidas.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verificar si hay un usuario autenticado
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Historial de Comidas')),
        body: const Center(
          child: Text('Debes iniciar sesión para ver tu historial'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){Navigator.pop(context);},
        ),
        title: const Text('Historial de Comidas', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFFFFA07A),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.white,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Eliminar todo'),
                  content: const Text('¿Estás seguro de eliminar todo tu historial?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _eliminarTodasLasComidas();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Historial eliminado')),
                        );
                      },
                      child: const Text('Eliminar', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('MisComidas')
            .where('userId', isEqualTo: currentUser.uid)
            .orderBy('fecha', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          // Mostrar error detallado si existe
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error al cargar el historial: ${snapshot.error}\n'
                  'StackTrace: ${snapshot.stackTrace}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No hay comidas registradas\n'
                'Agrega tu primera comida para verla aquí',
                textAlign: TextAlign.center,
              ),
            );
          }

          try {
            // Agrupar comidas por fecha
            Map<String, List<QueryDocumentSnapshot>> comidasPorFecha = {};
            for (var doc in snapshot.data!.docs) {
              final data = doc.data() as Map<String, dynamic>;
              // Verificar que el campo fecha existe
              if (!data.containsKey('fecha')) {
                continue; // Saltar documentos sin fecha
              }
              
              final fecha = DateFormat('dd/MM/yyyy')
                  .format((data['fecha'] as Timestamp).toDate());
              
              if (!comidasPorFecha.containsKey(fecha)) {
                comidasPorFecha[fecha] = [];
              }
              comidasPorFecha[fecha]!.add(doc);
            }

            if (comidasPorFecha.isEmpty) {
              return const Center(
                child: Text('No se encontraron registros válidos'),
              );
            }

            return ListView.builder(
              itemCount: comidasPorFecha.length,
              itemBuilder: (context, index) {
                final fecha = comidasPorFecha.keys.elementAt(index);
                final comidasDelDia = comidasPorFecha[fecha]!;

                return Card(
                  color: Colors.grey[100],
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          fecha,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...comidasDelDia.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        return ListTile(
                          leading: Icon(_getIconForMeal(data['tipoComida'] ?? '')),
                          title: Text(data['tipoComida'] ?? 'Tipo no especificado', style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          subtitle: Text(data['descripcion'] ?? 'Sin descripción'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              try {
                                await _eliminarComida(doc.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Comida eliminada')),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error al eliminar: $e')),
                                );
                              }
                            },
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            );
          } catch (e, stackTrace) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error al procesar los datos: $e\n'
                  'StackTrace: $stackTrace',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  IconData _getIconForMeal(String tipoComida) {
    switch (tipoComida) {
      case 'Desayuno':
        return Icons.free_breakfast;
      case 'Almuerzo':
        return Icons.lunch_dining;
      case 'Cena':
        return Icons.dinner_dining;
      default:
        return Icons.restaurant;
    }
  }
}