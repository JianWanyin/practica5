import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../game_state.dart';

class TicTacToeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego del Gato'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBoard(context),
          const SizedBox(height: 20),
          if (gameState.winner != null)
            Text(
              gameState.winner == 'Empate'
                  ? '¡Es un empate!'
                  : '¡${gameState.winner} ha ganado!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: gameState.resetGame,
            child: const Text('Reiniciar Juego'),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => gameState.playMove(index),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                gameState.board[index],
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
        );
      },
      itemCount: 9,
      shrinkWrap: true,
    );
  }
}
