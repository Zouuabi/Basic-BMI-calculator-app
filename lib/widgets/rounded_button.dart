import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF4C4F5E),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 30,
        ),
      ),
    );
  }
}
