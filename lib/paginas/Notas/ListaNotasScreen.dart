import 'package:fit_plan_proyecto/paginas/Notas/CrearNotaScreen.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Notas/nota.dart';

class ListaNotasScreen extends StatefulWidget {
  @override
  _ListaNotasScreenState createState() => _ListaNotasScreenState();
}

class _ListaNotasScreenState extends State<ListaNotasScreen> {
  List<Nota> notas = []; // Lista de objetos Nota

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Notas',style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xffffa07a),
      ),
      body: ListView.builder(
        itemCount: notas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFA07A),
                border: Border.all(
                  color: const Color(0xFFFFA07A),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notas[index].titulo,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    notas[index].contenido,
                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de creación de notas
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CrearNotaScreen(onSave: (Nota nuevaNota) {
                      setState(() {
                        notas.add(nuevaNota);
                      });
                    })),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Agregar Nota',
     backgroundColor: Color(0xffffa07a),
      ),
    );
  }
}
