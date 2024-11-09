import 'package:flutter/material.dart';

class ConsejosNutricionales extends StatelessWidget {
  const ConsejosNutricionales({super.key});

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
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn5.jpg',
            title: 'Modera el azúcar',
            description:
                'Evita el azúcar añadido para mejorar tus niveles de energía.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn6.jpg',
            title: 'Bebe suficiente agua',
            description:
                'Mantente hidratado para que tu metabolismo funcione correctamente.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn7.jpg',
            title: 'Elige alimentos integrales',
            description:
                'Opta por alimentos no procesados para obtener más nutrientes.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn8.jpg',
            title: 'Incluye fibra en tu dieta',
            description:
                'La fibra mejora la digestión y ayuda a sentir saciedad.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn9.jpg',
            title: 'Varía tus fuentes de proteínas',
            description:
                'Combina proteínas animales y vegetales para una dieta equilibrada.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn10.jpg',
            title: 'Come despacio',
            description:
                'Comer lentamente ayuda a la digestión y evita comer en exceso.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn11.png',
            title: 'Evita las bebidas azucaradas',
            description:
                'Las bebidas azucaradas pueden añadir calorías vacías.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn12.jpg',
            title: 'Incluye probióticos',
            description:
                'Yogur y kéfir son ricos en probióticos, buenos para la salud intestinal.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn13.jpg',
            title: 'Cocina más en casa',
            description:
                'Cocinar en casa permite controlar los ingredientes y la calidad de la comida.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn14.jpg',
            title: 'Modera el consumo de sal',
            description: 'Reducir el sodio es bueno para la presión arterial.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn15.jpg',
            title: 'Incluye antioxidantes',
            description:
                'Alimentos como arándanos y té verde ayudan a combatir el estrés oxidativo.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn16.jpg',
            title: 'Come frutos secos con moderación',
            description: 'Son ricos en nutrientes, pero también en calorías.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn17.jpg',
            title: 'Sigue un horario de comidas',
            description:
                'Comer a intervalos regulares ayuda a mantener estables los niveles de azúcar.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn18.jpg',
            title: 'Presta atención a las porciones',
            description:
                'Comer porciones adecuadas puede ayudarte a controlar el peso.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn19.jpg',
            title: 'Incluye frutas en cada comida',
            description: 'Las frutas aportan vitaminas y antioxidantes.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn20.jpg',
            title: 'Modera el consumo de carne roja',
            description:
                'La carne roja en exceso puede elevar el colesterol; inclúyela ocasionalmente.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn21.jpg',
            title: 'Evita los alimentos fritos',
            description:
                'Los alimentos fritos tienen grasas trans; mejor hornea o asa.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn22.jpg',
            title: 'Consume pescado regularmente',
            description:
                'El pescado es una buena fuente de omega-3 para el cerebro y el corazón.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn23.jpg',
            title: 'Evita las dietas restrictivas',
            description:
                'Las dietas extremas pueden llevar a deficiencias nutricionales.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn24.jpg',
            title: 'Lee las etiquetas nutricionales',
            description:
                'Las etiquetas te ayudan a entender los ingredientes y el contenido calórico.',
          ),
          ConsejosNutricionalesTile(
            imageAsset: 'assets/ConsejosNutricionales/cn25.jpg',
            title: 'Consulta a un profesional',
            description:
                'Un nutricionista puede ayudarte a personalizar una dieta saludable.',
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
