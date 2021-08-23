import 'dart:math';
import 'dart:ui';

import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:jelly_anim/jelly_anim.dart';
import 'package:jelly_anim/src/model/border_point.dart';
import 'package:jelly_anim/src/utils/common.dart';

class JellyConfiguration {
  int jellyCoordinates = 5;
  double _radiusFactor = 4;
  double
      reductionRadiusFactor; // this param is useful when we want to create multiple jellies on top of each other and to visualise it properly, we need less radius for upper jellies comparatively smaller than the below ones.

  Paint? fillPaint;
  List<Color> colorList;
  int _colorListIndex = 0;
  final double radius;

  Color? _firstColor;
  Color? _secondColor;
  int jellyPosition = 0;
  final JellyPosition jellyPositionEnum;
  bool _keepNodes = false;
  Paint nodePaint = Paint();
  Color nodePaintColor = getRandomColor();
  double nodeRadius = 4.0;

  Offset centerPointOfJelly = Offset(0, 0);
  double radiusOfJelly = 0.0; // DO NOT MANUALLY UPDATE THIS ONE.
  double minRadius = 0;
  double maxRadius = 0;
  double stepRadian = 0;
  double startAngle = 0.0;
  double endAngle = 360.0;
  double startRadian = 0.0;
  double endRadian = 2 * pi;
  double boundaryRadiusFactor = 1.2;

  // this one is in degree mean 0 to 360.
  List<BorderPoint> borderPoints = [];
  Path jellyPath = Path();
  Size size;

  Paint getDefaultPathPaint() {
    return Paint()
      ..color = getRandomColor()
      ..style = PaintingStyle.fill;
  }

  bool get keepNodes => _keepNodes;

  double savedTime = 0.0;

  bool isSecondColorSaturated = false;

  /// This method will call to update the color of jelly. if the color is not given it'll take random colors.
  Color updateColor(Color color, double time, int position) {
    if (savedTime > time) {
      _firstColor = _secondColor;
      if (colorList.isNotEmpty) {
        _setSingleColors();
      } else {
        if (isSecondColorSaturated) {
          _secondColor = getLowSaturatedRandomColor(alpha: 0.8);
        } else {
          _secondColor = getHighSaturatedRandomColor(alpha: 0.8);
        }
      }
      isSecondColorSaturated = !isSecondColorSaturated;
    }

    savedTime = time;
    Color newColor = Color.lerp(_firstColor, _secondColor, time)!;
    return newColor;
  }

  /// This method will set random color.
  _setSingleColors() {
    if (jellyPosition > 0) {
      _colorListIndex = Random().nextInt(colorList.length);
    }
    if (_secondColor == null) {
      _firstColor = colorList[_colorListIndex];
    }
    _colorListIndex++;
    if (_colorListIndex > colorList.length - 1) {
      _colorListIndex = 0;
    }
    _secondColor = colorList[_colorListIndex];
  }

  /// This method will redraw the jelly
  void reConfigPaint(Size size, {bool? isDraw, int position = 0}) {
    this.size = size;
    if (fillPaint == null) {
      fillPaint = getDefaultPathPaint();
    }

    if (colorList == null || colorList.isEmpty) {
      if (position.isEven) {
        _firstColor = getHighSaturatedRandomColor(alpha: 0.8);
        _secondColor = getLowSaturatedRandomColor(alpha: 0.8);
      } else {
        _firstColor = getLowSaturatedRandomColor(alpha: 0.8);
        _secondColor = getHighSaturatedRandomColor(alpha: 0.8);
      }
    } else {
      _setSingleColors();
    }

    startRadian = Angle.degrees(startAngle).radians;
    endRadian = Angle.degrees(endAngle).radians;

    stepRadian = (endRadian - startRadian) / this.jellyCoordinates;
    centerPointOfJelly = Offset(size.width / 2, size.height / 2);
    // if (size.width > size.height) {
    // landscape;
    if (radius > 0) {
      radiusOfJelly = radius;
    } else {
      radiusOfJelly = getJellyRadius();
    }
    // } else {
    // portrait;
    // radiusOfJelly = (size.width / _radiusFactor) * reductionRadiusFactor;
    // }
    minRadius = radiusOfJelly / boundaryRadiusFactor;
    maxRadius = radiusOfJelly * boundaryRadiusFactor;
    createJellyPathPoints();
    createJellyPath();
  }

  double getJellyRadius() {
    switch (jellyPositionEnum) {
      case JellyPosition.bottomLeft:
        return (size.height / _radiusFactor) * reductionRadiusFactor / 2;
      case JellyPosition.bottomCenter:
        return (size.height / _radiusFactor) * reductionRadiusFactor / 2;
      case JellyPosition.bottomRight:
        return (size.height / _radiusFactor) * reductionRadiusFactor / 2;
      case JellyPosition.topRight:
        return (size.height / _radiusFactor) * reductionRadiusFactor * 9;
      case JellyPosition.topLeft:
        return (size.height / _radiusFactor) * reductionRadiusFactor * 9;
      case JellyPosition.topCenter:
        return (size.height / _radiusFactor) * reductionRadiusFactor * 9;
      case JellyPosition.centerLeft:
        return (size.height / _radiusFactor) * reductionRadiusFactor;
      case JellyPosition.centerRight:
        return (size.height / _radiusFactor) * reductionRadiusFactor;
      default:
        return (size.height / _radiusFactor) * reductionRadiusFactor;
    }
  }

  JellyConfiguration(this.size,
      {this.jellyPosition = 0,
      this.radiusOfJelly = 5,
      required this.jellyCoordinates,
      this.reductionRadiusFactor = 1,
      this.radius = 0,
      required this.jellyPositionEnum,
      required this.fillPaint,
      required this.colorList}) {
    assert(jellyCoordinates > 3);
    reConfigPaint(size, isDraw: false, position: jellyPosition);
  }

  /// This method will create the jelly path.
  void createJellyPathPoints() {
    borderPoints.clear();
    for (int i = 0; i < jellyCoordinates; i++) {
      double radian = startRadian + (stepRadian * i);
      double randomRadius = getRandomRadius(this);
      double xPoint = centerPointOfJelly.dx + randomRadius * cos(radian);
      double yPoint = centerPointOfJelly.dy + randomRadius * sin(radian);
      borderPoints.add(BorderPoint(
          xPoint, yPoint, radian, randomRadius, MovementDirection.INWARD));
    }
  }

  /// This method will update the jelly path.
  void updateJellyPathPoints(double time, int position) {
    fillPaint?.color = updateColor(fillPaint!.color, time, position);
    for (int i = 0; i < borderPoints.length; i++) {
      BorderPoint point = borderPoints[i];

      bool movementInside = needRadiusDecrease(borderPoints[i]);
      double ran = Random().nextDouble() * Random().nextInt(2);
      double newRadius = 0.0;
      if (movementInside) {
        newRadius = point.radius - ran;
      } else {
        newRadius = point.radius + ran;
      }

      double xPoint =
          centerPointOfJelly.dx + (newRadius * cos(point.radianAngle));
      double yPoint =
          centerPointOfJelly.dy + (newRadius * sin(point.radianAngle));
      MovementDirection direction;
      if (movementInside) {
        direction = MovementDirection.INWARD;
      } else {
        direction = MovementDirection.OUTWARD;
      }
      borderPoints[i] = (BorderPoint(
          xPoint, yPoint, point.radianAngle, newRadius, direction));
    }
    createJellyPath();
  }

  void createJellyPath() {
    jellyPath.reset();
    var mid = (getOffset(borderPoints[0]) + getOffset(borderPoints[1])) / 2;
    jellyPath.moveTo(mid.dx, mid.dy);
    for (var i = 0; i < borderPoints.length; i++) {
      var p1 = getOffset(borderPoints[(i + 1) % borderPoints.length]);
      var p2 = getOffset(borderPoints[(i + 2) % borderPoints.length]);
      mid = (p1 + p2) / 2;
      jellyPath.quadraticBezierTo(p1.dx, p1.dy, mid.dx, mid.dy);
    }
  }

  Offset getOffset(BorderPoint borderPoint) {
    return Offset(borderPoint.dx, borderPoint.dy);
  }

  bool needRadiusDecrease(BorderPoint borderPoint) {
    if (borderPoint.radius <= minRadius) {
      return false;
    } else if (borderPoint.radius >= maxRadius) {
      return true;
    } else if (borderPoint.direction == MovementDirection.INWARD) {
      return true;
    } else {
      return false;
    }
  }
}
