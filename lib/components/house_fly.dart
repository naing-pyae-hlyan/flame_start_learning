import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_game/components/fly.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class HouseFly extends Fly {
  HouseFly(LangawGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');

    flyRect = Rect.fromLTWH(
      x,
      y,
      game.titleSize * 1.5,
      game.titleSize * 1.5,
    );
  }
}
