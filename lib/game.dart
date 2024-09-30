class Game {
  List<List<String>> board = List.generate(3, (_) => List.generate(3, (_) => ''));
  String currentPlayer = '❌';

  Game() {
    reset();
  }

  void reset() {
    board = List.generate(3, (_) => List.generate(3, (_) => ''));
    currentPlayer = '❌';
  }

  bool makeMove(int row, int col) {
    if (board[row][col] == '') {
      board[row][col] = currentPlayer;
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      return true;
    }
    return false;
  }

  String checkWinner() {
    // Check rows, columns, and diagonals for a winner
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != '' && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
        return board[i][0];
      }
      if (board[0][i] != '' && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        return board[0][i];
      }
    }
    if (board[0][0] != '' && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
      return board[0][0];
    }
    if (board[0][2] != '' && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
      return board[0][2];
    }
    return '';
  }
}