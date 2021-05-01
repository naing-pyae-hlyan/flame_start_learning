import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class Backyard {
  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.titleSize * 23),
      game.titleSize * 9,
      game.titleSize * 23,
    );
  }

  final LangawGame game;
  Sprite bgSprite;
  Rect bgRect;

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
