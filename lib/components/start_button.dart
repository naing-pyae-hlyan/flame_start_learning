import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';
import 'package:flame_game/view.dart';

class StartButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.titleSize * 1.5,
      (game.screenSize.height * 0.75) - (game.titleSize * 1.5),
      game.titleSize * 6,
      game.titleSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {
    game.activeView = View.playing;
    game.spawner.start();
  }
}
