import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_game/components/agile_fly.dart';
import 'package:flame_game/components/backyard.dart';
import 'package:flame_game/components/drooler_fly.dart';
import 'package:flame_game/components/fly.dart';
import 'package:flame_game/components/house_fly.dart';
import 'package:flame_game/components/hungry_fly.dart';
import 'package:flame_game/components/macho_fly.dart';
import 'package:flutter/gestures.dart';

class LangawGame with Game {
  LangawGame() {
    initialize();
  }

  Size screenSize;
  double titleSize;
  Backyard background;
  List<Fly> flies;
  Random rdn;

  void initialize() async {
    flies = <Fly>[];
    rdn = Random();

    resize(await Flame.util.initialDimensions());

    background = Backyard(this);

    spawnFly();
  }

  void spawnFly() {
    double x = rdn.nextDouble() * (screenSize.width - (titleSize * 2.025));
    double y = rdn.nextDouble() * (screenSize.height - (titleSize * 2.025));

    switch (rdn.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    titleSize = screenSize.width / 9;
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    /// This is paint for background color.
    // Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    // Paint bgPaint = Paint();
    // bgPaint.color = Color(0xff576574);
    // canvas.drawRect(bgRect, bgPaint);

    background.render(canvas);

    flies.forEach((Fly fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    // if (flies.length < 1) {
    //   spawnFly();
    // }
  }

  void onTapDown(TapDownDetails d) {
    // flies.forEach((Fly fly) {
    //   if (fly.flyRect.contains(d.globalPosition)) fly.onTapDown();
    // });

    for (int i = 0, l = flies.length; i < l; i++) {
      if (flies[i].flyRect.contains(d.globalPosition)) {
        flies[i].onTapDown();
      }
    }
  }
}
