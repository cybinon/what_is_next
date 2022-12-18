import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:what_is_next/dino_game.dart';

void main() {
  final game = DinoGame();
  runApp(GameWidget(game: game));
}
