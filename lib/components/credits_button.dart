import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';
import '../view.dart';

class CreditButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  CreditButton(this.game) {
    rect = Rect.fromLTWH(
      game.screenSize.width - (game.titleSize * 1.25),
      game.screenSize.height - (game.titleSize * 1.25),
      game.titleSize,
      game.titleSize,
    );
    sprite = Sprite('ui/icon-credits.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.credits;
  }
}
