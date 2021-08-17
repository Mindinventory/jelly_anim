library jelly_anim;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jelly_anim/src/utils/common.dart';
import 'package:jelly_anim/src/utils/jelly_configurations.dart';
import 'package:jelly_anim/src/utils/my_jelly_paint.dart';

class JellyAnim extends StatefulWidget {
  /// [jellyCount] defines that how many jelly we want to overlap.
  final int jellyCount;

  /// [duration] defines the color transition & movement duration of jelly.
  final Duration duration;

  /// [jellyCoordinates] defines the movement of jelly.
  /// NOTE: default value is 5 & user have to give more than 3.
  final int jellyCoordinates;

  /// [radius] defines the size of jelly.
  final double radius;

  /// inside the [viewPortSize] defined size the jelly will draw.
  /// NOTE: by default the size of viewport is same as screen size.
  final Size? viewPortSize;

  /// [colors] list of colors for transition if user will not give any color then it'll take random color.
  final List<Color> colors;

  /// This enum is responsible to manage the position of jelly in viewport
  /// NOTE: default position of jelly is center.
  final JellyPosition jellyPosition;

  /// [fillPaint] to give custom paint values like stroke, strokeWidth, style, etc.
  final Paint? fillPaint;

  /// [allowOverFlow] flag will give us a provision to render animation outside the viewport.
  final bool allowOverFlow;

  JellyAnim({
    required this.radius,
    this.allowOverFlow = false,
    this.duration = const Duration(seconds: 5),
    this.colors = const [],
    this.viewPortSize,
    this.jellyCoordinates = 5,
    this.jellyPosition = JellyPosition.center,
    this.jellyCount = 1,
    this.fillPaint,
  }) {
    assert(radius > 2);
  }

  @override
  State<StatefulWidget> createState() {
    return _JellyAnim();
  }
}

class _JellyAnim extends State<JellyAnim> with TickerProviderStateMixin {
  late List<JellyConfiguration> jellyConfigurations;
  late Size size;
  late AnimationController _controller;
  JellyPosition position = JellyPosition.center;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller.repeat();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _controller.repeat();
      }
    });
  }

  /// This method will draw the jelly & overlap the jelly based on value of [jellyCount].
  List<JellyConfiguration> createJellies(
      BuildContext context, int jellyCount, Size size) {
    List<JellyConfiguration> jellyConfigurations = [];
    for (int i = 0; i < jellyCount; i++) {
      jellyConfigurations.add(
        JellyConfiguration(
          size,
          jellyPosition: i,
          reductionRadiusFactor: 1.5 - ((i + 1) / 20),
          fillPaint: widget.fillPaint,
          jellyCoordinates: widget.jellyCoordinates,
          jellyPositionEnum: position,
          radius: widget.radius,
          colorList: widget.colors,
        ),
      );
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
    size = widget.viewPortSize ??
        Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        );

    jellyConfigurations = createJellies(
      context,
      widget.jellyCount,
      getJellySize(
        widget.jellyPosition,
      ),
    );
    return SafeArea(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            size: size,
            painter: JellyPaint(
              allowOverFlow: widget.allowOverFlow,
              animation: _controller,
              jellyConfigurations: jellyConfigurations,
            ),
          );
        },
      ),
    );
  }

  /// This method will draw the jelly on the desired position on viewport
  /// There is 1 Enum [JellyPosition] which contains all the positions & based
  /// on that position we are calculating the size of jelly to that position.
  Size getJellySize(JellyPosition position) {
    switch (position) {
      case JellyPosition.bottomLeft:
        return Size(
          (size.width / widget.radius) + widget.radius * 2,
          size.height * 2 - (widget.radius * 2),
        );
      case JellyPosition.bottomCenter:
        return Size(
          size.width,
          size.height * 2 - (widget.radius * 2),
        );
      case JellyPosition.bottomRight:
        return Size(
          size.width * 2 - (widget.radius * 2) - widget.radius,
          size.height * 1.9 - widget.radius,
        );
      case JellyPosition.topRight:
        return Size(
          size.width * 2 - (widget.radius * 2) - widget.radius,
          80,
        );
      case JellyPosition.topCenter:
        return Size(
          size.width,
          size.height / 2 - (widget.radius / 2),
        );
      case JellyPosition.topLeft:
        return Size(
          size.width / 5,
          size.height / 2 - (widget.radius * 2),
        );
      case JellyPosition.centerLeft:
        return Size(
          (size.width / widget.radius) + widget.radius * 2,
          size.height,
        );
      case JellyPosition.centerRight:
        return Size(
          size.width * 2 - (widget.radius * 2) - widget.radius,
          size.height,
        );
      default:
        return Size(
          size.width,
          size.height,
        );
    }
  }
}

/// This enum defines the position of jelly.
enum JellyPosition {
  centerLeft,
  centerRight,
  center,
  topLeft,
  topCenter,
  topRight,
  bottomRight,
  bottomLeft,
  bottomCenter
}
