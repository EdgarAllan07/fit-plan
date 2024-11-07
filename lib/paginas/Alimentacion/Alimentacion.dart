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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Menu()));
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
        padding:const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/images/logo.png'),
              title:const Text('Historial de Comidas'),
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
              contentPadding:const EdgeInsets.all(12.0),
            ),
            const Divider (height: 25.0),
            ListTile(
              leading:const  Icon(Icons.food_bank),
              title: const Text('Plan del día'),
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
              leading: Image.asset('assets/images/recetas.png',
              width: 100,
              height: 100,
              ),
              title: const Text('Recetas',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
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
              contentPadding:const EdgeInsets.all(12.0),
            ),
            const Divider(height: 25.0),
            ListTile(
              leading:const Icon(Icons.shopping_basket),
              title: const Text('Lista de Compras'),
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
              contentPadding:const EdgeInsets.all(12.0),
            ),
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
