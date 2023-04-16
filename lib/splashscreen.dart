import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash_screen/sample.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          TweenAnimationBuilder(
            child: Center(
              child: Text(
                'Camp Yellow',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  height: 39/32,
                  color: Color(0xFF000000),
                ),
              ),
            ),


            tween: Tween<double>(begin: 240, end: MediaQuery.of(context).size.width),

            duration: Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            builder: (context,double value, child) {
              return Center(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE600),
                    borderRadius: BorderRadius.circular(240-value/2),
                  ),
                  width: value,
                  height: value,
                  //margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/4, top: MediaQuery.of(context).size.height/4),
                  child: child,
                ),
              );
            },
          ),

    ],
      ),
    );
  }
}
