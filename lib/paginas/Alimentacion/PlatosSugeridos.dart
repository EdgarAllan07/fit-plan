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
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  // Estructura de datos para almacenar las comidas por día
  final Map<int, Map<String, List<PlatoComida>>> menuSemanal = {
    1: {
      // Lunes
      'Desayuno': [
        //ImagenSugerida: Bowl de avena decorado con fresas, arándanos y semillas de chía
        PlatoComida(
            nombre: 'Bowl de Avena Energético',
            imagenPath: 'assets/PlatosSugeridos/ps1.jpg',
            descripcion:
                'Ingredientes: 1/2 taza de avena, 1 plátano, fresas, arándanos, miel, leche de almendras y chía. Preparación: Cocinar la avena con leche de almendras, añadir frutas picadas, decorar con semillas de chía y un toque de miel. Bebida sugerida: Té verde con limón'),
        //ImagenSugerida: Tostadas con aguacate machacado y huevo pochado
        PlatoComida(
            nombre: 'Tostadas Mediterráneas',
            imagenPath: 'assets/PlatosSugeridos/ps2.jpg',
            descripcion:
                'Ingredientes: Pan integral, aguacate, huevos, tomate cherry, albahaca y aceite de oliva. Preparación: Tostar el pan, untar aguacate machacado, añadir huevo pochado y decorar con tomates y albahaca. Bebida sugerida: Jugo de naranja natural'),
      ],
      'Almuerzo': [
        //ImagenSugerida: Filete de salmón al horno con hierbas y limón
        PlatoComida(
            nombre: 'Salmón al Horno con Hierbas',
            imagenPath: 'assets/PlatosSugeridos/ps3.jpg',
            descripcion:
                'Ingredientes: Filete de salmón, romero, tomillo, limón, ajo, aceite de oliva, papas baby. Preparación: Hornear el salmón con hierbas y limón, acompañar con papas baby asadas. Bebida sugerida: Agua mineral con rodajas de pepino'),
        //ImagenSugerida: Ensalada colorida con quinoa y vegetales
        PlatoComida(
            nombre: 'Ensalada Primavera',
            imagenPath: 'assets/PlatosSugeridos/ps4.jpg',
            descripcion:
                'Ingredientes: Espinacas baby, quinoa, tomates cherry, pepino, aguacate, nueces. Preparación: Mezclar vegetales frescos con quinoa cocida, aderezar con vinagreta de limón. Bebida sugerida: Limonada de menta'),
      ],
      'Merienda': [
        //ImagenSugerida: Parfait de yogur con capas de frutas y granola
        PlatoComida(
            nombre: 'Parfait de Yogur',
            imagenPath: 'assets/PlatosSugeridos/ps5.jpg',
            descripcion:
                'Ingredientes: Yogur griego, granola casera, miel, frutas del bosque. Preparación: Alternar capas de yogur con frutas y granola, finalizar con miel. Bebida sugerida: Smoothie de plátano'),
      ],
      'Cena': [
        //ImagenSugerida: Crema de calabaza decorada con semillas
        PlatoComida(
            nombre: 'Crema de Calabaza',
            imagenPath: 'assets/PlatosSugeridos/ps6.jpg',
            descripcion:
                'Ingredientes: Calabaza, cebolla, ajo, caldo vegetal, crema, jengibre. Preparación: Cocinar verduras, licuar hasta obtener textura cremosa, servir con semillas. Bebida sugerida: Infusión de manzanilla'),
      ],
    },
    2: {
      // Martes
      'Desayuno': [
        //ImagenSugerida: Stack de pancakes con frutas y miel
        PlatoComida(
            nombre: 'Pancakes de Banana',
            imagenPath: 'assets/PlatosSugeridos/ps7.jpg',
            descripcion:
                'Ingredientes: Harina de avena, plátano maduro, huevos, canela, esencia de vainilla. Preparación: Mezclar ingredientes, cocinar en sartén, servir con frutas frescas y miel. Bebida sugerida: Café con leche de almendras'),
        //ImagenSugerida: Bowl de açaí con frutas y granola
        PlatoComida(
            nombre: 'Bowl de Açaí',
            imagenPath: 'assets/PlatosSugeridos/ps8.jpg',
            descripcion:
                'Ingredientes: Pulpa de açaí, plátano congelado, frutas variadas, granola, coco rallado. Preparación: Licuar açaí con plátano, decorar con toppings frescos. Bebida sugerida: Agua de coco'),
      ],
      'Almuerzo': [
        //ImagenSugerida: Pechuga de pavo con verduras asadas
        PlatoComida(
            nombre: 'Pechuga de Pavo al Romero',
            imagenPath: 'assets/PlatosSugeridos/ps9.jpg',
            descripcion:
                'Ingredientes: Pechuga de pavo, romero fresco, ajo, limón, aceite de oliva, verduras asadas. Preparación: Marinar y hornear el pavo con hierbas, acompañar con vegetales. Bebida sugerida: Agua con gas y limón'),
        //ImagenSugerida: Ensalada colorida de quinoa con garbanzos
        PlatoComida(
            nombre: 'Ensalada de Quinoa',
            imagenPath: 'assets/PlatosSugeridos/ps10.jpg',
            descripcion:
                'Ingredientes: Quinoa, garbanzos, pimiento, cebolla roja, aceitunas, perejil. Preparación: Mezclar quinoa cocida con vegetales y legumbres, aderezar con vinagreta. Bebida sugerida: Jugo de zanahoria y naranja'),
      ],
      'Merienda': [
        //ImagenSugerida: Plato de hummus con vegetales
        PlatoComida(
            nombre: 'Hummus con Crudités',
            imagenPath: 'assets/PlatosSugeridos/ps11.jpg',
            descripcion:
                'Ingredientes: Garbanzos, tahini, limón, ajo, aceite de oliva, vegetales frescos. Preparación: Procesar garbanzos con condimentos, servir con bastones de verduras. Bebida sugerida: Té de jengibre'),
      ],
      'Cena': [
        //ImagenSugerida: Bowl vegetariano con arroz y garbanzos
        PlatoComida(
            nombre: 'Buddha Bowl',
            imagenPath: 'assets/PlatosSugeridos/ps12.jpg',
            descripcion:
                'Ingredientes: Arroz integral, garbanzos especiados, espinacas, zanahoria, aguacate, semillas. Preparación: Disponer ingredientes por secciones, añadir aderezo tahini. Bebida sugerida: Infusión de hierbas'),
      ],
    },
    3: {
      // Miércoles
      'Desayuno': [
        //ImagenSugerida: Smoothie bowl verde con toppings
        PlatoComida(
            nombre: 'Green Smoothie Bowl',
            imagenPath: 'assets/PlatosSugeridos/ps13.jpg',
            descripcion:
                'Ingredientes: Espinacas, plátano, mango, leche de almendras, semillas de chía, granola. Preparación: Licuar frutas y verduras, decorar con toppings variados. Bebida sugerida: Matcha latte'),
        //ImagenSugerida: Wrap de huevos revueltos con espinacas
        PlatoComida(
            nombre: 'Wrap Proteico',
            imagenPath: 'assets/PlatosSugeridos/ps14.jpg',
            descripcion:
                'Ingredientes: Tortilla integral, huevos, espinacas, champiñones, queso bajo en grasa. Preparación: Rellenar tortilla con huevos revueltos y vegetales salteados. Bebida sugerida: Smoothie de proteína'),
      ],
      'Almuerzo': [
        //ImagenSugerida: Bowl de arroz integral con pollo teriyaki
        PlatoComida(
            nombre: 'Pollo Teriyaki Bowl',
            imagenPath: 'assets/PlatosSugeridos/ps15.jpg',
            descripcion:
                'Ingredientes: Pollo, salsa teriyaki, arroz integral, brócoli, zanahorias, edamame. Preparación: Saltear pollo con salsa, servir sobre arroz con vegetales al vapor. Bebida sugerida: Té verde frío'),
        //ImagenSugerida: Ensalada asiática con fideos
        PlatoComida(
            nombre: 'Ensalada Oriental',
            imagenPath: 'assets/PlatosSugeridos/ps16.jpg',
            descripcion:
                'Ingredientes: Fideos soba, col morada, zanahoria, pepino, cilantro, cacahuetes. Preparación: Mezclar fideos cocidos con vegetales y aderezo de sésamo. Bebida sugerida: Kombucha'),
      ],
      'Merienda': [
        //ImagenSugerida: Tazón de frutas tropicales
        PlatoComida(
            nombre: 'Mix Tropical',
            imagenPath: 'assets/PlatosSugeridos/ps17.jpg',
            descripcion:
                'Ingredientes: Mango, piña, kiwi, maracuyá, coco fresco. Preparación: Cortar frutas en trozos, espolvorear coco rallado. Bebida sugerida: Agua de coco'),
      ],
      'Cena': [
        //ImagenSugerida: Tacos de pescado con guacamole
        PlatoComida(
            nombre: 'Tacos de Pescado',
            imagenPath: 'assets/PlatosSugeridos/ps18.jpg',
            descripcion:
                'Ingredientes: Pescado blanco, tortillas de maíz, col rallada, aguacate, lima, cilantro. Preparación: Pescado a la plancha con especias, servir en tortillas con toppings. Bebida sugerida: Agua de jamaica'),
      ],
    },
    4: {
      // Jueves
      'Desayuno': [
        //ImagenSugerida: Tostada francesa con frutas
        PlatoComida(
            nombre: 'French Toast Saludable',
            imagenPath: 'assets/PlatosSugeridos/ps19.jpg',
            descripcion:
                'Ingredientes: Pan integral, huevos, canela, vainilla, frutas del bosque, jarabe de arce. Preparación: Remojar pan en mezcla de huevo y especias, cocinar y decorar con frutas. Bebida sugerida: Chai tea latte'),
        //ImagenSugerida: Bowl de chía pudding con mango
        PlatoComida(
            nombre: 'Pudding de Chía Tropical',
            imagenPath: 'assets/PlatosSugeridos/ps20.jpg',
            descripcion:
                'Ingredientes: Semillas de chía, leche de coco, mango, coco rallado, almendras. Preparación: Mezclar chía con leche, refrigerar y decorar con frutas. Bebida sugerida: Smoothie de piña y coco'),
      ],
      'Almuerzo': [
        //ImagenSugerida: Lasaña de vegetales
        PlatoComida(
            nombre: 'Lasaña Vegetal',
            imagenPath: 'assets/PlatosSugeridos/ps21.jpg',
            descripcion:
                'Ingredientes: Láminas de lasaña integral, espinacas, champiñones, ricotta, salsa de tomate. Preparación: Alternar capas de pasta con vegetales y queso, hornear. Bebida sugerida: Vino tinto (opcional) o agua con gas'),
        //ImagenSugerida: Ensalada caprese
        PlatoComida(
            nombre: 'Ensalada Caprese',
            imagenPath: 'assets/PlatosSugeridos/ps22.jpg',
            descripcion:
                'Ingredientes: Tomates, mozzarella fresca, albahaca, aceite de oliva, vinagre balsámico. Preparación: Alternar rodajas de tomate y queso, decorar con albahaca. Bebida sugerida: Agua mineral con limón'),
      ],
      'Merienda': [
        //ImagenSugerida: Toast de aguacate con huevo
        PlatoComida(
            nombre: 'Avocado Toast',
            imagenPath: 'assets/PlatosSugeridos/ps23.jpg',
            descripcion:
                'Ingredientes: Pan de centeno, aguacate, huevo pochado, semillas, brotes. Preparación: Tostar pan, untar aguacate machacado, coronar con huevo. Bebida sugerida: Té verde'),
      ],
      'Cena': [
        //ImagenSugerida: Sopa de lentejas con verduras
        PlatoComida(
            nombre: 'Sopa de Lentejas',
            imagenPath: 'assets/PlatosSugeridos/ps24.jpg',
            descripcion:
                'Ingredientes: Lentejas, zanahoria, apio, cebolla, ajo, especias, caldo vegetal. Preparación: Cocinar lentejas con verduras y especias hasta obtener consistencia cremosa. Bebida sugerida: Infusión digestiva'),
      ],
    },
    5: {
      // Viernes (continuación)
      'Almuerzo': [
        //ImagenSugerida: Pescado al vapor con vegetales coloridos
        PlatoComida(
            nombre: 'Pescado al Vapor Asiático',
            imagenPath: 'assets/PlatosSugeridos/ps27.jpg',
            descripcion:
                'Ingredientes: Filete de pescado blanco, jengibre, cebollín, salsa de soja, pak choi, zanahorias. Preparación: Cocinar al vapor el pescado con aromáticos, servir con vegetales. Bebida sugerida: Té de jazmín'),
        //ImagenSugerida: Ensalada de algas y pepino
        PlatoComida(
            nombre: 'Ensalada Marina',
            imagenPath: 'assets/PlatosSugeridos/ps28.jpg',
            descripcion:
                'Ingredientes: Algas wakame, pepino, sésamo, edamame, vinagre de arroz, aceite de sésamo. Preparación: Hidratar algas, mezclar con vegetales y aderezo asiático. Bebida sugerida: Agua con pepino y menta'),
      ],
      'Merienda': [
        //ImagenSugerida: Batido verde en vaso alto
        PlatoComida(
            nombre: 'Green Power Smoothie',
            imagenPath: 'assets/PlatosSugeridos/ps29.jpg',
            descripcion:
                'Ingredientes: Espinacas, piña, manzana verde, jengibre, semillas de cáñamo, agua de coco. Preparación: Licuar todos los ingredientes hasta obtener consistencia suave. Bebida sugerida: El mismo smoothie'),
      ],
      'Cena': [
        //ImagenSugerida: Curry de garbanzos con arroz
        PlatoComida(
            nombre: 'Curry Vegetariano',
            imagenPath: 'assets/PlatosSugeridos/ps30.jpg',
            descripcion:
                'Ingredientes: Garbanzos, leche de coco, curry en polvo, tomate, espinacas, arroz basmati. Preparación: Cocinar garbanzos en salsa curry, servir sobre arroz. Bebida sugerida: Lassi de mango sin azúcar'),
      ],
    },
    6: {
      // Sábado
      'Desayuno': [
        //ImagenSugerida: Waffles integrales con frutas
        PlatoComida(
            nombre: 'Waffles Integrales',
            imagenPath: 'assets/PlatosSugeridos/ps31.jpg',
            descripcion:
                'Ingredientes: Harina integral, plátano, huevos, canela, vainilla, arándanos frescos, jarabe de arce. Preparación: Mezclar ingredientes, cocinar en waflera, servir con frutas frescas. Bebida sugerida: Cappuccino con leche de avena'),
        //ImagenSugerida: Bowl de quínoa con leche de almendras
        PlatoComida(
            nombre: 'Quinoa Breakfast Bowl',
            imagenPath: 'assets/PlatosSugeridos/ps32.jpg',
            descripcion:
                'Ingredientes: Quínoa, leche de almendras, canela, dátiles, almendras tostadas, plátano. Preparación: Cocinar quínoa con leche de almendras y especias, topped con frutas. Bebida sugerida: Golden milk'),
      ],
      'Almuerzo': [
        //ImagenSugerida: Bowl de poke con atún
        PlatoComida(
            nombre: 'Poke Bowl',
            imagenPath: 'assets/PlatosSugeridos/ps33.jpg',
            descripcion:
                'Ingredientes: Atún fresco, arroz sushi, aguacate, pepino, edamame, algas nori, salsa ponzu. Preparación: Disponer arroz, cubos de atún y vegetales en bowl, decorar con salsas. Bebida sugerida: Té verde helado'),
        //ImagenSugerida: Ensalada wakame con sésamo
        PlatoComida(
            nombre: 'Ensalada de Algas',
            imagenPath: 'assets/PlatosSugeridos/ps34.jpg',
            descripcion:
                'Ingredientes: Algas wakame, pepino, zanahoria, sésamo, jengibre encurtido, vinagreta asiática. Preparación: Hidratar algas, mezclar con vegetales y aderezo. Bebida sugerida: Agua de pepino'),
      ],
      'Merienda': [
        //ImagenSugerida: Bruschetta con tomate y albahaca
        PlatoComida(
            nombre: 'Bruschetta Saludable',
            imagenPath: 'assets/PlatosSugeridos/ps35.jpg',
            descripcion:
                'Ingredientes: Pan integral, tomates cherry, albahaca fresca, ajo, aceite de oliva, balsámico. Preparación: Tostar pan, mezclar tomates con hierbas y servir. Bebida sugerida: Spritz de sandía sin alcohol'),
      ],
      'Cena': [
        //ImagenSugerida: Pizza integral vegetariana
        PlatoComida(
            nombre: 'Pizza Veggie',
            imagenPath: 'assets/PlatosSugeridos/ps36.jpg',
            descripcion:
                'Ingredientes: Masa integral, salsa de tomate casera, mozzarella, champiñones, pimiento, albahaca. Preparación: Hornear masa con toppings hasta que el queso se derrita. Bebida sugerida: Agua mineral con rodaja de limón'),
      ],
    },
    7: {
      // Domingo
      'Desayuno': [
        //ImagenSugerida: Huevos benedictinos saludables
        PlatoComida(
            nombre: 'Huevos Benedict Light',
            imagenPath: 'assets/PlatosSugeridos/ps37.jpg',
            descripcion:
                'Ingredientes: Huevos, pan integral, espinacas salteadas, salsa holandesa light, salmón ahumado. Preparación: Montar huevos pochados sobre pan con espinacas y salmón. Bebida sugerida: Mimosa sin alcohol'),
        //ImagenSugerida: Porridge de avena con manzana caramelizada
        PlatoComida(
            nombre: 'Porridge de Manzana',
            imagenPath: 'assets/PlatosSugeridos/ps38.jpg',
            descripcion:
                'Ingredientes: Avena, leche de almendras, manzana, canela, nueces, miel. Preparación: Cocinar avena, topped con manzanas caramelizadas y nueces. Bebida sugerida: Café con leche de avena'),
      ],
      'Almuerzo': [
        //ImagenSugerida: Risotto de champiñones
        PlatoComida(
            nombre: 'Risotto de Hongos',
            imagenPath: 'assets/PlatosSugeridos/ps39.jpg',
            descripcion:
                'Ingredientes: Arroz arborio, variedad de hongos, caldo vegetal, vino blanco, parmesano, tomillo. Preparación: Cocinar arroz gradualmente con caldo, añadir hongos salteados. Bebida sugerida: Vino blanco (opcional) o agua con gas'),
        //ImagenSugerida: Ensalada de rúcula y pera
        PlatoComida(
            nombre: 'Ensalada de Pera y Gorgonzola',
            imagenPath: 'assets/PlatosSugeridos/ps40.jpg',
            descripcion:
                'Ingredientes: Rúcula, pera, queso gorgonzola, nueces, vinagreta de miel y mostaza. Preparación: Mezclar hojas con pera en láminas, queso y nueces. Bebida sugerida: Agua mineral con limón'),
      ],
      'Merienda': [
        //ImagenSugerida: Tabla de quesos y frutas
        PlatoComida(
            nombre: 'Mini Cheese Board',
            imagenPath: 'assets/PlatosSugeridos/ps41.jpg',
            descripcion:
                'Ingredientes: Selección de quesos bajos en grasa, uvas, higos, nueces, miel. Preparación: Disponer quesos y acompañamientos artísticamente. Bebida sugerida: Té de frutos rojos'),
      ],
      'Cena': [
        //ImagenSugerida: Sopa minestrone
        PlatoComida(
            nombre: 'Minestrone Casero',
            imagenPath: 'assets/PlatosSugeridos/ps42.jpg',
            descripcion:
                'Ingredientes: Pasta integral pequeña, frijoles, zanahorias, apio, tomate, albahaca, caldo vegetal. Preparación: Cocinar vegetales y pasta en caldo hasta que estén tiernos. Bebida sugerida: Infusión de manzanilla'),
      ],
    },
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
          onPressed: () {
            Navigator.pop(context);
          },
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
                String tipoComida =
                    menuSemanal[diaSeleccionado]?.keys.elementAt(index) ?? '';
                List<PlatoComida> platos =
                    menuSemanal[diaSeleccionado]?[tipoComida] ?? [];

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
                    children:
                        platos.map((plato) => PlatoCard(plato: plato)).toList(),
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
