import 'package:flutter/material.dart';

class ColumnaEquipo extends StatelessWidget {

  // Datos que necesita este widget obligatoriamente para dibujarse
  final String nombreEquipo;
  final int puntos;
  final Color colorBoton;
  final Color colorCentro;
  final Color colorPie;
  final VoidCallback sumar;
  final VoidCallback restar;

  // Constructor
  const ColumnaEquipo({
    super.key,
    required this. nombreEquipo,
    required this.puntos,
    required this.colorBoton,
    required this.colorCentro,
    required this.colorPie,
    required this.sumar,
    required this.restar
  });

  // Método build (dibujo de la interfaz)
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            // 1. Botón +
            GestureDetector(
              onTap: sumar,
              child: Container(
                color: colorBoton,
                height: 70,
                width: double.infinity,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                color: colorCentro,
                width: double.infinity,
                child: Center(
                  child: Text(
                    '$puntos',
                    style: const TextStyle(
                      fontSize: 85,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: restar,
              child: Container(
                color: colorBoton,
                height: 70,
                width: double.infinity,
                child: const Center(
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 38
                  ),
                ),
              ),
            ),

            Container(
              color: colorPie,
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              child: Center(
                child: Text(
                  nombreEquipo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),

          ],      
        ),
      ),
    );
  }
}