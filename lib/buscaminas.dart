import 'package:flutter/material.dart';
import 'dart:math';
/*
  BuscaMinas - Examen Final
  Autor: Bryan Aaron Reyes Hernandez
  Fecha: 10/06/2024
  Descripción: Implementación de un juego de BuscaMinas con una sola mina en un tablero de 6x6.
  Nota: no pude redondear las esquinas de las celdas, pero el juego funciona correctamente.
*/


class BuscaMinas extends StatefulWidget {
  const BuscaMinas({super.key});
  @override
  State<BuscaMinas> createState() => _BuscaMinasState();
}

class Celda {
  bool tieneMina;
  bool descubierta;

  Celda({this.tieneMina = false, this.descubierta = false});
}

class _BuscaMinasState extends State<BuscaMinas> {
  static const int rows = 6;
  static const int cols = 6;
  late List<List<Celda>> board;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  void _initBoard() {
    // Crea una matris vacía sin minas
    board = List.generate(
      rows,
      (_) => List.generate(cols, (_) => Celda(tieneMina: false)),
    );

    // Coloca exactamente UNAA mina en una posición aleatoria
    final random = Random();
    final r = random.nextInt(rows);
    final c = random.nextInt(cols);
    board[r][c].tieneMina = true;

    gameOver = false;
  }

  void _reveal(int r, int c) {
    if (gameOver || board[r][c].descubierta) return;
    setState(() {
      board[r][c].descubierta = true;
      if (board[r][c].tieneMina) {
        gameOver = true;
      }
    });
  }

  Color _cellColor(Celda cell) {
    if (!cell.descubierta) return Colors.grey;
    return cell.tieneMina ? Colors.red : Colors.green;
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuscaMinas - Bryan Aaron Reyes Hernandez'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Filas del tablero
                for (int r = 0; r < rows; r++)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int c = 0; c < cols; c++)
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _reveal(r, c),
                              child: Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: _cellColor(board[r][c]),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(_initBoard),
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}