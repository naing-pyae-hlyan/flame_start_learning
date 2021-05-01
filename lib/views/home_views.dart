import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class HomeView {
  final LangawGame game;
  Rect titleRect;
  Sprite titleSprite;

  HomeView(this.game) {
    titleRect = Rect.fromLTWH(
      game.titleSize,
      (game.screenSize.height / 2) - (game.titleSize * 4),
      game.titleSize * 7,
      game.titleSize * 4,
    );
    titleSprite = Sprite('branding/title.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}
