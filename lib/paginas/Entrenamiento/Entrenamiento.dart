import 'package:fit_plan_proyecto/paginas/Alimentacion/Alimentacion.dart';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';
import 'package:fit_plan_proyecto/paginas/Configuraciones/configuracionMenu.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Entrenamiento extends StatefulWidget {
  @override
  _EntrenamientoState createState() => _EntrenamientoState();
}

class _EntrenamientoState extends State<Entrenamiento> {
  final List<String> levels = [
    "Nivel 1: Principiante",
    "Nivel 2: Intermedio",
    "Nivel 3: Avanzado"
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Planes de Entrenamiento',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFFFA07A),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConfiguracionMenu()),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Consejos importantes antes de iniciar ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                )),
            SizedBox(height: 10),
            const Text(
                "Calentamiento: Antes de comenzar cada rutina, dedica 5-10 minutos a un calentamiento ligero.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(height: 10),
            const Text(
                "Escucha a tu cuerpo: No te exijas más de lo que puedes manejar, para evitar lesiones.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(height: 10),
            const Text(
                "Descanso: No olvides la importancia de descansar, especialmente con entrenamientos intensos.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(levels[index],
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LevelDetailsScreen(level: levels[index]),
                        ),
                      );
                    },
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
        backgroundColor: const Color(0xFFFFA07A),
        padding: const EdgeInsets.all(25),
        tabs: const [
          GButton(icon: Icons.run_circle, text: 'Rutinas', gap: 8),
          GButton(icon: Icons.restaurant, text: 'Comidas', gap: 8),
          GButton(icon: Icons.home, text: 'Inicio', gap: 8),
          GButton(icon: Icons.timer, text: 'Cronómetro', gap: 8),
          GButton(icon: Icons.calendar_today, text: 'Calendario', gap: 8),
        ],
        onTabChange: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        print("Estas en Rutinas");
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Alimentacion()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Menu()));
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cronometro()),
        );
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Calendario()));
        break;
    }
  }
}

class LevelDetailsScreen extends StatelessWidget {
  final String level;

  LevelDetailsScreen({required this.level});

  final Map<String, List<String>> routines = {
    "Nivel 1: Principiante": [
      "Sentadillas",
      "Flexiones de rodillas",
      "Puente de glúteos",
      "Plancha",
      "Estocadas",
      "Superman",
      "Marcha en el sitio"
    ],
    "Nivel 2: Intermedio": [
      "Sentadillas con salto",
      "Flexiones de pecho",
      "Estocadas con mancuernas",
      "Plancha con elevación de pierna",
      "Dominadas asistidas",
      "Saltos y flexiones",
      "Alpinista"
    ],
    "Nivel 3: Avanzado": [
      "Sentadillas con barra",
      "Flexiones con palmada",
      "Estocadas con barra o mancuernas",
      "Dominadas",
      "Plancha con toque de hombros",
      "Alpinista con salto alto"
    ],
  };

  String mensaje() {
    switch (level) {
      case 'Nivel 1: Principiante':
        return 'Antes de empezar, realiza un calentamiento dinámico. El objetivo de este nivel es establecer una base de acondicionamiento físico.';
      case 'Nivel 2: Intermedio':
        return 'Este nivel busca aumentar la intensidad, mejorar la fuerza muscular, la resistencia y la movilidad.';
      case 'Nivel 3: Avanzado':
        return 'El nivel avanzado se enfoca en ejercicios de alta intensidad, mayor volumen de trabajo y técnicas avanzadas.';
      default:
        return 'No mensaje';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(level,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          backgroundColor: const Color(0xFFFFA07A),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rutina:',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(mensaje(),
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 17)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: routines[level]?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(routines[level]![index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoutineScreen(
                            exercise: routines[level]![index],
                            level: level,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutineScreen extends StatelessWidget {
  final String exercise;
  final String level;

  RoutineScreen({required this.exercise, required this.level});

  String mensaje() {
    switch (level) {
      case 'Nivel 1: Principiante':
        return 'Duración: 30-40 minutos.\n\nFrecuencia: 3-4 veces por semana.\n\nRutina: Realizar cada ejercicio durante 30-45 segundos, con 15-30 segundos de descanso. Completar 2-3 rondas.';
      case 'Nivel 2: Intermedio':
        return 'Frecuencia: 4-5 veces por semana.\n\nDuración: 40-50 minutos.\n\nRutina: Realizar cada ejercicio durante 45-60 segundos, con 15-30 segundos de descanso. Completar 3-4 rondas.';
      case 'Nivel 3: Avanzado':
        return 'Frecuencia: 5-6 veces por semana.\n\nDuración: 50-70 minutos.\n\nRutina: Realizar cada ejercicio durante 45-75 segundos, con 15-20 segundos de descanso. Completar 4-5 rondas.';
      default:
        return 'No mensaje';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(exercise,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          backgroundColor: const Color(0xFFFFA07A),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          mensaje(),
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
