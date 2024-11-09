import 'package:fit_plan_proyecto/paginas/Alimentacion/ConsejosHidratacion.dart';
import 'package:fit_plan_proyecto/paginas/Alimentacion/ConsejosNutricionales.dart';
import 'package:flutter/material.dart';

class Consejos extends StatefulWidget {
  const Consejos({super.key});

  @override
  _ConsejosState createState() => _ConsejosState();
}

class _ConsejosState extends State<Consejos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Consejos',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFFFA07A),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Divider(height: 25.0),
            ListTile(
              leading: Image.asset(
                'assets/images/consejosNutricionales.png',
                width: 100,
                height: 100,
              ),
              title: const Text(
                'Consejos Nutricionales',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Conoce un poco de nutrición',
                style: TextStyle(
                  fontSize: 14, // Ajusta el tamaño a tu preferencia
                  color: Colors.grey, // Puedes cambiar el color si deseas
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const ConsejosNutricionales()),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              tileColor: Colors.grey[100],
              contentPadding: const EdgeInsets.all(12.0),
            ),
            const Divider(height: 25.0),
            ListTile(
              leading: Image.asset(
                'assets/images/consejosHidratacion.jpg',
                width: 100,
                height: 100,
              ),
              title: const Text(
                'Consejos de Hidratación',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Mejora tu hidratación',
                style: TextStyle(
                  fontSize: 14, // Ajusta el tamaño a tu preferencia
                  color: Colors.grey, // Puedes cambiar el color si deseas
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConsejosHidratacion()),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              tileColor: Colors.grey[100],
              contentPadding: const EdgeInsets.all(12.0),
            ),
            const Divider(height: 25.0),
          ],
        ),
      ),
    );
  }

}
