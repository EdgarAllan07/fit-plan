import 'package:flutter/material.dart';

class ConsejosHidratacion extends StatelessWidget {
  const ConsejosHidratacion({super.key});

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
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch5.jpg',
            title: 'Establece metas diarias de agua',
            description:
                'Fija la cantidad de agua que deseas beber al día para motivarte.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch6.jpg',
            title: 'Evita bebidas azucaradas',
            description:
                'El azúcar no hidrata; reemplaza refrescos con agua o infusiones.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch7.jpg',
            title: 'Toma agua antes de cada comida',
            description:
                'Beber agua antes de comer mejora la digestión y ayuda a controlar el apetito.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch8.jpg',
            title: 'Agrega sabor con frutas',
            description:
                'Añade rodajas de limón, pepino o menta para dar sabor al agua.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch9.jpg',
            title: 'Consume té de hierbas sin azúcar',
            description:
                'Los tés sin cafeína aportan líquidos y son una buena alternativa al agua.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch10.jpg',
            title: 'Come vegetales frescos',
            description:
                'Verduras como pepino, lechuga y apio tienen alto contenido de agua.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch11.jpg',
            title: 'Usa una botella con filtro',
            description:
                'Una botella con filtro permite beber agua purificada donde estés.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch12.jpg',
            title: 'Evita el exceso de cafeína',
            description: 'La cafeína puede deshidratarte; modera su consumo.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch13.jpg',
            title: 'Hidrátate durante el ejercicio',
            description:
                'Bebe agua antes, durante y después del ejercicio para evitar la deshidratación.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch14.jpg',
            title: 'Usa una botella con indicador de tiempo',
            description:
                'Una botella con horarios impresos puede ayudarte a beber en intervalos regulares.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch15.jpg',
            title: 'Revisa el color de tu orina',
            description:
                'Un color claro indica buena hidratación, mientras que un color oscuro puede señalar deshidratación.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch16.jpg',
            title: 'Come sopas y caldos',
            description:
                'Las sopas, especialmente en invierno, son una excelente fuente de líquidos.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch17.jpg',
            title: 'Hidrátate antes de sentir sed',
            description:
                'La sed es señal de deshidratación, así que trata de beber regularmente antes de tener sed.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch18.jpg',
            title: 'Reduce el alcohol',
            description:
                'Las bebidas alcohólicas deshidratan; modera su consumo y acompáñalas de agua.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch19.jpg',
            title: 'Toma agua fría en días calurosos',
            description:
                'El agua fría ayuda a refrescar el cuerpo en climas cálidos.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch20.jpg',
            title: 'Bebe más en altitudes altas',
            description:
                'La altitud puede hacer que te deshidrates más rápido; aumenta tu consumo de agua si estás en la montaña.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch21.jpg',
            title: 'Mantén un horario de hidratación',
            description:
                'Establece horarios específicos para beber agua a lo largo del día.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch22.jpg',
            title: 'Usa pajillas reutilizables',
            description:
                'Beber agua con una pajilla reutilizable puede hacer que tomes más sin darte cuenta.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch23.jpg',
            title: 'Incorpora leche o alternativas vegetales',
            description:
                'Leche y bebidas vegetales como leche de almendra o avena aportan líquidos y nutrientes.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch24.jpg',
            title: 'Toma bebidas isotónicas después de ejercicio intenso',
            description:
                'Ayudan a reponer electrolitos y líquidos perdidos tras un entrenamiento riguroso.',
          ),
          ConsejosHidratacionTile(
            imageAsset: 'assets/ConsejosHidratacion/ch25.jpg',
            title: 'Refresca tu piel con agua en spray',
            description:
                'Un rociador de agua en la piel puede ayudar a sentirte más hidratado y fresco.',
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
