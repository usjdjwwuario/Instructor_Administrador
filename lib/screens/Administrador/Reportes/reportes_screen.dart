import 'package:flutter/material.dart';
import 'ApiAdmin/api_service.dart';

class ReportesScreen extends StatefulWidget {
  @override
  _ReportesScreenState createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  final ApiService apiService = ApiService();
  List<dynamic> usuarios = [];
  String ficha = '';
  String documento = '';
  String tiempo = '';

  @override
  void initState() {
    super.initState();
    // Inicialmente, la tabla estará vacía hasta que se busquen datos
  }

  Future<void> _fetchUsuarios() async {
    try {
      final data = await apiService.fetchUsuarios(ficha, documento, tiempo);
      setState(() {
        usuarios = data;
      });
    } catch (e) {
      // Manejo de errores
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Reportes Admin'),
      //   backgroundColor: Colors.green[800],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Inputs para filtrar datos en la tabla con estilos mejorados
            Row(
              children: [
                Expanded(
                  child: _buildFilterInput('Fichas', (value) {
                    setState(() {
                      ficha = value;
                    });
                    _fetchUsuarios();
                  }),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildFilterInput('Documentos', (value) {
                    setState(() {
                      documento = value;
                    });
                    _fetchUsuarios();
                  }),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildFilterInput('Tiempo', (value) {
                    setState(() {
                      tiempo = value;
                    });
                    _fetchUsuarios();
                  }),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Tabla de reportes
            Expanded(
              child: usuarios.isEmpty
                  ? Center(child: Text('No hay datos disponibles', style: TextStyle(fontSize: 16, color: Colors.grey[600])))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.green[700]!),
                        dataRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'ID',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Nombre',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Fecha',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Estado',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Documentos',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                        rows: usuarios.where((usuario) {
                          return usuario['numero_documento_usuario']
                              .toString()
                              .startsWith(documento);
                        }).map<DataRow>((usuario) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                usuario['id'].toString(),
                                style: TextStyle(color: Colors.green[800]),
                              )),
                              DataCell(Text(
                                usuario['first_name'] ?? '',
                                style: TextStyle(color: Colors.green[800]),
                              )),
                              DataCell(Text(
                                usuario['date_joined'] ?? '',
                                style: TextStyle(color: Colors.green[800]),
                              )),
                              DataCell(Text(
                                (usuario['is_staff'] && usuario['is_active'])
                                    ? 'Activo'
                                    : 'Inactivo',
                                style: TextStyle(
                                    color: usuario['is_staff'] &&
                                            usuario['is_active']
                                        ? Colors.green[800]
                                        : Colors.red[800]),
                              )),
                              DataCell(Text(
                                usuario['numero_documento_usuario'] ?? '',
                                style: TextStyle(color: Colors.green[800]),
                              )),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterInput(String label, Function(String) onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.green, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
      ),
      cursorColor: Colors.green,
    );
  }
}
