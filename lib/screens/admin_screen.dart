import 'package:flutter/material.dart';
import 'solicitudes_screen.dart'; // Importa la pantalla de solicitudes

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;

  static const List<String> _titles = <String>[
    'Inicio',
    'Reportes',
    'Solicitudes',
  ];

  static final List<Widget> _pages = <Widget>[
    Center(child: Text('Inicio', style: TextStyle(fontSize: 24))),
    ReportsTable(),
    SolicitudesScreen(), // Aquí se cambia el texto por la pantalla de solicitudes
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
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Color.fromARGB(255, 0, 202, 0), // Verde del SENA
        toolbarHeight: 80, // Aumenta la altura del AppBar
        elevation: 0, // Elimina la sombra debajo del AppBar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Reportes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Solicitudes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF008000), // Verde del SENA
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}

class ReportsTable extends StatelessWidget {
  const ReportsTable();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row of buttons
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0), // Ajusta el espaciado
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(Icons.person, 'Rol'),
              _buildActionButton(Icons.description, 'Documento'),
              _buildActionButton(Icons.access_time, 'Tiempo'),
              _buildActionButton(Icons.show_chart, 'Gráficas'),
            ],
          ),
        ),
        // Data Table
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 10, // Espacio reducido entre columnas
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xFF008000).withOpacity(0.1)), // Verde del SENA claro
              dataRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              headingTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 10), // Texto más pequeño en el encabezado
              dataTextStyle: TextStyle(fontSize: 10), // Texto más pequeño en los datos
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('ID'),
                ),
                DataColumn(
                  label: Text('Nombre'),
                ),
                DataColumn(
                  label: Text('Fecha'),
                ),
                DataColumn(
                  label: Text('Estado'),
                ),
                DataColumn(
                  label: Text('Acciones'),
                ),
              ],
              rows: <DataRow>[
                _buildDataRow('1', 'Juan Pérez', '2024-08-12', true),
                _buildDataRow('2', 'María Gómez', '2024-08-11', false),
                _buildDataRow('3', 'Carlos Ruiz', '2024-08-10', true),
                _buildDataRow('4', 'Ana López', '2024-08-09', false),
                _buildDataRow('5', 'Luis Martínez', '2024-08-08', true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        // Acción para cada botón
      },
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Fondo blanco
        foregroundColor: Colors.black, // Texto negro
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
          side: BorderSide(color: Color(0xFF008000), width: 2), // Borde verde del SENA
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  DataRow _buildDataRow(String id, String name, String date, bool isGood) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(id)),
        DataCell(Text(name)),
        DataCell(Text(date)),
        DataCell(
          Icon(
            isGood ? Icons.check_circle : Icons.cancel,
            color: isGood ? Colors.green : Colors.red,
            size: 16,
          ),
        ),
        DataCell(
          TextButton(
            onPressed: () {
              // Acción para ver detalles
            },
            child: Text('Ver detalles', style: TextStyle(color: Colors.blue)),
          ),
        ),
      ],
    );
  }
}
