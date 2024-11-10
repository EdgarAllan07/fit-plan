import 'package:fit_plan_proyecto/paginas/Alimentacion/Alimentacion.dart';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/paginas/Entrenamiento/Entrenamiento.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ConfiguracionMenu extends StatefulWidget {
  const ConfiguracionMenu({super.key});

  @override
  State<ConfiguracionMenu> createState() => _ConfiguracionMenuState();
}

class _ConfiguracionMenuState extends State<ConfiguracionMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Configuraciones',style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: const Color(0xFFFFA07A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(),
              ),
            );
          },
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.brush),
            title: Text('Apariencia'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Cuenta'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Ayuda'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Uso de privacidad'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        color: Colors.white,
        activeColor: Colors.white,
        backgroundColor: const Color(0xFFFFA07A),
        padding: const EdgeInsets.all(25),
        tabs: const [
          GButton(icon: Icons.run_circle, text: 'Rutinas', gap: 8),
          GButton(icon: Icons.restaurant, text: 'Alimentación', gap: 8),
          GButton(icon: Icons.home, text: 'Inicio', gap: 8),
          GButton(icon: Icons.timer, text: 'Cronómetro', gap: 8),
          GButton(icon: Icons.calendar_today, text: 'Calendario', gap: 8)
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Entrenamiento()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Alimentacion()),
        );
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
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendario()),
        );
    }
  }
}
