import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/core/theme/theme_typography.dart';
import 'package:teste/app/core/utils/format_string.dart';
import 'package:teste/app/features/home/infra/models/period_model.dart';

class PeriodCard extends StatelessWidget {
  final PeriodModel periodo;

  const PeriodCard({
    super.key,
    required this.periodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: ThemeColors.kAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    periodo.tempoFormatado,
                    style: ThemeTypography.headline2.copyWith(
                      color: ThemeColors.kTextLight,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if(periodo.desconto?.desconto != null) Row(
                    children: [
                      const SizedBox(width: 6,),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ThemeColors.kSuccess)
                        ),
                        child: Text('${periodo.desconto!.desconto.toInt()}% off', style: ThemeTypography.sub1.copyWith(
                          color: ThemeColors.kSuccess
                        ),),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  if(periodo.valor != periodo.valorTotal) Row(
                    children: [
                      Text(
                        'R\$ ${convertMoneyToBrazil(periodo.valor)}',
                        style: ThemeTypography.headline2.copyWith(
                          color: ThemeColors.kTextVeryLight,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8,)
                    ],
                  ),
                  Text(
                    'R\$ ${convertMoneyToBrazil(periodo.valorTotal)}',
                    style: ThemeTypography.headline2.copyWith(
                      color: ThemeColors.kTextLight,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: ThemeColors.kTextLight,)
        ],
      ),
    );
  }
}
