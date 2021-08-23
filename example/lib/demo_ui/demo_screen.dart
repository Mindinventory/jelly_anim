import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jelly_anim/jelly_anim.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key key}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  int jellyCount = 1;
  Size size = Size(200, 200);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
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
