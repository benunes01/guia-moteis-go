import 'package:flutter/material.dart';
import 'package:teste/app/core/utils/format_string.dart';
import 'package:teste/app/features/home/infra/models/suite_model.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: suite.itens.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.check, color: Colors.green),
                      title: Text(suite.itens[index].nome),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
