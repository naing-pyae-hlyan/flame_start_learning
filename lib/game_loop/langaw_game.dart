import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_game/components/agile_fly.dart';
import 'package:flame_game/components/backyard.dart';
import 'package:flame_game/components/credits_button.dart';
import 'package:flame_game/components/drooler_fly.dart';
import 'package:flame_game/components/fly.dart';
import 'package:flame_game/components/help_button.dart';
import 'package:flame_game/components/house_fly.dart';
import 'package:flame_game/components/hungry_fly.dart';
import 'package:flame_game/components/macho_fly.dart';
import 'package:flame_game/components/start_button.dart';
import 'package:flame_game/controllers/spawner.dart';
import 'package:flame_game/view.dart';
import 'package:flame_game/views/credits_view.dart';
import 'package:flame_game/views/help_view.dart';
import 'package:flame_game/views/home_views.dart';
import 'package:flame_game/views/lost_view.dart';
import 'package:flutter/gestures.dart';

class LangawGame with Game {
  LangawGame() {
    initialize();
  }

  Size screenSize;
  double titleSize;
  Backyard background;
  List<Fly> flies;
  FlySpawner spawner;
  Random rdn;

  View activeView = View.home;

  HomeView homeView;
  HelpView helpView;
  CreditsView creditsView;
  LostView lostView;

  StartButton startButton;
  HelpButton helpButton;
  CreditButton creditButton;

  void initialize() async {
    flies = <Fly>[];
    rdn = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    startButton = StartButton(this);
    helpButton = HelpButton(this);
    creditButton = CreditButton(this);

    spawner = FlySpawner(this);
    homeView = HomeView(this);
    lostView = LostView(this);
    helpView = HelpView(this);
    creditsView = CreditsView(this);
  }

  void spawnFly() {
    double x = rdn.nextDouble() * (screenSize.width - (titleSize * 2.025));
    double y = rdn.nextDouble() * (screenSize.height - (titleSize * 2.025));

    switch (rdn.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    titleSize = screenSize.width / 9;
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    /// This is paint for background color.
    // Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    // Paint bgPaint = Paint();
    // bgPaint.color = Color(0xff576574);
    // canvas.drawRect(bgRect, bgPaint);

    background.render(canvas);

    flies.forEach((Fly fly) => fly.render(canvas));

    if (activeView == View.home) homeView.render(canvas);

    if (activeView == View.lost) lostView.render(canvas);

    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
      helpButton.render(canvas);
      creditButton.render(canvas);
    }

    if (activeView == View.help) helpView.render(canvas);

    if (activeView == View.credits) creditsView.render(canvas);
  }

  @override
  void update(double t) {
    spawner.update(t);
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    /// help and credits view (dialog boxes)
    if (!isHandled) {
      if (activeView == View.help || activeView == View.credits) {
        activeView = View.home;
        isHandled = true;
      }
    }

    /// help button
    if (!isHandled && helpButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        helpButton.onTapDown();
        isHandled = true;
      }
    }

    /// credits button
    if (!isHandled && creditButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        creditButton.onTapDown();
        isHandled = true;
      }
    }

    /// start button
    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }

    /// flies
    if (!isHandled) {
      bool didHitAtFly = false;

      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
          didHitAtFly = true;
        }
      });

      if (activeView == View.playing && !didHitAtFly) {
        activeView = View.lost;
      }
    }
  }
}
