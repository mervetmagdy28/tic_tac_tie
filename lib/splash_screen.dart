import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/constants.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context){
            return const Home();
          }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/animation_lm0itrad.json',height: 250),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Tic ",style: TextStyle(color: blueColor,fontSize: 30,fontWeight: FontWeight.bold),),
             Text("Tac ",style: TextStyle(color: redColor,fontSize: 30,fontWeight: FontWeight.bold),),
             const Text("Toe",style: TextStyle(color: Colors.black,fontSize: 30, fontWeight: FontWeight.bold),),
           ],
         )
           ],
      ),
    );
  }
}
