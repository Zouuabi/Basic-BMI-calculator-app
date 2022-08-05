import 'package:flutter/material.dart';

const double kMmargin = 15;
const double kBorderRadius = 15;

class Mycard extends StatelessWidget {
  const Mycard({Key? key, required this.color, this.child, this.onPress})
      : super(key: key);
  final Widget? child;
  final Color color;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(kMmargin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: child,
      ),
    );
  }
}
