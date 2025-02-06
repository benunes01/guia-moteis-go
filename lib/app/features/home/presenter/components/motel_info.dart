import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/core/theme/theme_typography.dart';
import 'package:teste/app/core/utils/format_string.dart';
import 'package:teste/app/features/home/presenter/components/rating_bagde.dart';

class MotelInfo extends StatelessWidget {
  final dynamic motel;
  const MotelInfo({required this.motel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          motel.fantasia,
          style: ThemeTypography.headline1.copyWith(color: ThemeColors.kTextLight),
        ),
        const SizedBox(height: 4),
        Text(fixEncoding(motel.bairro), style: ThemeTypography.sub1),
        const SizedBox(height: 10),
        Row(
          children: [
            RatingBadge(rating: motel.media),
            const SizedBox(width: 8),
            Text('${motel.qtdAvaliacoes} avaliações'),
          ],
        ),
      ],
    );
  }
}