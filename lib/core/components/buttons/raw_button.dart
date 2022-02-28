import 'package:flutter/material.dart';

class PlayableRawButton extends StatelessWidget {
  final Function()? onHover;
  final Function()? onExit;

  final Widget child;
  final MouseCursor? cursor;
  final Function? onPressed;

  const PlayableRawButton({
    Key? key,
    this.onHover,
    this.onExit,
    this.cursor,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => onPressed != null
      ? GestureDetector(
          onTap: () => onPressed!(),
          child: child,
        )
      : child;
}
