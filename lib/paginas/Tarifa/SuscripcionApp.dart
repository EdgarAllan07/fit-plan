import 'package:flutter/material.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';
void main() {
  runApp(SuscripcionApp());
}

class SuscripcionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Fondo blanco
        primaryColor: Color(0xFFFFA07A), // Color principal
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: SuscripcionScreen(),
    );
  }
}

class SuscripcionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () { Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Menu()));},
        ),
        title: Text(''),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Sin Anuncios + Beneficios Premium",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Texto negro
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sé el primero en acceder a nuevas características.",
                    style: TextStyle(
                      color: Colors.grey[700], // Gris para subtítulos
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Selecciona tu plan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            _buildPlanOption("Plan Único", "\$4.49/mes", true, context),
            Spacer(),
            _buildBenefits(),
            SizedBox(height: 24),
            _buildContinueButton(context),
            SizedBox(height: 16),
            Text(
              "Al continuar, aceptas nuestros términos de servicio y política de privacidad.",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanOption(
      String title, String price, bool isSelected, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Color(0xFFFFA07A) : Colors.grey,
        ),
        color: isSelected
            ? Color(0xFFFFA07A).withOpacity(0.1)
            : Colors.white, // Fondo con opacidad si está seleccionado
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          price,
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
        trailing: isSelected
            ? Icon(Icons.check, color: Color(0xFFFFA07A))
            : SizedBox.shrink(),
      ),
    );
  }

  Widget _buildBenefits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Incluido con Premium:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        _buildBenefitItem("Sin anuncios molestos"),
        _buildBenefitItem("Acceso anticipado a nuevas características"),
        _buildBenefitItem("Mejor experiencia de usuario"),
      ],
    );
  }

  Widget _buildBenefitItem(String benefit) {
    return Row(
      children: [
        Icon(Icons.check, color: Color(0xFFFFA07A), size: 20),
        SizedBox(width: 8),
        Text(
          benefit,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Acción para continuar
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFA07A),
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        "Continuar",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
