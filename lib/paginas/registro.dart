import 'package:fit_plan_proyecto/utils/autentificacion.dart';
import 'package:flutter/material.dart';
//import 'package:form_builder_validators/form_builder_validators.dart';
class Registro  extends StatelessWidget {
  //final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  //final Autentificacion _autentificacion = Autentificacion();
  Registro({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA07A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Registro', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
            child: Column(
            children: [
              const SizedBox(height: 20),
              //Caja de texto correo
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 16.0, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              //Caja de texto contraseña
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 16.0, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              //Caja de texto repetir contraseña
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Repite la contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:  const BorderSide(width: 16.0, color:  Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height:300),
              //Boton registrarse
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                ),
                onPressed: () async {
                 /* _formKey.currenState?.save();
                  if(_formKey.currenState?.validate()==true){

                    final v = _formKey.currenState?.value;
                    var result = await _autentificacion.crearCuenta(correo, contra)
                  }*/

                   
                },
                child: const Text('Registrarse', style: TextStyle(color: Color(0xFFFFA07A))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

