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
              Navigator.pop(context);
            },
          )),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
        child:Column(
        children: [
          
          const Text("Consejos importantes antes de iniciar ",textAlign: TextAlign.justify,
              style: TextStyle(
                  
                  fontSize: 15,
                  color: Colors.black,)),
          const Text(
              "Calentamiento: Antes de comenzar cada rutina, dedica 5-10 minutos a un calentamiento ligero (como trotar en el sitio, hacer estiramientos dinámicos o ejercicios de movilidad articular.",textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black)),
          const Text(
              "Escucha a tu cuerpo: No te exijas más de lo que puedes manejar, esto para evitar lesiones cuando estés comenzando..",textAlign: TextAlign.justify,
              style: TextStyle(
                  
                  fontSize: 15,
                  color: Colors.black)),
          const Text(
              "Descanso: No olvides la importancia de descansar. Si estás trabajando a niveles altos de intensidad, asegúrate de descansar adecuadamente entre los días de entrenamiento.",textAlign: TextAlign.justify,
              style: TextStyle(
                  
                  fontSize: 15,
                  color: Colors.black)),
          Expanded(
            child: ListView.builder(
              itemCount: levels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(levels[index]),
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
      
      )
    );
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
            Text('Rutina:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ejercicio: $exercise',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
