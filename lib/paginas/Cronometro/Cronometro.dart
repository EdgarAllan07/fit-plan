import 'package:fit_plan_proyecto/paginas/Alimentacion/Alimentacion.dart';
import 'package:fit_plan_proyecto/paginas/Configuraciones/configuracionMenu.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Cronometro extends StatefulWidget {
  @override
  _CronometroPageState createState() => _CronometroPageState();
}


class _CronometroPageState extends State<Cronometro> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        //Rutinas
        print("Rutinas");
        break;
      case 1:
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>const Alimentacion()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Menu()),
        );
        break;
      case 3:
      //Es esta vista
        print("Estas en Cronometro");
        break;
      case 4:
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendario()),
        );
        break;
    }
}
  

  late Stopwatch _stopwatch;
  late Timer _timer;
  List<String> vueltas = [];
  String tiempo = '00:00:00';

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startStopwatch() {
    setState(() {
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          tiempo = _formatoTiempo(_stopwatch.elapsed);
        });
      });
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
      _timer.cancel();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      tiempo = '00:00:00';
      vueltas.clear();
    });
  }

  void _marcarVuelta() {
    setState(() {
      vueltas.add(tiempo);
    });
  }

  String _formatoTiempo(Duration duracion) {
    String dosDigitos(int n) => n.toString().padLeft(2, '0');
    String minutos = dosDigitos(duracion.inMinutes.remainder(60));
    String segundos = dosDigitos(duracion.inSeconds.remainder(60));
    String milisegundos =
        dosDigitos((duracion.inMilliseconds.remainder(1000) ~/ 10));
    return '$minutos:$segundos:$milisegundos';
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:const Text(
          'Cronómetro',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: (){
          Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Menu()));
        },
        ),
        backgroundColor:const  Color(0xFFFFA07A), 
        actions: [
            IconButton( color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfiguracionMenu()),
                  );
                },
                icon: Icon(Icons.settings))
          ],// Color de la barra superior
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Diseño del cronómetro en forma de reloj
            Stack(
              alignment: Alignment.center,
              children: [
                // Círculo que rodea el cronómetro
                Container(
                  width: 290,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFFFFA07A), width: 11),
                  ),
                ),
                // Texto del cronómetro
                Text(
                  tiempo,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Icono de Pausar/Iniciar
                ElevatedButton(
                  onPressed:
                      _stopwatch.isRunning ? _stopStopwatch : _startStopwatch,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150,50),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.lightGreen, // Fondo del icono
                  ),
                  child: Icon(
                    _stopwatch.isRunning ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                SizedBox(width: 10),
                // Icono de Reiniciar
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.redAccent, // Fondo del icono
                  ),
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Icono de marcar vuelta
            ElevatedButton(
              onPressed: _marcarVuelta,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 50),
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.lightBlue, // Fondo del icono
              ),
              child: Icon(
                Icons.flag,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: vueltas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('   ${index + 1}:  ${vueltas[index]}',
                        style: TextStyle(fontSize: 30)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        color: Colors.white,
        activeColor: Colors.white,
        backgroundColor: Color(0xFFFFA07A),
        padding: EdgeInsets.all(25),
        tabs: const [
          GButton(icon: Icons.run_circle,text: 'Rutinas',gap: 8,),
          GButton(icon: Icons.restaurant, text: 'Alimentación', gap: 8),
          GButton(icon: Icons.home, text: 'Inicio', gap: 8),
          GButton(icon: Icons.timer, text: 'Cronómetro', gap: 8),
          GButton(icon: Icons.calendar_today, text: 'Calendario', gap: 8),
        ],
        onTabChange: _onItemTapped, // Usa la función para manejar el cambio de tab
      ),
    );
  }
}

