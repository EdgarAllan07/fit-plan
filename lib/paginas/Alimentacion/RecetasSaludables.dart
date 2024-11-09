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
    // Tus recetas...
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

//Agregar mas recetas 
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
