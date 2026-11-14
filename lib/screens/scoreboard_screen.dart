import 'package:flutter/material.dart';
import 'package:marcador_deportivo/themes/app_theme.dart';
import 'package:marcador_deportivo/widgets/equipo.dart';

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int puntosLOCAL = 0;
  int puntosVISITA = 0;

  // Funciones para equipo LOCAL
  void sumarLOCAL() {
    setState(() {
      puntosLOCAL++;
    });
  }
  void restarLOCAL() {
    setState(() {
      if(puntosLOCAL > 0) {
        puntosLOCAL--;
      }
    });
  }

  // Funciones para equipo VISITANTE
  void sumarVISITA() {
    setState(() {
      puntosVISITA++;
    });
  }
  void restarVISITA() {
    setState(() {
      if (puntosVISITA > 0) {
        puntosVISITA--;
      }
    });
  }

  // Función para reiniciar el marcador
  void resetMarcador() {
    setState(() {
      puntosLOCAL = 0;
      puntosVISITA = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoPrincipal,
      body: SafeArea(
        // SafeArea evita que el contenido choque con la cámara frontal o la barra de batería
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Margen alrededor de toda la pantalla
          child: Column(
            children: [

              // 1. ZONA DE CABECERA: Balón + Nombre de la App
              Row(
                children: [
                  const Icon(
                    Icons.sports_basketball_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'MARCADOR',
                    style: AppTextStyle.textos.copyWith(
                      fontSize: 18,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16), // Separación vertical

              // 2. ZONA DE RESUMEN SUPERIOR: Marcador pequeño sincronizado
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.tarjetaSuperior, // Fondo gris oscuro
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08), // Borde fino sutil
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Indicador Local: Círculo azul + Texto
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.azulBoton,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'LOCAL',
                          style: AppTextStyle.local.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),

                    // Pastilla Central: Puntos Local vs Puntos Visita
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.pastillaVs,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          // Número Local (sincronizado)
                          Text(
                            '$puntosLOCAL',
                            style: TextStyle(
                              color: AppColors.azulBoton,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Texto "VS" en blanco
                          const Text(
                            'VS',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Número Visita (sincronizado)
                          Text(
                            '$puntosVISITA',
                            style: TextStyle(
                              color: AppColors.rojoBoton,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Indicador Visita: Texto + Círculo rojo
                    Row(
                      children: [
                        Text(
                          'VISITA',
                          style: AppTextStyle.visita.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.rojoBoton,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16), // Separación vertical

              // 3. ZONA CENTRAL: Los dos equipos con ColumnaEquipo
              // Expanded permite que los equipos absorban todo el alto disponible
              Expanded(
                child: Row(
                  children: [
                    // Columna del Equipo Local (Azul)
                    ColumnaEquipo(
                      nombreEquipo: "EQUIPO LOCAL",
                      puntos: puntosLOCAL,
                      colorBoton: AppColors.azulBoton,
                      colorCentro: AppColors.azulCentro,
                      colorPie: AppColors.azulPie,
                      sumar: sumarLOCAL,
                      restar: restarLOCAL,
                    ),

                    const SizedBox(width: 16), // Espacio entre los dos equipos

                    // Columna del Equipo Visitante (Rojo)
                    ColumnaEquipo(
                      nombreEquipo: "EQUIPO VISITA",
                      puntos: puntosVISITA,
                      colorBoton: AppColors.rojoBoton,
                      colorCentro: AppColors.rojoCentro,
                      colorPie: AppColors.rojoPie,
                      sumar: sumarVISITA,
                      restar: restarVISITA,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16), // Separación vertical

              // 4. ZONA INFERIOR: Botón RESET
              OutlinedButton.icon(
                onPressed: resetMarcador, // Al pulsar, llama a resetear()
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  'RESET',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  side: const BorderSide(color: Colors.white30, width: 1.2), // Borde suave
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), // Forma de cápsula/píldora
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}