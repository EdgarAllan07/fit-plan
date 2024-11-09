import 'package:flutter/material.dart';

class PlatosSugeridos extends StatefulWidget {
  const PlatosSugeridos({Key? key}) : super(key: key);

  @override
  State<PlatosSugeridos> createState() => _PlatosSugeridosState();
}

class PlatoComida {
  final String nombre;
  final String imagenPath;
  final String descripcion;

  PlatoComida({
    required this.nombre,
    required this.imagenPath,
    required this.descripcion,
  });
}

class _PlatosSugeridosState extends State<PlatosSugeridos> {
  late int diaSeleccionado;
  
  final List<String> diasSemana = [
    'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'
  ];

  // Estructura de datos para almacenar las comidas por día
  final Map<int, Map<String, List<PlatoComida>>> menuSemanal = {
    1: { // Lunes
      'Desayuno': [
        PlatoComida(
          nombre: 'Avena con frutas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Avena con frutas frescas y miel'
        ),
        PlatoComida(
          nombre: 'Tostadas integrales',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Tostadas con aguacate y huevo'
        ),
      ],
      'Almuerzo': [
        PlatoComida(
          nombre: 'Pollo a la plancha',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Pechuga de pollo a la plancha con especias'
        ),
        PlatoComida(
          nombre: 'Ensalada verde',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de lechugas con tomate y aguacate'
        ),
      ],
      'Merienda': [
        PlatoComida(
          nombre: 'Frutas secas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de almendras, nueces y pasas'
        ),
      ],
      'Cena': [
        PlatoComida(
          nombre: 'Sopa de verduras',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Sopa casera con vegetales frescos'
        ),
      ],
    },
    //Martes
    2: { 
      'Desayuno': [
        PlatoComida(
          nombre: 'Martes Avena con frutas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Avena con frutas frescas y miel'
        ),
        PlatoComida(
          nombre: 'Tostadas integrales',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Tostadas con aguacate y huevo'
        ),
      ],
      'Almuerzo': [
        PlatoComida(
          nombre: 'Pollo a la plancha',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Pechuga de pollo a la plancha con especias'
        ),
        PlatoComida(
          nombre: 'Ensalada verde',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de lechugas con tomate y aguacate'
        ),
      ],
      'Merienda': [
        PlatoComida(
          nombre: 'Frutas secas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de almendras, nueces y pasas'
        ),
      ],
      'Cena': [
        PlatoComida(
          nombre: 'Sopa de verduras',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Sopa casera con vegetales frescos'
        ),
      ],
    },//Miercoles
    3: { // Lunes
      'Desayuno': [
        PlatoComida(
          nombre: 'MIerocles Avena con frutas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Avena con frutas frescas y miel'
        ),
        PlatoComida(
          nombre: 'Tostadas integrales',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Tostadas con aguacate y huevo'
        ),
      ],
      'Almuerzo': [
        PlatoComida(
          nombre: 'Pollo a la plancha',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Pechuga de pollo a la plancha con especias'
        ),
        PlatoComida(
          nombre: 'Ensalada verde',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de lechugas con tomate y aguacate'
        ),
      ],
      'Merienda': [
        PlatoComida(
          nombre: 'Frutas secas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de almendras, nueces y pasas'
        ),
      ],
      'Cena': [
        PlatoComida(
          nombre: 'Sopa de verduras',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Sopa casera con vegetales frescos'
        ),
      ],
    },

    //Jueves
    4: { // Lunes
      'Desayuno': [
        PlatoComida(
          nombre: 'Jueves Avena con frutas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Avena con frutas frescas y miel'
        ),
        PlatoComida(
          nombre: 'Tostadas integrales',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Tostadas con aguacate y huevo'
        ),
      ],
      'Almuerzo': [
        PlatoComida(
          nombre: 'Pollo a la plancha',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Pechuga de pollo a la plancha con especias'
        ),
        PlatoComida(
          nombre: 'Ensalada verde',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de lechugas con tomate y aguacate'
        ),
      ],
      'Merienda': [
        PlatoComida(
          nombre: 'Frutas secas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de almendras, nueces y pasas'
        ),
      ],
      'Cena': [
        PlatoComida(
          nombre: 'Sopa de verduras',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Sopa casera con vegetales frescos'
        ),
      ],
    },
    //Viernes
    5: { // Lunes
      'Desayuno': [
        PlatoComida(
          nombre: 'Viernes Avena con frutas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Avena con frutas frescas y miel'
        ),
        PlatoComida(
          nombre: 'Tostadas integrales',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Tostadas con aguacate y huevo'
        ),
      ],
      'Almuerzo': [
        PlatoComida(
          nombre: 'Pollo a la plancha',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Pechuga de pollo a la plancha con especias'
        ),
        PlatoComida(
          nombre: 'Ensalada verde',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de lechugas con tomate y aguacate'
        ),
      ],
      'Merienda': [
        PlatoComida(
          nombre: 'Frutas secas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de almendras, nueces y pasas'
        ),
      ],
      'Cena': [
        PlatoComida(
          nombre: 'Sopa de verduras',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Sopa casera con vegetales frescos'
        ),
      ],
    },
    //Sabado
    6: { // Lunes
      'Desayuno': [
        PlatoComida(
          nombre: 'Sabado Avena con frutas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Avena con frutas frescas y miel'
        ),
        PlatoComida(
          nombre: 'Tostadas integrales',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Tostadas con aguacate y huevo'
        ),
      ],
      'Almuerzo': [
        PlatoComida(
          nombre: 'Pollo a la plancha',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Pechuga de pollo a la plancha con especias'
        ),
        PlatoComida(
          nombre: 'Ensalada verde',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de lechugas con tomate y aguacate'
        ),
      ],
      'Merienda': [
        PlatoComida(
          nombre: 'Frutas secas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de almendras, nueces y pasas'
        ),
      ],
      'Cena': [
        PlatoComida(
          nombre: 'Sopa de verduras',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Sopa casera con vegetales frescos'
        ),
      ],
    },
    //Domingo
    7: { // Lunes
      'Desayuno': [
        PlatoComida(
          nombre: 'Domin Avena con frutas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Avena con frutas frescas y miel'
        ),
        PlatoComida(
          nombre: 'Tostadas integrales',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Tostadas con aguacate y huevo'
        ),
      ],
      'Almuerzo': [
        PlatoComida(
          nombre: 'Pollo a la plancha',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Pechuga de pollo a la plancha con especias'
        ),
        PlatoComida(
          nombre: 'Ensalada verde',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de lechugas con tomate y aguacate'
        ),
      ],
      'Merienda': [
        PlatoComida(
          nombre: 'Frutas secas',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Mix de almendras, nueces y pasas'
        ),
      ],
      'Cena': [
        PlatoComida(
          nombre: 'Sopa de verduras',
          imagenPath: 'assets/ConsejosHidratacion/ch1.jpg',
          descripcion: 'Sopa casera con vegetales frescos'
        ),
      ],
    },
    
    // Agregar más días siguiendo la misma estructura
  };

  @override
  void initState() {
    super.initState();
    diaSeleccionado = DateTime.now().weekday;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){Navigator.pop(context);},
        ),
        centerTitle: false,
        title: const Text(
          'Platos Sugeridos',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFFFA07A), // Color pastel naranja
      ),
      body: Column(
        children: [
          // Selector de días
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: diasSemana.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(
                      diasSemana[index],
                      style: TextStyle(
                        color: diaSeleccionado == index + 1 
                          ? Colors.white 
                          : Colors.black,
                      ),
                    ),
                    selected: diaSeleccionado == index + 1,
                    selectedColor: Colors.lightGreen,
                    onSelected: (selected) {
                      setState(() {
                        diaSeleccionado = index + 1;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Lista de comidas del día
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: menuSemanal[diaSeleccionado]?.length ?? 0,
              itemBuilder: (context, index) {
                String tipoComida = menuSemanal[diaSeleccionado]?.keys.elementAt(index) ?? '';
                List<PlatoComida> platos = menuSemanal[diaSeleccionado]?[tipoComida] ?? [];
                
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      tipoComida,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    children: platos.map((plato) => PlatoCard(plato: plato)).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlatoCard extends StatelessWidget {
  final PlatoComida plato;

  const PlatoCard({
    Key? key,
    required this.plato,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              plato.imagenPath,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.restaurant,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plato.nombre,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  plato.descripcion,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}