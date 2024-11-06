import 'package:fit_plan_proyecto/paginas/Notas/ListaNotasScreen.dart';
import 'package:fit_plan_proyecto/paginas/registro.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/Calendario/Calendario.dart';
import 'Configuraciones/configuracionMenu.dart';
import 'calcularPeso/resultadoPeso.dart';
import 'package:fit_plan_proyecto/paginas/login.dart';

class Menu extends StatelessWidget {
  final AuthService _auth = AuthService();

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
          Expanded(child: _buildMenuGrid(context)),
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

  Widget _buildMenuGrid(BuildContext context) {
    final menuItems = [
      {'icon': Icons.lightbulb_outline, 'label': 'Tips', 'page': null}, // Añadir la página correspondiente
      {'icon': Icons.scale, 'label': 'Peso', 'page': ResultadoPeso()},
      {'icon': Icons.description_outlined, 'label': 'Plan de entrenamiento...', 'page': null},
      {'icon': Icons.timer, 'label': 'Cronometro', 'page': Cronometro()},
      {'icon': Icons.restaurant_menu, 'label': 'Comidas', 'page': null},
      {'icon': Icons.calendar_today, 'label': 'Horarios', 'page': Calendario()},
      {'icon': Icons.settings, 'label': 'Configuraciones', 'page': ConfiguracionMenu()},
      {'icon': Icons.note, 'label': 'Notas', 'page': ListaNotasScreen()},
      {'icon': Icons.exit_to_app, 'label': 'Cerrar sesión', 'logout': true} // Logout item
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
        final item = menuItems[index];
        return _buildMenuItem(
          context,
          item['icon'] as IconData,
          item['label'] as String,
          item['page'] as Widget?,
          logout: item['logout'] as bool? ?? false,
        );
      },
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String label, Widget? page,
      {bool logout = false}) {
    return InkWell(
      onTap: () async {
        if (logout) {
          // Mostrar un cuadro de diálogo de confirmación antes de cerrar sesión
          final confirmLogout = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmar cierre de sesión'),
                content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop(false); // Cancelar
                    },
                  ),
                  TextButton(
                    child: const Text('Cerrar sesión'),
                    onPressed: () {
                      Navigator.of(context).pop(true); // Confirmar
                    },
                  ),
                ],
              );
            },
          );

          if (confirmLogout == true) {
            await _auth.logOut(context); // Llama al método de cerrar sesión
          }
        } else if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Column(
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
      ),
    );
  }
}
