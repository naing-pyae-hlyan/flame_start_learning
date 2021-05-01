import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';
import 'package:flame_game/view.dart';

class HelpButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  HelpButton(this.game) {
    rect = Rect.fromLTWH(
      game.titleSize * 0.25,
      game.screenSize.height - (game.titleSize * 1.25),
      game.titleSize,
      game.titleSize,
    );
    sprite = Sprite('ui/icon-help.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.help;
  }
}
