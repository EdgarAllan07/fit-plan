import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';

class Entrenamiento extends StatelessWidget {
  final List<String> levels = [
    "Nivel 1: Principiante",
    "Nivel 2: Intermedio",
    "Nivel 3: Avanzado"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Planes de Entrenamiento',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            backgroundColor: const Color(0xFFFFA07A),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
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
                  "Calentamiento: Antes de comenzar cada rutina, dedica 5-10 minutos a un calentamiento ligero (como trotar en el sitio, hacer estiramientos dinámicos o ejercicios de movilidad articular.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              SizedBox(height: 10),
              const Text(
                  "Escucha a tu cuerpo: No te exijas más de lo que puedes manejar, esto para evitar lesiones cuando estés comenzando..",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              SizedBox(height: 10),
              const Text(
                  "Descanso: No olvides la importancia de descansar. Si estás trabajando a niveles altos de intensidad, asegúrate de descansar adecuadamente entre los días de entrenamiento.",
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
        ));
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
      "Planch",
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
        return 'Antes de empezar realiza calentamiento dinámico (movimientos para preparar cuerpo y músculos. El objetivo de este nivel es establecer una base de acondicionamiento físico, mejorar la movilidad y la técnica, y construir resistencia.';
        break;
      case 'Nivel 2: Intermedio':
        return 'Este nivel busca aumentar la intensidad, mejorar la fuerza muscular, la resistencia y la movilidad, esto hace que los ejercicios sean más desafiantes.';
      case 'Nivel 3: Avanzado':
        return 'El nivel avanzado se enfoca en ejercicios de alta intensidad, mayor volumen de trabajo y técnicas avanzadas. El entrenamiento puede incluir ejercicios con más carga y movimientos más complejos.';
        break;
      default:
        return 'No mensaje';
        break;
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
        return 'Duración: 30-40 minutos. \n\nFrecuencia: 3-4 veces por semana. \n\nRutina: Realizar cada ejercicio durante 30-45 segundos, con 15-30 segundos de descanso entre cada ronda. Completar 2-3 rondas.';
        break;
      case 'Nivel 2: Intermedio':
        return 'Frecuencia: 4-5 veces por semana.\n\nDuración: 40-50 minutos.\n\nRutina: Realizar cada ejercicio durante 45-60 segundos, con 15-30 segundos de descanso entre cada uno. Completar 3-4 rondas.';
      case 'Nivel 3: Avanzado':
        return 'Frecuencia: 5-6 veces por semana.\n\nDuración: 50-70 minutos.\n\nRutina: Realizar cada ejercicio durante 45-75 segundos, con 15-20 segundos de descanso entre cada uno. Completar 4-5 rondas.';
        break;
      default:
        return 'No mensaje';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('$exercise - $level',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'Ejercicio: $exercise',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(mensaje(),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Lógica del temporizador o detalles específicos.
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cronometro()));
                },
                child: Text('Iniciar Temporizador'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
