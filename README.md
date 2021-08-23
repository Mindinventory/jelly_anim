# Jelly Animation

A widget to render moving blobby objects.

![jelly_anim](https://github.com/Mindinventory/jelly_anim/blob/jelly_anim_version_0.0.7/meditation_jelly.gif)

Also, implemented [this](https://dribbble.com/shots/7062770-Login-Flow) using Jelly

## Key Features

* Highly customizable JellyAnim rendering for Flutter.
* Multiple JellyAnim instances
* Overlap Jellies
* Tween shapes and change colors
* Set jelly viewport with custom size
* Set custom radius of jelly
* Add custom style of jelly with the help of `paint` param of `JellyAnim` class

## Getting Started

To use this package, add `jelly_anim` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

    dependencies:
      ...
      jelly_anim: any


Now in your Dart code, you can use:

     import 'package:jelly_anim/jelly_anim.dart';

## Usage

     JellyAnim(jellyCount: jellyCount,
                radius: 20,
                viewPortSize: Size(200, 600),
                jellyCoordinates: 10,
                allowOverFlow: true,
                duration: Duration(milliseconds: 200),
                jellyPosition: JellyPosition.bottomCenter);

## Constructor Parameters

- `jellyCount` defines that how many jelly we want to overlap.

- `duration` defines the color transition & movement duration of jelly.

- `jellyCoordinates` defines the movement of jelly.
    -   NOTE: default value is 5 & user have to give more than 3.

- `radius` defines the size of jelly.

- Inside the `viewPortSize` defined size the jelly will draw.
    - NOTE: by default the size of viewport is same as screen size.

- `colors` list of colors for transition if user will not give any color then it'll take random color.

- `jellyPosition` enum is responsible to manage the position of jelly in viewport
    -  NOTE: default position of jelly is center.

- `fillPaint` to give custom paint values like stroke, strokeWidth, style, etc.

- `allowOverFlow` flag will give us a provision to render animation outside the viewport.

### Dependencies
* angles: any
* bezier: any
* random_color: any

## LICENSE!
jelly_anim is [MIT-licensed](/LICENSE).


## Let us know!
We’d be really happy if you send us links to your projects where you use our component. Just send an email to sales@mindinventory.com And do let us know if you have any questions or suggestion regarding our work.