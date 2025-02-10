import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teste/app/core/theme/theme_colors.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final Color baseColor;
  final Color highlightColor;

  const CustomShimmer({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.baseColor = ThemeColors.kGrey,
    this.highlightColor = ThemeColors.kAccent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: SizedBox(),
      ),
    );
  }
}
