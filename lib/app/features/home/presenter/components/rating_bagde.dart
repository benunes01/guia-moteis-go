import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/core/theme/theme_typography.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  const RatingBadge({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.kStar),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: ThemeColors.kStar, size: 14),
          const SizedBox(width: 2),
          Text(
            rating.toString(),
            style: ThemeTypography.sub1.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}