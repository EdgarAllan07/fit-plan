import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA07A), // Light Salmon color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildUserProfile(),
          SizedBox(height: 20),
          Expanded(child: _buildMenuGrid()),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person, color: Color(0xFFFFA07A)),
      ),
      title: Text(
        'Usuario',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Perfil',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget _buildMenuGrid() {
    final menuItems = [
      {'icon': Icons.lightbulb_outline, 'label': 'Tips'},
      {'icon': Icons.chat_bubble_outline, 'label': 'Chat de entrenamie...'},
      {'icon': Icons.description_outlined, 'label': 'Plan de entrenamie...'},
      {'icon': Icons.timer, 'label': 'Cronometro'},
      {'icon': Icons.restaurant_menu, 'label': 'Comidas'},
      {'icon': Icons.calendar_today, 'label': 'Horarios'},
      {'icon': Icons.settings, 'label': 'Configuraciones'},
    ];

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return _buildMenuItem(menuItems[index]['icon'] as IconData, menuItems[index]['label'] as String);
      },
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 30, color: Color(0xFFFFA07A)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 12),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}