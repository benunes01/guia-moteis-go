import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';
import 'package:teste/app/core/utils/suite_item_icon.dart';

class SuiteItems extends StatelessWidget {
  final List<String> items;
  final VoidCallback onViewAll;

  const SuiteItems({
    super.key,
    required this.items,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewAll,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 48,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: ThemeColors.kAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...items.take(4).map((item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: ThemeColors.kBase,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(getItemIcon(item), size: 28, color: ThemeColors.kGrey),
              ),
            )),
            if (items.length > 4)
              Row(
                children: [
                  Text(
                    "Ver\ntodos",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_outlined, size: 18, color: Colors.grey),
                ],
              ),
          ],
        ),
      ),
    );
  }
}