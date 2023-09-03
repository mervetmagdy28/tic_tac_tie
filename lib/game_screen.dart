import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.player1, required this.player2});
  final String player1;
  final String player2;
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late List<List<String>> board;
  late String currentPlayer;
  late String winner;
  late bool gameOver;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    board=List.generate(3, (index) => List.generate(3,(index)=>''));
    currentPlayer='X';
    winner='';
    gameOver=false;
  }
  void resetGame(){
    setState(() {
      board=List.generate(3, (index) => List.generate(3,(index)=>''));
      currentPlayer='X';
      winner='';
      gameOver=false;
    });
  }

  void makeMove(int row, int col){
    if (board[row][col]!=''||gameOver){
      return;
    }
    setState(() {
      board[row][col]=currentPlayer;


      //check for winner
      if (board[row][0] == currentPlayer && board[row][1] == currentPlayer && board[row][2] == currentPlayer ){
        winner=currentPlayer;
        gameOver=true;
      }else if (board[0][col] == currentPlayer && board[1][col] == currentPlayer && board[2][col] == currentPlayer ) {
        winner=currentPlayer;
        gameOver=true;
      }else if (board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer ) {
        winner=currentPlayer;
        gameOver=true;
      }else if (board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer ) {
        winner=currentPlayer;
        gameOver=true;
      }
      //switch players
      currentPlayer=currentPlayer=='X'?'O':'X';

      // if it's tie
      /*
      - - -
      - x -
      - - -
       */
      if (!board.any((row) => row.any((cel) => cel==""))){
        gameOver=true;
        winner="It's a Tie";
      }

      if (winner!=""){
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.leftSlide,
          btnOkText: "Play again",
          title:winner=="X"?"${widget.player1} Won!":winner=="O"?"${widget.player2} Won!":"It's a Tie",
          btnOkOnPress: (){
            resetGame();
          }
        ).show();
      }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Turn: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text(currentPlayer=='X'?"${widget.player1} ($currentPlayer)":"${widget.player2} ($currentPlayer)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: currentPlayer=="X"?redColor:blueColor),),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                  ),
                  itemBuilder: (context, index){
                  int row =index ~/3;
                  int col=index % 3;
                  return GestureDetector(
                    onTap:(){
                      makeMove(row, col);
                  },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.07),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text(board[row][col],style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color :board[row][col]=='X'?redColor:blueColor
                        ),),
                      )
                      ,
                    ),
                  );
                  }),
            ),
            Center(
              child: TextButton(
                  onPressed: resetGame,
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(12)

                    ),
                    child: const Center(child: Text('Reset Game', style: TextStyle(color: Colors.white),)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
