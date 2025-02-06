import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/core/theme/theme_typography.dart';
import 'package:teste/app/core/utils/format_string.dart';
import 'package:teste/app/features/home/infra/models/suite_model.dart';
import 'package:teste/app/features/home/presenter/components/periodo_card.dart';
import 'package:teste/app/features/home/presenter/components/suite_itens.dart';

class SuiteCard extends StatelessWidget {
  final SuiteModel suite;
  const SuiteCard({required this.suite, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      child: Column(
        children: [
          Container(
            height: 290,
            decoration: BoxDecoration(
              color: ThemeColors.kAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 240,
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      suite.fotos.elementAt(0),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(fixEncoding(suite.nome), style: ThemeTypography.headline3,),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6,),
          SuiteItens(
            itens: suite.itens.map((e) => e.nome).toList(),
            onViewAll: () {
            },
          ),
          Column(
            children: List.generate(suite.periodos.length, (index) {
              final periodo = suite.periodos[index];

              return Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: PeriodCard(
                  periodo: periodo,
                ),
              );
            }),
          )

        ],
      ),
    );
  }
}
