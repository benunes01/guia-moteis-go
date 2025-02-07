import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/core/theme/theme_typography.dart';
import 'package:teste/app/core/utils/format_string.dart';
import 'package:teste/app/features/home/infra/models/suite_model.dart';
import 'package:teste/app/features/home/presenter/components/dashed_text_line.dart';

class SuiteItemsBottomSheet extends StatelessWidget {
  final SuiteModel suite;

  const SuiteItemsBottomSheet({required this.suite, super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      maxChildSize: 1.0,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 32,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 220,
                  child: Text(
                    fixEncoding(suite.nome),
                    style: ThemeTypography.headline2.copyWith(
                      color: ThemeColors.kTextLight
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              DashedTextLine(
                  text: 'principais itens',
                  style: ThemeTypography.headline2,
              ),
              Wrap(
                spacing: 0,
                runSpacing: 8,
                children: suite.categoriaItens.map((item) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: (MediaQuery.of(context).size.width - 48) / 2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(item.icone, width: 48),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(fixEncoding(item.nome), style: ThemeTypography.sub1),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              DashedTextLine(
                text: 'tem também',
                style: ThemeTypography.headline2,
              ),
              Text(suite.itens.map((e) => fixEncoding(e.nome)).toList().join(', '),
                style: ThemeTypography.sub1.copyWith(
                  fontSize: 14
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
