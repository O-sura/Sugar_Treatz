import 'package:flutter/material.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final double iconSize;
  final double textSize;

  const IconAndText(
      {Key? key,
      required this.text,
      required this.icon,
      this.iconColor = Colors.black,
      this.textColor = Colors.black,
      this.iconSize = 0,
      this.textSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: (iconSize == 0) ? Dimensions.height20 : iconSize,
          color: iconColor,
        ),
        SizedBox(
          width: Dimensions.width05,
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: (textSize == 0) ? Dimensions.height14 : textSize,
          ),
        ),
      ],
    );
  }
}
