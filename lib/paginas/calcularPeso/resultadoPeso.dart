import 'package:flutter/material.dart';

class ResultadoPeso  extends StatelessWidget {
  const ResultadoPeso({super.key});


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA07A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Porcentaje de peso', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
                const Text(overflow: TextOverflow.ellipsis, 'Segun el peso inicial versus el peso actualmente logrado el porcentaje de grasa perdida es:'),
             
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                ),
                onPressed: () {
                  // Handle registration logic
                },
                child: Text('Regresar', style: TextStyle(color: Color(0xFFFFA07A))),
              ),
                const SizedBox(height: 24),
              
              
            
            ],
          ),
        ),
      ),
    );
  }
}

