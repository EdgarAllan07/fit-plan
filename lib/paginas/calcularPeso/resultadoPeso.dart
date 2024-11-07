import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultadoPeso extends StatefulWidget {
  @override
  _ResultadoPesoState createState() => _ResultadoPesoState();
}

class _ResultadoPesoState extends State<ResultadoPeso> {
  final TextEditingController _pesoActualController = TextEditingController();
  final TextEditingController _pesoInicialController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  double? pesoInicial;
  DateTime? fechaPesoInicial;
  String _resultado = '';
  bool _editandoPesoInicial = false;

  @override
  void initState() {
    super.initState();
    _cargarPesoInicial();
  }

  Future<void> _cargarPesoInicial() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot usuarioDoc = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .get();

      if (usuarioDoc.exists) {
        setState(() {
          pesoInicial = usuarioDoc['pesoInicial'];
          fechaPesoInicial =
              (usuarioDoc['fechaPesoInicial'] as Timestamp).toDate();
          _pesoInicialController.text = pesoInicial!.toStringAsFixed(1);
        });
      }
    }
  }

  Future<void> _guardarPesoInicial(double peso) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DateTime fechaActual = DateTime.now();
      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .set({
        'pesoInicial': peso,
        'fechaPesoInicial': fechaActual,
      }, SetOptions(merge: true));
      setState(() {
        pesoInicial = peso;
        fechaPesoInicial = fechaActual;
        _editandoPesoInicial = false;
      });
    }
  }

  Future<void> _guardarPesoActual(double pesoActual) async {
    User? user = _auth.currentUser;
    if (user != null && pesoInicial != null) {
      DateTime fechaActual = DateTime.now();
      double porcentaje = ((pesoInicial! - pesoActual) / pesoInicial!) * 100;

      // Guardar el peso actual y la fecha en la subcolección historialPesos
      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('historialPesos')
          .add({
        'pesoActual': pesoActual,
        'fecha': fechaActual,
        'porcentajePerdido': porcentaje,
      });

      setState(() {
        _resultado =
            'Has perdido un ${porcentaje.toStringAsFixed(2)}% de tu peso inicial.';
      });
    }
  }

  void _calcularPorcentaje() {
    double? pesoActual = double.tryParse(_pesoActualController.text);

    if (pesoInicial != null && pesoActual != null && pesoInicial! > 0) {
      _guardarPesoActual(pesoActual);
    } else {
      setState(() {
        _resultado = 'Por favor, ingresa un peso válido.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA07A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:
            Text('Seguimiento de Peso', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _editandoPesoInicial
                  ? Column(
                      children: [
                        Text(
                          'Actualiza tu peso inicial:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _pesoInicialController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Peso Inicial (kg)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            double? nuevoPesoInicial =
                                double.tryParse(_pesoInicialController.text);
                            if (nuevoPesoInicial != null) {
                              _guardarPesoInicial(nuevoPesoInicial);
                            }
                          },
                          child: Text('Guardar Peso Inicial'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _editandoPesoInicial = false;
                            });
                          },
                          child: Text("Cancelar"),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          'Tu peso inicial registrado es: ${pesoInicial != null ? pesoInicial!.toStringAsFixed(1) : 'No registrado'} kg\n'
                          'Fecha de registro: ${fechaPesoInicial != null ? fechaPesoInicial!.toLocal().toString().split(' ')[0] : 'No registrada'}',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _editandoPesoInicial = true;
                            });
                          },
                          child: Text("Actualizar Peso Inicial"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _pesoActualController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Peso Actual (kg)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _calcularPorcentaje,
                          child: Text('Calcular Progreso'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          _resultado,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Regresar',
                    style: TextStyle(color: Color(0xFFFFA07A))),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
