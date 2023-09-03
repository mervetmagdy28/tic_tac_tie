import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/player_container.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController player1Controller=TextEditingController();
  final TextEditingController player2Controller=TextEditingController();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/noughts-and-crosses (1).png')),
              const SizedBox(height: 20,),
              PlayerContainer(playerController: player1Controller,textPlayer: "Enter Player1 Name",),
              const SizedBox(height: 20,),
              PlayerContainer(playerController: player2Controller,textPlayer: "Enter Player2 Name",),
              const SizedBox(height: 30,),
              Center(
                child: TextButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>GameScreen(player1: player1Controller.text, player2: player2Controller.text)));
                      }
                    },
                    child: Container(
                      height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(12)

                  ),
                      child: const Center(child: Text('Start Game', style: TextStyle(color: Colors.white),)),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
