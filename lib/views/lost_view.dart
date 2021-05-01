import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class LostView {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  LostView(this.game) {
    rect = Rect.fromLTWH(
      game.titleSize,
      (game.screenSize.height / 2) - (game.titleSize * 5),
      game.titleSize * 7,
      game.titleSize * 5,
    );
    sprite = Sprite('bg/lose-splash.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}
}
