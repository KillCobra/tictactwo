class Game {
  List<List<Map<String, dynamic>>> board = List.generate(3, (_) => List.generate(3, (_) => {'mark': '', 'age': 0}));
  String currentPlayer = '❌';

  Game() {
    reset();
  }

  void reset() {
    board = List.generate(3, (_) => List.generate(3, (_) => {'mark': '', 'age': 0}));
    currentPlayer = '❌';
  }

  bool makeMove(int row, int col) {
    if (board[row][col]['mark'] == '') {
      board[row][col] = {'mark': currentPlayer, 'age': 0};
      currentPlayer = currentPlayer == '❌' ? '⭕' : '❌';
      ageMarks();
      return true;
    }
    return false;
  }

  void ageMarks() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j]['mark'] != '') {
          board[i][j]['age'] += 1;
          if (board[i][j]['age'] >= 3) {
            board[i][j] = {'mark': '', 'age': 0};
          }
        }
      }
    }
  }

  String checkWinner() {
    // Check rows, columns, and diagonals for a winner
    for (int i = 0; i < 3; i++) {
      if (board[i][0]['mark'] != '' && board[i][0]['mark'] == board[i][1]['mark'] && board[i][1]['mark'] == board[i][2]['mark']) {
        return board[i][0]['mark'];
      }
      if (board[0][i]['mark'] != '' && board[0][i]['mark'] == board[1][i]['mark'] && board[1][i]['mark'] == board[2][i]['mark']) {
        return board[0][i]['mark'];
      }
    }
    if (board[0][0]['mark'] != '' && board[0][0]['mark'] == board[1][1]['mark'] && board[1][1]['mark'] == board[2][2]['mark']) {
      return board[0][0]['mark'];
    }
    if (board[0][2]['mark'] != '' && board[0][2]['mark'] == board[1][1]['mark'] && board[1][1]['mark'] == board[2][0]['mark']) {
      return board[0][2]['mark'];
    }
    // Check for a draw
    if (board.every((row) => row.every((cell) => cell['mark'] != ''))) {
      return 'draw';
    }
    return '';
  }
}