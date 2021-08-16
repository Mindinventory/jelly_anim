import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jelly_anim/jelly_anim.dart';
import 'package:test_package/doll_ui/doll_screen.dart';

import 'utils/raised_gradient_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  int jellyCount = 1;
  Size size = Size(200, 200);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
     Future.delayed(Duration(seconds: 1),(){
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => DollScreen()),
       );
     });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: JellyAnim(
                  jellyCount: jellyCount,
                  radius: 20,
                  viewPortSize: Size(200, 600),
                  jellyCoordinates: 10,
                  allowOverFlow: true,
                  duration: Duration(milliseconds: 200),
                  jellyPosition: JellyPosition.bottomCenter,
                ),
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 120,
                viewPortSize: Size(700, 400),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.centerLeft,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 70,
                viewPortSize: Size(800, 700),
                jellyCoordinates: 19,
                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomLeft,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 120,
                viewPortSize: Size(800, 400),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomRight,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 50,
                viewPortSize: Size(200, 100),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomLeft,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 200,
                viewPortSize: Size(400, 700),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomCenter,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 800,
                viewPortSize: Size(300, 700),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomRight,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 400,
                viewPortSize: Size(400, 500),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.centerLeft,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 350,

                viewPortSize: Size(400, 400),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.topRight,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 450,

                viewPortSize: Size(300, 800),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomCenter,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 100,

                viewPortSize: Size(350, 800),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomLeft,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 168,
                viewPortSize: Size(300, 300),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.centerLeft,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 200,
                viewPortSize: Size(30, 700),
                jellyCoordinates: 10,
                allowOverFlow: true,
                jellyPosition: JellyPosition.centerRight,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 164,
                viewPortSize: Size(700, 800),
                jellyCoordinates: 10,

                allowOverFlow: true,
                jellyPosition: JellyPosition.bottomCenter,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 176,
                viewPortSize: Size(300, 760),
                jellyCoordinates: 10,
                allowOverFlow: true,

                jellyPosition: JellyPosition.center,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: JellyAnim(
                  jellyCount: jellyCount,
                  radius: 134,
                  viewPortSize: Size(300, 800),
                  jellyCoordinates: 10,
                  allowOverFlow: true,

                  jellyPosition: JellyPosition.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: JellyAnim(
                  jellyCount: jellyCount,
                  radius: 50,
                  viewPortSize: Size(800, 600),
                  jellyCoordinates: 16,
                  allowOverFlow: true,

                  jellyPosition: JellyPosition.bottomCenter,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: JellyAnim(
                  jellyCount: jellyCount,
                  radius: 90,
                  viewPortSize: Size(500, 800),
                  jellyCoordinates: 26,
                  allowOverFlow: true,

                  jellyPosition: JellyPosition.topRight,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: JellyAnim(
                  jellyCount: jellyCount,
                  radius: 20,
                  viewPortSize: Size(350, 870),
                  jellyCoordinates: 26,

                  allowOverFlow: true,
                  jellyPosition: JellyPosition.bottomLeft,
                ),
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 190,
                viewPortSize: Size(250, 800),
                jellyCoordinates: 7,
                allowOverFlow: true,

                jellyPosition: JellyPosition.bottomCenter,
              ),
              JellyAnim(
                jellyCount: jellyCount,
                radius: 40,
                viewPortSize: size,
                jellyCoordinates: 16,
                allowOverFlow: true,

                jellyPosition: JellyPosition.topLeft,
              ),
              Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.6,
                  child: JellyAnim(
                    jellyCount: jellyCount,
                    radius: 150,
                    viewPortSize: size,

                    jellyCoordinates: 16,
                    allowOverFlow: true,
                    jellyPosition: JellyPosition.center,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "JELLY",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.varelaRound(
                        letterSpacing: 20,
                        color: Colors.white70.withOpacity(0.5),
                        fontSize: 60,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     body: Container(
    //       child: Column(
    //         children: <Widget>[
    //           JellyAnim(
    //             jellyCount:jellyCount,
    //             size: 1,
    //             colors: [Colors.cyanAccent,Colors.pink,Colors.deepOrangeAccent],
    //           ),
    //           // Padding(
    //           //   padding: const EdgeInsets.only(left: 48, right: 48),
    //           //   child: RaisedGradientButton(
    //           //     child: Text(
    //           //       "Increase layer",
    //           //       style: TextStyle(color: Colors.white, fontSize: 16),
    //           //     ),
    //           //     colors: [
    //           //       Color.fromARGB(255, 172, 131, 241),
    //           //       Color.fromARGB(255, 241, 244, 247)
    //           //     ],
    //           //     onPressed: () => increaseJelly(),
    //           //   ),
    //           // ),
    //           // Padding(
    //           //   padding: const EdgeInsets.only(top: 8, left: 48, right: 48),
    //           //   child: RaisedGradientButton(
    //           //     child: Text(
    //           //       "Decrease layer",
    //           //       style: TextStyle(color: Colors.white, fontSize: 16),
    //           //     ),
    //           //     colors: [
    //           //       Color.fromARGB(255, 240, 69, 7),
    //           //       Color.fromARGB(255, 255, 164, 43)
    //           //     ],
    //           //     onPressed: () => decreaseJelly(),
    //           //   ),
    //           // ),
    //         ],
    //       ),
    //     ),
    //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   ),
    // );
  }

  // Here i am playing around in jelly on text change of email
  increaseJelly() {
    setState(() {
      jellyCount = jellyCount + 1;
    });
  }

  decreaseJelly() {
    setState(() {
      if (jellyCount > 1) {
        jellyCount = jellyCount - 1;
      }
    });
  }
}
