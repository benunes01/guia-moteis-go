import 'package:flutter/material.dart';
import 'package:teste/app/features/home/infra/models/motel_model.dart';
import 'package:teste/app/features/home/presenter/components/circular_image.dart';
import 'package:teste/app/features/home/presenter/components/motel_info.dart';
import 'package:teste/app/features/home/presenter/components/suite_card.dart';

class MotelCard extends StatelessWidget {
  final MotelModel motel;
  const MotelCard({required this.motel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularImage(imageUrl: motel.logo),
                const SizedBox(width: 12),
                MotelInfo(motel: motel),
              ],
            ),
          ),
          const SizedBox(height: 12,),
          ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 700,
              ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: motel.suites.length,
              itemBuilder: (context, index) {
                final suite = motel.suites[index];
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 24.0 : 0.0),
                  child: SuiteCard(suite: suite),
                );
              },
            )
          )
        ],
      ),
    );
  }
}