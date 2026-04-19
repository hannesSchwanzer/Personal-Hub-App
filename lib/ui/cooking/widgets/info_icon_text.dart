import 'package:flutter/material.dart';

/// Shows an icon with a label to its right for quick info (e.g. time, servings)
class InfoIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? style;
  final Color? iconColor;

  const InfoIconText({
    Key? key,
    required this.icon,
    required this.text,
    this.style,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: iconColor ?? Theme.of(context).hintColor),
        const SizedBox(width: 4),
        Text(text, style: style),
      ],
    );
  }
}

