import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';

class DashedTextLine extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const DashedTextLine({
    super.key,
    required this.text,
    this.style
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ThemeColors.kGrey,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
              text,
              style: style,
          ),
        ),
        Expanded(
          child: Divider(
            color: ThemeColors.kGrey,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}