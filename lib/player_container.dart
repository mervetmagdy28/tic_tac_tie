import 'package:flutter/material.dart';

import 'constants.dart';

class PlayerContainer extends StatelessWidget {
  const PlayerContainer({super.key, required this.playerController, required this.textPlayer});
  final TextEditingController playerController;
  final String textPlayer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textPlayer, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, color: blueColor),),
        const SizedBox(height: 5,),
        TextFormField(
          controller: playerController,
          decoration: InputDecoration(
            hintText: textPlayer=="Enter Player1 Name"?'Player X':'Player O',
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: blueColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: blueColor)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: redColor)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: redColor)),
          ),
          validator: (value){
            if (value==null|| value.isEmpty){
              return textPlayer=="Enter Player1 Name"?"please enter Player1 Name":"please enter Player2 Name";
            }
            return null;

          },
        ),

      ],
    );
  }
}
