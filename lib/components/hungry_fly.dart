import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_game/components/fly.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class HungryFly extends Fly {
  HungryFly(LangawGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');

    flyRect = Rect.fromLTWH(
      x,
      y,
      game.titleSize * 1.65,
      game.titleSize * 1.65,
    );
  }
}
