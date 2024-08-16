import 'package:flutter/material.dart';

class SolicitudesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildDataBlock('Solicitud 1', 'Detalles de la solicitud 1', '2024-08-12')),
                  SizedBox(width: 16), // Espaciado entre los bloques
                  Expanded(child: _buildDataBlock('Solicitud 2', 'Detalles de la solicitud 2', '2024-08-11')),
                ],
              ),
              SizedBox(height: 16), // Espaciado entre filas
              Row(
                children: [
                  Expanded(child: _buildDataBlock('Solicitud 3', 'Detalles de la solicitud 3', '2024-08-10')),
                  SizedBox(width: 16), // Espaciado entre los bloques
                  Expanded(child: _buildDataBlock('Solicitud 4', 'Detalles de la solicitud 4', '2024-08-09')),
                ],
              ),
              SizedBox(height: 16), // Espaciado entre filas
              Row(
                children: [
                  Expanded(child: _buildDataBlock('Solicitud 5', 'Detalles de la solicitud 5', '2024-08-08')),
                  SizedBox(width: 16), // Espaciado entre los bloques
                  Expanded(child: _buildDataBlock('Solicitud 6', 'Detalles de la solicitud 6', '2024-08-07')),
                ],
              ),
              SizedBox(height: 16), // Espaciado entre filas
              Row(
                children: [
                  Expanded(child: _buildDataBlock('Solicitud 7', 'Detalles de la solicitud 7', '2024-08-06')),
                  SizedBox(width: 16), // Espaciado entre los bloques
                  Expanded(child: _buildDataBlock('Solicitud 8', 'Detalles de la solicitud 8', '2024-08-05')),
                ],
              ),
              // Agrega más filas aquí según sea necesario
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataBlock(String title, String details, String date) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // Cambia la posición de la sombra
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            details,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Fecha: $date',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
