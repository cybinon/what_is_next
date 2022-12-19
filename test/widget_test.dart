import 'package:flame/game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:what_is_next/dino_game.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final game = DinoGame();
    await tester.pumpWidget(GameWidget(game: game));
  });
}
