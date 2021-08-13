# Jelly Animation

A widget to render moving blobby objects.


<br>![N|Solid](jelly_anim.gif)</br>
Implemented [this](https://dribbble.com/shots/7062770-Login-Flow) using Jelly

## Key Features

* Highly customizable JellyAnim rendering for Flutter.
* Multiple JellyAnim instances
* Overlap Jellies
* Tween shapes and change colors

## Getting Started

To use this package, add `jelly_anim` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

    dependencies:
      ...
      jelly_anim: any


Now in your Dart code, you can use:

     import 'package:jelly_anim/jelly_anim.dart';

## Usage

     JellyAnim(
                 jellyCount: jellyCount,
                 radius: 120,
                 viewPortSize: Size(700, 400),
                 jellyCoordinates: 10,
                 allowOverFlow: true,
                 jellyPosition: JellyPosition.centerLeft,
               );
# Constructor Parameters

`jellyCount` defines that how many jelly we want to overlap.

`duration` defines the color transition & movement duration of jelly.

`jellyCoordinates` defines the movement of jelly.
 NOTE: default value is 5 & user have to give more than 3.

`radius` defines the size of jelly.

Inside the `viewPortSize` defined size the jelly will draw.
NOTE: by default the size of viewport is same as screen size.

`colors` list of colors for transition if user will not give any color then it'll take random color.

`jellyPosition` enum is responsible to manage the position of jelly in viewport
NOTE: default position of jelly is center.

`fillPaint` to give custom paint values like stroke, strokeWidth, style, etc.

`allowOverFlow` flag will give us a provision to render animation outside the viewport.

# LICENSE!

jelly_anim is [MIT-licensed](/LICENSE).


# Let us know!

We’d be really happy if you send us links to your projects where you use our component. Just send an email to sales@mindinventory.com And do let us know if you have any questions or suggestion regarding our work.