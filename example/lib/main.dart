import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jelly_anim/jelly_anim.dart';
import 'demo_ui/demo_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      body: Column(children: [
        SizedBox(
          height: 500,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: JellyAnim(
                    jellyCount: 1,
                    radius: 160,
                    allowOverFlow: true,
                    duration: Duration(milliseconds: 10),
                    colors: [Color.fromRGBO(255, 237, 59, 1)],
                    jellyCoordinates: 5,
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "asset/lady.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: JellyAnim(
                  radius: 100,
                  colors: [Color.fromRGBO(255, 237, 59, 1)],
                  allowOverFlow: true,
                  viewPortSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                  jellyPosition: JellyPosition.bottomCenter,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 62, left: 62, top: 36),
          child: Text(
            "Feel less stressed & more mindful with meditation",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DemoScreen()),
            );
          },
          child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                "Let’s Go",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color.fromRGBO(16, 16, 16, 1),
                ),
              )),
        )
      ]),
    ));
  }
}
