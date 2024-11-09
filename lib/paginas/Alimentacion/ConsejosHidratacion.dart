import 'package:flutter/material.dart';

class ConsejosHidratacion extends StatelessWidget {
  const ConsejosHidratacion({super.key});

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
          'Consejos Hidratación',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFFFA07A), // Color pastel naranja
      ),
      body: ListView(
        children: [
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch1.jpg',
            title: 'Bebe agua al despertar',
            description:
                'Al empezar el día, hidratarse ayuda a activar el metabolismo.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch2.jpg',
            title: 'Mantén una botella a la mano',
            description:
                'Llevar una botella te recuerda beber agua durante el día.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch3.jpg',
            title: 'Usa una app de recordatorio',
            description:
                'Configura recordatorios en tu celular para beber agua regularmente.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch4.jpg',
            title: 'Consume frutas ricas en agua',
            description:
                'Frutas como sandía y melón aportan líquidos y vitaminas.',
          ),
        ],
      ),
    );
  }
}

class ConsejosHidratacionTile extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  ConsejosHidratacionTile({
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
