import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jelly_anim/src/model/border_point.dart';

import 'jelly_configurations.dart';

/// This class is responsible to render the jelly into the screen according to it's configuration [JellyConfiguration].
class JellyPaint extends CustomPainter {
  bool allowOverFlow = false;

  JellyPaint(
      {required this.animation,
      required this.jellyConfigurations,
      required this.allowOverFlow})
      : super(repaint: animation);

  /// Animation representing what we are painting
  final Animation<double> animation;
  List<JellyConfiguration> jellyConfigurations = [];

  Offset getOffset(BorderPoint borderPoint) {
    return Offset(borderPoint.dx, borderPoint.dy);
  }

  /// This method will paint the jelly.
  void paintJelly(Canvas canvas, Size size) {
    if (jellyConfigurations == null || jellyConfigurations.isEmpty) {
      return;
    }

    for (int j = 0; j < jellyConfigurations.length; j++) {
      JellyConfiguration configuration = jellyConfigurations[j];
      configuration.updateJellyPathPoints(animation.value, j);

      // center of our widget
      // if (configuration.keepNodes) {
      //   // center point of view.
      //   canvas.drawCircle(configuration.centerPointOfJelly,
      //       configuration.nodeRadius, configuration.nodePaint);
      //
      //   // node points of view.
      //   for (int i = 0; i < configuration.borderPoints.length; i++) {
      //     canvas.drawCircle(getOffset(configuration.borderPoints[i]),
      //         configuration.nodeRadius, configuration.nodePaint);
      //   }
      // }
      // and same path, we are creating using Bazier curve.
      canvas.drawPath(configuration.jellyPath, configuration.fillPaint!);
    }
    canvas.save();
    canvas.restore();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!allowOverFlow) {
      var dummyRect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
      canvas.clipRect(dummyRect, clipOp: ClipOp.intersect);
    }
    paintJelly(canvas, size);
  }

  @override
  bool shouldRepaint(JellyPaint other) {
    return animation.value != other.animation.value;
  }
}
