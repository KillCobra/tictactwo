import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 0; j < 3; j++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (game.makeMove(i, j)) {
                          String winner = game.checkWinner();
                          if (winner != '') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Game Over'),
                                content: Text('$winner wins!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        game.reset();
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Play Again'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          game.board[i][j],
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
