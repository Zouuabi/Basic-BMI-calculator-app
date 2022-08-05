
import 'package:flutter/material.dart';

import '../../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(color: kButtonColor),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              letterSpacing: 2,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}