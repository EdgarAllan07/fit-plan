import 'package:flutter/material.dart';

class RecetasSaludables extends StatefulWidget {
  const RecetasSaludables({super.key});

  @override
  _RecetasSaludablesScreenState createState() =>
      _RecetasSaludablesScreenState();
}

class _RecetasSaludablesScreenState extends State<RecetasSaludables> {
  // Tipos de recetas
  String _selectedRecipeType = 'Todas';
  final List<String> _recipeTypes = [
    'Todas',
    'Veganas',
    'Vegetarianas',
    'Omnívoras',
    'Bajas en Carbohidratos',
    'Bajas en Azúcar'
  ];

  // Lista de recetas
  final List<Recipe> _recipes = [
    // Imagen sugerida: Ensalada de quinoa en un plato grande
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs1.jpg',
      title: 'Ensalada de Quinoa',
      ingredients: [
        'Quinoa',
        'Tomates',
        'Pepino',
        'Cebolla',
        'Aceite de oliva',
        'Limón',
        'Cilantro',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Cocina la quinoa y mezcla con el resto de los ingredientes. Sazona al gusto.',
      tags: ['Veganas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Plato con salmón y hierbas
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs2.jpg',
      title: 'Salmón al Horno',
      ingredients: [
        'Salmón',
        'Limón',
        'Ajo',
        'Hierbas (eneldo, perejil)',
        'Aceite de oliva',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Sazona el salmón con las hierbas, ajo, limón, sal y pimienta. Hornea hasta que esté cocido.',
      tags: ['Omnívoras', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Plato de hummus con verduras frescas alrededor
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs3.jpg',
      title: 'Hummus Casero',
      ingredients: [
        'Garbanzos',
        'Tahini',
        'Aceite de oliva',
        'Limón',
        'Ajo',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Licúa todos los ingredientes hasta obtener una mezcla suave. Sirve con verduras frescas.',
      tags: ['Veganas', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Pizza vegetariana con ingredientes coloridos
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs4.jpg',
      title: 'Pizza de Vegetales',
      ingredients: [
        'Base de pizza',
        'Tomate',
        'Pimiento',
        'Cebolla',
        'Champiñones',
        'Queso mozzarella',
        'Orégano'
      ],
      preparation:
          'Coloca los ingredientes sobre la base de pizza y hornea hasta que el queso se derrita.',
      tags: ['Vegetarianas'],
    ),

// Imagen sugerida: Ensalada de espinacas y fresas
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs5.jpg',
      title: 'Ensalada de Espinacas y Fresas',
      ingredients: [
        'Espinacas',
        'Fresas',
        'Nueces',
        'Queso de cabra',
        'Vinagre balsámico',
        'Aceite de oliva',
        'Sal'
      ],
      preparation:
          'Mezcla todos los ingredientes y sazona con vinagre balsámico y aceite de oliva.',
      tags: ['Vegetarianas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Burrito de frijoles envuelto
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs6.jpg',
      title: 'Burrito de Frijoles',
      ingredients: [
        'Tortilla',
        'Frijoles',
        'Lechuga',
        'Tomate',
        'Cebolla',
        'Guacamole',
        'Salsa picante'
      ],
      preparation:
          'Rellena la tortilla con los ingredientes y envuelve bien el burrito.',
      tags: ['Veganas'],
    ),

// Imagen sugerida: Bol de yogur con frutas frescas
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs7.jpg',
      title: 'Bol de Yogur y Frutas',
      ingredients: [
        'Yogur natural',
        'Frutas (fresas, arándanos, plátano)',
        'Granola',
        'Miel'
      ],
      preparation:
          'Sirve el yogur en un bol y añade frutas, granola y un toque de miel.',
      tags: ['Vegetarianas', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Pasta al pesto con piñones
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs8.jpg',
      title: 'Pasta al Pesto',
      ingredients: [
        'Pasta',
        'Albahaca fresca',
        'Piñones',
        'Ajo',
        'Aceite de oliva',
        'Parmesano',
        'Sal'
      ],
      preparation:
          'Cocina la pasta y mezcla con pesto casero hecho de albahaca, piñones y parmesano.',
      tags: ['Vegetarianas'],
    ),

// Imagen sugerida: Tazón de tofu y verduras coloridas
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs9.jpg',
      title: 'Bol de Tofu y Verduras',
      ingredients: [
        'Tofu',
        'Arroz integral',
        'Zanahoria',
        'Brócoli',
        'Salsa de soja',
        'Aceite de sésamo',
        'Semillas de sésamo'
      ],
      preparation:
          'Saltea el tofu y las verduras, y sirve sobre arroz con salsa de soja.',
      tags: ['Veganas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Filete de pollo a la parrilla con espárragos
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs10.jpg',
      title: 'Pollo a la Parrilla con Espárragos',
      ingredients: [
        'Pechuga de pollo',
        'Espárragos',
        'Aceite de oliva',
        'Limón',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Sazona el pollo y los espárragos, y cocina a la parrilla hasta que estén dorados.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Ensalada de kale con aguacate y semillas
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs11.jpg',
      title: 'Ensalada de Kale y Aguacate',
      ingredients: [
        'Kale',
        'Aguacate',
        'Semillas de calabaza',
        'Limón',
        'Aceite de oliva',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Mezcla todos los ingredientes y adereza con limón y aceite de oliva.',
      tags: ['Veganas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Hamburguesa vegana en un plato
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs12.jpg',
      title: 'Hamburguesa Vegana',
      ingredients: [
        'Pan de hamburguesa integral',
        'Hamburguesa de lentejas',
        'Lechuga',
        'Tomate',
        'Cebolla',
        'Salsa de aguacate'
      ],
      preparation:
          'Arma la hamburguesa con los ingredientes y acompaña con salsa de aguacate.',
      tags: ['Veganas'],
    ),

// Imagen sugerida: Plato con filete de pescado a la plancha
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs13.jpg',
      title: 'Pescado a la Plancha con Limón',
      ingredients: [
        'Filete de pescado',
        'Limón',
        'Ajo',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Sazona el pescado y cocina a la plancha hasta que esté dorado y crujiente.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Galletas de avena y chispas de chocolate
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs14.jpg',
      title: 'Galletas de Avena',
      ingredients: [
        'Avena',
        'Harina integral',
        'Aceite de coco',
        'Chispas de chocolate oscuro',
        'Banana madura'
      ],
      preparation:
          'Mezcla todos los ingredientes y hornea hasta que las galletas estén doradas.',
      tags: ['Veganas', 'Bajas en Azúcar'],
    ),
// Imagen sugerida: Plato de falafel con salsa tahini
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs15.jpg',
      title: 'Falafel al Horno',
      ingredients: [
        'Garbanzos',
        'Ajo',
        'Cebolla',
        'Perejil',
        'Comino',
        'Aceite de oliva',
        'Sal'
      ],
      preparation:
          'Procesa todos los ingredientes, forma bolitas y hornea hasta que estén doradas.',
      tags: ['Veganas', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Ensalada de frutas frescas coloridas
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs16.jpg',
      title: 'Ensalada de Frutas Frescas',
      ingredients: [
        'Fresas',
        'Plátano',
        'Kiwi',
        'Mango',
        'Uvas',
        'Menta',
        'Limón'
      ],
      preparation:
          'Corta las frutas en trozos, mezcla y añade un toque de limón y menta fresca.',
      tags: ['Veganas', 'Bajas en Carbohidratos', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Tazón de avena con frutas y nueces
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs17.jpg',
      title: 'Avena con Frutas y Nueces',
      ingredients: [
        'Avena',
        'Leche de almendra',
        'Frutas (plátano, arándanos)',
        'Nueces',
        'Miel'
      ],
      preparation:
          'Cocina la avena en leche de almendra y sirve con frutas y nueces.',
      tags: ['Vegetarianas', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Rollitos de pepino con queso y hierbas
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs18.jpg',
      title: 'Rollitos de Pepino y Queso',
      ingredients: [
        'Pepino',
        'Queso crema bajo en grasa',
        'Hierbas frescas (eneldo, perejil)',
        'Pimienta'
      ],
      preparation:
          'Corta el pepino en tiras largas y delgadas, unta queso crema y enrolla.',
      tags: ['Vegetarianas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Tazón de smoothie verde
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs19.jpg',
      title: 'Smoothie Verde',
      ingredients: [
        'Espinacas',
        'Plátano',
        'Leche de almendra',
        'Semillas de chía',
        'Miel'
      ],
      preparation:
          'Licúa todos los ingredientes hasta obtener una mezcla suave y sirve frío.',
      tags: ['Veganas', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Plato de fajitas de pollo y vegetales
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs20.jpg',
      title: 'Fajitas de Pollo',
      ingredients: [
        'Pechuga de pollo',
        'Pimiento',
        'Cebolla',
        'Especias (comino, pimentón)',
        'Aceite de oliva',
        'Sal'
      ],
      preparation:
          'Corta el pollo y los vegetales, sazona y cocina en una sartén hasta que estén dorados.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Ensalada de col rizada y zanahoria
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs21.jpg',
      title: 'Ensalada de Col Rizada y Zanahoria',
      ingredients: [
        'Col rizada',
        'Zanahoria rallada',
        'Nueces',
        'Pasas',
        'Vinagre balsámico',
        'Aceite de oliva'
      ],
      preparation:
          'Mezcla todos los ingredientes y adereza con vinagre balsámico y aceite de oliva.',
      tags: ['Veganas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Plátano cortado en rodajas con crema de almendra
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs22.jpg',
      title: 'Plátano con Crema de Almendra',
      ingredients: [
        'Plátano',
        'Crema de almendra sin azúcar',
        'Canela'
      ],
      preparation:
          'Corta el plátano en rodajas y unta un poco de crema de almendra. Espolvorea con canela.',
      tags: ['Veganas', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Plato de espagueti de calabacín con salsa de tomate
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs23.jpg',
      title: 'Espagueti de Calabacín con Salsa de Tomate',
      ingredients: [
        'Calabacín',
        'Tomate',
        'Ajo',
        'Albahaca',
        'Aceite de oliva',
        'Sal'
      ],
      preparation:
          'Haz espaguetis con el calabacín y mezcla con una salsa de tomate casera.',
      tags: ['Veganas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Tazón de sopa miso con tofu
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs24.jpg',
      title: 'Sopa Miso con Tofu',
      ingredients: [
        'Caldo de verduras',
        'Miso',
        'Tofu',
        'Algas',
        'Cebolla verde'
      ],
      preparation:
          'Calienta el caldo, agrega el miso, tofu y las algas, y sirve con cebolla verde picada.',
      tags: ['Veganas', 'Bajas en Carbohidratos', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Plato de tacos de lechuga con carne
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs25.jpg',
      title: 'Tacos de Lechuga',
      ingredients: [
        'Hojas de lechuga',
        'Carne molida',
        'Tomate',
        'Cebolla',
        'Especias (comino, ajo)',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Rellena las hojas de lechuga con carne molida sazonada y los vegetales.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Plato de pechuga de pavo al horno con verduras
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs26.jpg',
      title: 'Pavo al Horno con Verduras',
      ingredients: [
        'Pechuga de pavo',
        'Zanahorias',
        'Brócoli',
        'Limón',
        'Aceite de oliva',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Sazona el pavo y las verduras, y hornea hasta que estén cocidos y dorados.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Ensalada de aguacate y mango
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs27.jpg',
      title: 'Ensalada de Aguacate y Mango',
      ingredients: [
        'Aguacate',
        'Mango',
        'Lechuga',
        'Cebolla roja',
        'Vinagreta de limón'
      ],
      preparation:
          'Corta el aguacate y el mango, mezcla con lechuga y cebolla, y adereza con vinagreta.',
      tags: ['Veganas', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Plato de pollo asado con limón y especias
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs28.jpg',
      title: 'Pollo Asado con Limón y Especias',
      ingredients: [
        'Pollo entero',
        'Limón',
        'Ajo',
        'Romero',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Sazona el pollo con limón y especias, y hornea hasta que esté dorado.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos'],
    ),

// Imagen sugerida: Ensalada con camarones y aguacate
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs29.jpg',
      title: 'Ensalada de Camarones y Aguacate',
      ingredients: [
        'Camarones',
        'Aguacate',
        'Lechuga',
        'Pepino',
        'Aderezo de limón'
      ],
      preparation:
          'Cocina los camarones y mezcla con el resto de los ingredientes. Adereza con limón.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos', 'Bajas en Azúcar'],
    ),

// Imagen sugerida: Tortilla de espinaca y champiñones
Recipe(
      imageAsset: 'assets/RecetasSaludables/rs30.jpg',
      title: 'Tortilla de Espinacas y Champiñones',
      ingredients: [
        'Huevos',
        'Espinacas',
        'Champiñones',
        'Sal',
        'Pimienta'
      ],
      preparation:
          'Bate los huevos y mezcla con las espinacas y champiñones. Cocina en una sartén hasta que esté cuajada.',
      tags: ['Omnívoras', 'Bajas en Carbohidratos'],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: const Text(
          'Recetas Saludables',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFFFA07A),
      ),
      body: Column(
        children: [
          // Filtro de tipos de recetas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: _selectedRecipeType,
              onChanged: (newValue) {
                setState(() {
                  _selectedRecipeType = newValue!;
                });
              },
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              dropdownColor: Colors.white,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              underline: Container(
                height: 2,
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(8.0),
              elevation: 8,
              items: _recipeTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // Lista de recetas filtrada
          Expanded(
            child: ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                if (_selectedRecipeType == 'Todas' ||
                    recipe.tags.contains(_selectedRecipeType)) {
                  return Card(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              width: double.infinity,
                              height:
                                  200, // Ajusta la altura según tus necesidades
                              child: Image.asset(
                                recipe.imageAsset,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            recipe.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Ingredientes: ${recipe.ingredients.join(', ')}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Preparación: ${recipe.preparation}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Recipe {
  final String imageAsset;
  final String title;
  final List<String> ingredients;
  final String preparation;
  final List<String> tags;

  Recipe({
    required this.imageAsset,
    required this.title,
    required this.ingredients,
    required this.preparation,
    required this.tags,
  });
}
