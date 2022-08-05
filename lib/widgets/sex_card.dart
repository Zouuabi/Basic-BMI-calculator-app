import 'package:flutter/material.dart';

import '../../constants.dart';

const double kIconSize = 80;
const double kSizedBoxHeight = 15;

class SexCard extends StatelessWidget {
  const SexCard({Key? key, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
        ),
        const SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
