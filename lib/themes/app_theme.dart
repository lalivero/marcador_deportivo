import 'package:flutter/material.dart';

class AppColors {

  // Colores generales
  static final Color fondoPrincipal = Color(0xFF141619);
  static final Color tarjetaSuperior = Color(0xFF22262B);
  static final Color pastillaVs = Color(0xFF141619);

  // Colores para el equipo LOCAL (azul)
  static final Color azulBoton = Color(0xFF3B82F6);
  static final Color azulCentro = Color(0xFF2554A5);
  static final Color azulPie = Color(0xFF1E3A8A);

  // Colores del equipo VISITA
  static final Color rojoBoton = Color(0xFFEF4444);
  static final Color rojoCentro = Color(0xFF991B1B);
  static final Color rojoPie = Color(0xFF7F1D1D);

  // Textos
  static final Color textoBlanco = Colors.white;
}

class AppTextStyle {
  static final TextStyle textos = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.textoBlanco,
    fontSize: 24
  );

  static final TextStyle numeroCentro = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.textoBlanco,
    fontSize: 80
  );

  static final TextStyle local = TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.azulCentro,
    fontSize: 12
  );

   static final TextStyle visita = TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.rojoCentro,
    fontSize: 12
  );
}