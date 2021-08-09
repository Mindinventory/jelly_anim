library jelly_anim;

import 'package:flutter/cupertino.dart';
import 'package:jelly_anim/src/utils/jelly_configurations.dart';
import 'package:jelly_anim/src/utils/my_jelly_paint.dart';

class JellyAnim extends StatefulWidget {
  final int jellyCount;
  final Duration duration;
  final Size size;

  JellyAnim(this.jellyCount, {this.size = const Size(400, 400), this.duration = const Duration(seconds: 5)});

  @override
  State<StatefulWidget> createState() {
    return _JellyAnim();
  }
}

class _JellyAnim extends State<JellyAnim> with TickerProviderStateMixin {
  List<JellyConfiguration> jellyConfigurations;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _controller.repeat();
      }
    });
  }

  List<JellyConfiguration> createJellies(
      BuildContext context, int jellyCount, Size size) {
    List<JellyConfiguration> jellyConfigurations = List();
    for (int i = 0; i < jellyCount; i++) {
      jellyConfigurations.add(JellyConfiguration(size,
          position: i, reductionRadiusFactor: 1.5 - ((i + 1) / jellyCount)));
    }
    return jellyConfigurations;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    jellyConfigurations =
        createJellies(context, widget.jellyCount, widget.size);
    return new AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return CustomPaint(
              size: widget.size,
              painter: JellyPaint(
                animation: _controller,
                jellyConfigurations: jellyConfigurations,
              ));
        });
  }
}
