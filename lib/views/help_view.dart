import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class HelpView {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  HelpView(this.game) {
    rect = Rect.fromLTWH(
      game.titleSize * 0.5,
      (game.screenSize.height / 2) - (game.titleSize * 6),
      game.titleSize * 8,
      game.titleSize * 12,
    );
    sprite = Sprite('ui/dialog-help.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }
}
