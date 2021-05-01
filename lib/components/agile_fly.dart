import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_game/components/fly.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class AgileFly extends Fly {

  double get speed => game.titleSize * 5;

  AgileFly(LangawGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');

    flyRect = Rect.fromLTWH(
      x,
      y,
      game.titleSize * 1.5,
      game.titleSize * 1.5,
    );
  }
}
