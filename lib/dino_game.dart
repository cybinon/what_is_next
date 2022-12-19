import 'dart:ui';

import 'package:flame/game.dart';
import 'dino_player.dart';
import 'dino_world.dart';

import 'directions.dart';

class DinoGame extends FlameGame {
  final DinoPlayer _dinoPlayer = DinoPlayer();
  final DinoWorld _dinoWorld = DinoWorld();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(_dinoWorld);
    add(_dinoPlayer);
    _dinoPlayer.position = _dinoWorld.size / 2;
    camera.followComponent(_dinoPlayer);
  }

  onArrowKeyChanged(Direction direction) {
    _dinoPlayer.direction = direction;
  }
}
