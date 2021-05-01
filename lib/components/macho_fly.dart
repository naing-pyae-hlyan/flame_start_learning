import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_game/components/fly.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class MachoFly extends Fly {
  double get speed => game.titleSize * 2.5;

  MachoFly(LangawGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');

    flyRect = Rect.fromLTWH(
      x,
      y,
      game.titleSize * 2.025,
      game.titleSize * 2.025,
    );
  }
}
