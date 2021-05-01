import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_game/game_loop/langaw_game.dart';

class Fly {
  Fly(this.game) {
    setTargetLocation();
  }

  final LangawGame game;
  Rect flyRect;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  bool isDead = false;
  bool isOffScreen = false;

  Offset targetLocation;

  double get speed => game.titleSize * 3;

  void setTargetLocation() {
    double x = game.rdn.nextDouble() *
        (game.screenSize.width - (game.titleSize * 2.025));
    double y = game.rdn.nextDouble() *
        (game.screenSize.height - (game.titleSize * 2.025));

    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      /// make the fly fall
      flyRect = flyRect.translate(0, game.titleSize * 12 * t);

      if (flyRect.top > game.screenSize.height) isOffScreen = true;
    } else {
      /// flap the wing
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }
    }

    /// move the fly
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(
        toTarget.direction,
        stepDistance,
      );
      flyRect = flyRect.shift(stepToTarget);
    } else {
      flyRect = flyRect.shift(toTarget);
      setTargetLocation();
    }
  }

  void onTapDown() {
    isDead = true;
  }
}
