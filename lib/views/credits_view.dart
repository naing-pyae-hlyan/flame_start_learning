import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class CreditsView {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  CreditsView(this.game) {
    rect = Rect.fromLTWH(
      game.titleSize * 0.5,
      (game.screenSize.height / 2) - (game.titleSize * 6),
      game.titleSize * 8,
      game.titleSize * 12,
    );
    sprite = Sprite('ui/dialog-credits.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }
}
