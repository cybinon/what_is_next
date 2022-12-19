import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'directions.dart';

class NavigationKeys extends StatefulWidget {
  final ValueChanged<Direction>? onDirectionChanged;

  const NavigationKeys({Key? key, required this.onDirectionChanged})
      : super(key: key);

  @override
  State<NavigationKeys> createState() => _NavigationKeysState();
}

class _NavigationKeysState extends State<NavigationKeys> {
  Direction direction = Direction.none;
  late Timer timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
    widget.onDirectionChanged!(direction);
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 2,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Joystick(
            listener: ((details) => {
                  if (details.x == 0 && details.y > 0) direction = Direction.up,
                  if (details.x == 0 && details.y < 0)
                    direction = Direction.down,
                  if (details.x > 0 && details.y == 0)
                    direction = Direction.right,
                  if (details.x < 0 && details.y == 0)
                    direction = Direction.left,
                  if (details.x > 0 && details.y > 0)
                    direction = Direction.downRight,
                  if (details.x > 0 && details.y < 0)
                    direction = Direction.upRight,
                  if (details.x < 0 && details.y > 0)
                    direction = Direction.downLeft,
                  if (details.x < 0 && details.y < 0)
                    direction = Direction.upLeft,
                  if (details.x == 0 && details.y == 0)
                    direction = Direction.none,
                  updateDirection(direction),
                  if (timer.isActive == true) timer.cancel(),
                  timer = Timer.periodic(const Duration(milliseconds: 200),
                      (timer) {
                    updateDirection(Direction.none);
                    timer.cancel();
                  })
                })),
      ),
    );
  }

  void updateDirection(Direction newDirection) {
    direction = newDirection;
    widget.onDirectionChanged!(direction);
  }
}
