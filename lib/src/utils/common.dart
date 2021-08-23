import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jelly_anim/random_color/color_info.dart';
import 'package:jelly_anim/random_color/random_color.dart';

import 'jelly_configurations.dart';

RandomColor _randomColor = RandomColor();

double getRandomRadius(JellyConfiguration myConfigurations) {
  return myConfigurations.minRadius +
      Random().nextInt(
          (myConfigurations.maxRadius - myConfigurations.minRadius).toInt());
}

Color getHighSaturatedRandomColor({double alpha = 1.0}) {
  return _randomColor
      .randomColor(colorSaturation: ColorSaturation.highSaturation)
      .withOpacity(alpha);
}

Color getLowSaturatedRandomColor({double alpha = 1.0}) {
  return _randomColor
      .randomColor(colorSaturation: ColorSaturation.lowSaturation)
      .withOpacity(alpha);
}

Color getRandomColor({double alpha = 1.0}) {
  return _randomColor
      .randomColor(colorSaturation: ColorSaturation.random)
      .withOpacity(alpha);
}
