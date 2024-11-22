import 'package:flutter/material.dart';

class GameState extends ChangeNotifier {
  List<String> _board = List.generate(9, (index) => '');
  String _currentPlayer = 'X';
  String? _winner;

  List<String> get board => _board;
  String get currentPlayer => _currentPlayer;
  String? get winner => _winner;

  void playMove(int index) {
    if (_board[index].isEmpty && _winner == null) {
      _board[index] = _currentPlayer;
      if (_checkWinner(_currentPlayer)) {
        _winner = _currentPlayer;
      } else if (_board.every((element) => element.isNotEmpty)) {
        _winner = 'Empate';
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
      notifyListeners();
    }
  }

  bool _checkWinner(String player) {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    return winPatterns.any((pattern) =>
        pattern.every((index) => _board[index] == player));
  }

  void resetGame() {
    _board = List.generate(9, (index) => '');
    _currentPlayer = 'X';
    _winner = null;
    notifyListeners();
  }
}
