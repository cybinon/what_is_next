import 'package:flame/components.dart';

class DinoPlayer extends SpriteComponent with HasGameRef {
  DinoPlayer() : super(size: Vector2.all(32.0));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('dino.jpg');
    // is image loaded check
    if (sprite == null) {
      print('sprite is null');
    }
    position = gameRef.size / 2;
  }
}
