import 'package:flutter/material.dart';
import 'package:xo_game/game_btn.dart';
import 'package:xo_game/gamers_model.dart';

class Xo_Game extends StatefulWidget {
  static const String routeName = "XoScreen";

  @override
  State<Xo_Game> createState() => _Xo_GameState();
}

class _Xo_GameState extends State<Xo_Game> {
  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int score01 = 0;
  int score02 = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Gamer_Model;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Here We Go',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(args.gamer1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Text('$score01',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(args.gamer2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Text('$score02',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[0], onBtnClick, 0),
                GameBtn(board[1], onBtnClick, 1),
                GameBtn(board[2], onBtnClick, 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[3], onBtnClick, 3),
                GameBtn(board[4], onBtnClick, 4),
                GameBtn(board[5], onBtnClick, 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBtn(board[6], onBtnClick, 6),
                GameBtn(board[7], onBtnClick, 7),
                GameBtn(board[8], onBtnClick, 8),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  int counter = 1;

  resetBoard() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }

  onBtnClick(index) {
    if (board[index].isNotEmpty) return;
    if (counter.isOdd) {
      board[index] = 'X';
      bool win = checkWinner('X');
      if (win) {
        score01++;
        resetBoard();
      }
    } else {
      board[index] = 'O';
      bool win = checkWinner('O');
      if (win) {
        score02++;
        resetBoard();
      }
    }
    if (counter == 9) {
      resetBoard();
    }
    setState(() {
      counter++;
    });
  }

  bool checkWinner(String symbol) {
    //Row
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    //Column
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    //Diagonal
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }

    return false;
  }
}
