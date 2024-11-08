import 'package:fit_plan_proyecto/paginas/Alimentacion/AgregarComidas.dart';
import 'package:fit_plan_proyecto/paginas/Alimentacion/ConsejosHidratacion.dart';
import 'package:fit_plan_proyecto/paginas/Alimentacion/ConsejosNutricionales.dart';
import 'package:fit_plan_proyecto/paginas/Alimentacion/HistorialComidas.dart';
import 'package:fit_plan_proyecto/paginas/Alimentacion/RecetasSaludables.dart';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';
import 'package:fit_plan_proyecto/paginas/Configuraciones/configuracionMenu.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Alimentacion extends StatefulWidget {
  const Alimentacion({super.key});

  @override
  _AlimentacionState createState() => _AlimentacionState();
}

class _AlimentacionState extends State<Alimentacion> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Alimentación',
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
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConfiguracionMenu()),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Divider(height: 25.0),
            ListTile(
              leading: Image.asset(
                'assets/images/platosSugeridos.png',
                width: 100,
                height: 100,
              ),
              title: const Text(
                'Platos Sugeridos',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                '¿Qué, No sabes qué comer hoy?',
                style: TextStyle(
                  fontSize: 14, // Ajusta el tamaño a tu preferencia
                  color: Colors.grey, // Puedes cambiar el color si deseas
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
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
                'assets/images/recetasSaludables.jpg',
                width: 100,
                height: 100,
              ),
              title: const Text(
                'Recetas Saludables',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Balancea tu dieta',
                style: TextStyle(
                  fontSize: 14, // Ajusta el tamaño a tu preferencia
                  color: Colors.grey, // Puedes cambiar el color si deseas
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const RecetasSaludables()),
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
                'assets/images/agregarComida.png',
                width: 100,
                height: 100,
              ),
              title: const Text(
                'Agregar mis comidas',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Registra las comidas hoy!',
                style: TextStyle(
                  fontSize: 14, // Ajusta el tamaño a tu preferencia
                  color: Colors.grey, // Puedes cambiar el color si deseas
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgregarComidas()),
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
            ListTile(
              leading: Image.asset(
                'assets/images/historialComidas.png',
                width: 100,
                height: 100,
              ),
              title: const Text(
                'Historial Comidas',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Se mostrará el historial de las comidas agregadas',
                style: TextStyle(
                  fontSize: 14, // Ajusta el tamaño a tu preferencia
                  color: Colors.grey, // Puedes cambiar el color si deseas
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistorialComidas()),
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
      bottomNavigationBar: GNav(
        color: Colors.white,
        activeColor: Colors.white,
        backgroundColor: const Color(0xFFFFA07A),
        padding: const EdgeInsets.all(25),
        tabs: const [
          GButton(icon: Icons.run_circle, text: 'Rutinas', gap: 8),
          GButton(icon: Icons.restaurant, text: 'Comidas', gap: 8),
          GButton(icon: Icons.home, text: 'Inicio', gap: 8),
          GButton(icon: Icons.timer, text: 'Cronómetro', gap: 8),
          GButton(icon: Icons.calendar_today, text: 'Calendario', gap: 8),
        ],
        onTabChange: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        print("Rutinas");
        break;
      case 1:
        print("Estas en Alimentacion");
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Menu()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cronometro()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendario()),
        );
        break;
    }
  }
}
