import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:what_is_next/dino_player.dart';
import 'package:what_is_next/dino_world.dart';

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
    camera.followComponent(_dinoPlayer,
        worldBounds: Rect.fromLTRB(0, 0, _dinoWorld.size.x, _dinoWorld.size.y));
  }

  onArrowKeyChanged(Direction direction) {
    _dinoPlayer.direction = direction;
  }
}
