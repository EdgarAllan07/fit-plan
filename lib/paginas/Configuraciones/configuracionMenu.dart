import 'package:flutter/material.dart';

class ConfiguracionMenu extends StatelessWidget {
  const ConfiguracionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
        backgroundColor: const Color(0xFFFFA07A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}