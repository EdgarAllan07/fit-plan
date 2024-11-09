import 'package:flutter/material.dart';

class ConsejosNutricionales extends StatelessWidget {
  const ConsejosNutricionales({super.key});

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
          'Consejos Nutricionales',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFFFA07A), // Color pastel naranja
      ),
      body: ListView(
        children: [
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn1.jpg',
            title: 'Incluye proteínas en cada comida',
            description:
                'Las proteínas son esenciales para la reparación y construcción muscular.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn2.jpg',
            title: 'Elige carbohidratos complejos',
            description:
                'Opta por carbohidratos de absorción lenta, como granos enteros, para mantenerte con energía.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn3.jpg',
            title: 'Consume grasas saludables',
            description:
                'Incorporar aguacate, aceite de oliva y frutos secos ayuda a tu corazón.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn4.jpg',
            title: 'Incluye más verduras verdes',
            description:
                'Verduras como espinaca y brócoli son ricas en nutrientes esenciales.',
          ),
        ],
      ),
    );
  }
}

class ConsejosNutricionalesTile extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  ConsejosNutricionalesTile({
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100], // Color gris claro
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageAsset,
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey, // Color gris
                      ),
                    ),
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
