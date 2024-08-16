import 'package:flutter/material.dart';
import 'Inicio/inicio_screen.dart';
import 'Reportes/reportes_screen.dart';

void main() {
  runApp(InstructorApp());
}

class InstructorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instructor',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 5, 223, 5), // Verde institucional SENA
      ),
      home: InstructorHome(),
    );
  }
}

class InstructorHome extends StatefulWidget {
  @override
  _InstructorHomeState createState() => _InstructorHomeState();
}

class _InstructorHomeState extends State<InstructorHome> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    InicioScreen(),
    ReportesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/screens/assets/media/Logo_Reconocimiento.png',
              height: 40,  // Ajusta el tamaño según sea necesario
            ),
            SizedBox(width: 8),  // Espacio entre la imagen y el texto
            Text('Instructor'),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 5, 223, 5), // Verde institucional SENA
        toolbarHeight: 80, // Ajusta la altura del AppBar
        elevation: 0, // Elimina la sombra del AppBar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Bordes redondeados en la parte inferior
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0), // Ajusta el padding según sea necesario
            child: Container(
              width: 48, // Ancho del círculo
              height: 48, // Alto del círculo
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Forma circular
                color: Colors.white, // Fondo blanco del círculo
                border: Border.all(
                  color: Colors.grey.shade300, // Color del borde del círculo
                  width: 2, // Ancho del borde del círculo
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.person, // Icono de usuario (puedes reemplazarlo por una imagen más adelante)
                  color: Colors.grey.shade600, // Color del icono
                ),
              ),
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0), // Ajusta la posición del navegador
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30), // Bordes redondeados en todos los lados
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, 5), // Sombra más visible para darle elevación
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade300, // Color del borde
              width: 1, // Ancho del borde
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), // Bordes redondeados en todos los lados
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.report),
                  label: 'Reportes',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF00A859), // Verde institucional SENA
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedFontSize: 14,
              unselectedFontSize: 12,
              showUnselectedLabels: true,
              elevation: 0, // Eliminamos la elevación predeterminada para aplicar nuestra sombra personalizada
            ),
          ),
        ),
      ),
    );
  }
}
