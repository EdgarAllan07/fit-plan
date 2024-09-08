import 'package:flutter/material.dart';

class ResultadoPeso  extends StatelessWidget {

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA07A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Porcentaje de peso', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
                Text(overflow: TextOverflow.ellipsis, 'Segun el peso inicial versus el peso actualmente logrado el porcentaje de grasa perdida es:'),
             
              ElevatedButton(
                child: Text('Regresar', style: TextStyle(color: Color(0xFFFFA07A))),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                ),
                onPressed: () {
                  // Handle registration logic
                },
              ),
                SizedBox(height: 24),
              
              
            
            ],
          ),
        ),
      ),
    );
  }
}

