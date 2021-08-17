import 'package:flutter/material.dart';
import 'package:jelly_anim/jelly_anim.dart';

class DollScreen extends StatefulWidget {
  const DollScreen({Key key}) : super(key: key);

  @override
  _DollScreenState createState() => _DollScreenState();
}

class _DollScreenState extends State<DollScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: JellyAnim(
                jellyCount: 2,
                radius: 200,
                colors: [Colors.yellow],
              )),
          Align(
              alignment: Alignment.center,
              child: Image.asset("asset/doll.png")),
        ],
      ),
    ));
  }
}
