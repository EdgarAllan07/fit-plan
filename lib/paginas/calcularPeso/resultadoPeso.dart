import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultadoPeso extends StatefulWidget {
  const ResultadoPeso({super.key});

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
  List<Map<String, dynamic>> _historialPesos = [];

  @override
  void initState() {
    super.initState();
    _cargarPesoInicial();
    _cargarHistorialPesos();
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

  Future<void> _cargarHistorialPesos() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot historialSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('historialPesos')
          .orderBy('fecha', descending: true)
          .get();

      setState(() {
        _historialPesos = historialSnapshot.docs
            .map((doc) => {
                  'pesoActual': doc['pesoActual'],
                  'fecha': doc['fecha'].toDate(),
                  'porcentajePerdido': doc['porcentajePerdido'],
                })
            .toList();
      });
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
        _cargarHistorialPesos();
      });
    }
  }

  void _mostrarMensajeEmergente(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Información de Peso"),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: const Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _calcularPorcentaje() {
    double? pesoActual = double.tryParse(_pesoActualController.text);

    if (pesoInicial != null && pesoActual != null) {
      if (pesoActual == pesoInicial) {
        _mostrarMensajeEmergente(
            "Tu peso actual es igual a tu peso inicial. ¡Continúa esforzándote para ver progreso!");
      } else if (pesoActual > pesoInicial!) {
        _mostrarMensajeEmergente(
            "Tu peso actual ha aumentado desde el peso inicial. ¡Revisa tu progreso y mantente motivado!");
      } else {
        _guardarPesoActual(pesoActual);
      }
    } else {
      setState(() {
        _resultado = 'Por favor, ingresa un peso válido.';
      });
    }
  }

  Future<void> _eliminarHistorial() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot historialSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('historialPesos')
          .get();

      for (var doc in historialSnapshot.docs) {
        await doc.reference.delete();
      }
      setState(() {
        _historialPesos = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA07A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Seguimiento de Peso',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _editandoPesoInicial
                  ? Column(
                      children: [
                        const Text(
                          'Actualiza tu peso inicial: ',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _pesoInicialController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Peso Inicial (kg)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // boton de aguardar peso inicial
                        ElevatedButton(
                          onPressed: () {
                            double? nuevoPesoInicial =
                                double.tryParse(_pesoInicialController.text);
                            if (nuevoPesoInicial != null) {
                              _guardarPesoInicial(nuevoPesoInicial);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          // child: const Text('Guardar Peso Inicial'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.save), // Icono de guardar
                              SizedBox(
                                  width:
                                      8), // Espacio entre el icono y el texto
                              Text('Guardar Peso Inicial'),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _editandoPesoInicial = false;
                            });
                          },
                          child: const Text("Cancelar"),
                        ),
                      ],
                    )
                  : Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.fitness_center,
                                    color: Colors.grey), // Icono de peso
                                const SizedBox(
                                    width:
                                        8), // Espacio entre el icono y el texto
                                Expanded(
                                  child: Text(
                                    'Peso Inicial: ${pesoInicial != null ? pesoInicial!.toStringAsFixed(1) : 'No registrado'} kg\n'
                                    'Fecha de registro: ${fechaPesoInicial != null ? fechaPesoInicial!.toLocal().toString().split(' ')[0] : 'No registrada'}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _editandoPesoInicial = true;
                                });
                              },
                              child: const Text("Actualizar Peso Inicial"),
                            ),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _pesoActualController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso Actual (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _calcularPorcentaje,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // child: const Text('Calcular Progreso'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.calculate), // Icono de calcular
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text('Calcular Progreso'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _resultado,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Historial de Pesos con área de scroll independiente
              if (_historialPesos.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Historial de Pesos:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: _historialPesos.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = _historialPesos[index];
                          return Card(
                            child: ListTile(
                              title: Text('Peso: ${item['pesoActual']} kg'),
                              subtitle: Text(
                                'Fecha: ${item['fecha'].toLocal().toString().split(' ')[0]}',
                              ),
                              trailing: Text(
                                '${item['porcentajePerdido'].toStringAsFixed(2)}%',
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              else
                const Text(
                  'Aún no has registrado ningún peso.',
                  style: TextStyle(fontSize: 18),
                ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _eliminarHistorial,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                //child: const Text('Eliminar Historial'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phonelink_erase), // Icono de cálculos
                    SizedBox(width: 8),
                    Text('Eliminar Historial'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
