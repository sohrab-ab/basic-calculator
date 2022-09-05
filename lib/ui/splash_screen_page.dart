// standard package
import 'package:flutter/material.dart';
import 'dart:async';
// User-defined package
import 'package:basic_calculator/ui/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));},);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "BasicCalculator",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10,),
                    CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.white24,
                    ),

                  ]
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: RichText(
                  text: const TextSpan(
                      text: "Developed by ",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15
                      ),
                      children: [
                        TextSpan(
                            text: "BoldTech",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            )
                        )
                      ]
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

