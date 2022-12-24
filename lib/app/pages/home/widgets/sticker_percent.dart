import 'dart:math';

import 'package:fifa_world_cup_2022/app/core/ui/styles/app_colors.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class StickerPercent extends StatelessWidget {
  final int percent;
  const StickerPercent({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: context.colors.grey,
            shape: BoxShape.circle,
          ),
          child: Text(
            '${percent.toStringAsFixed(0)}%',
            style: context.textStyles.titlePrimary,
          ),
        ),
        SizedBox(
          height: 110,
          width: 110,
          child: Transform.rotate(
            angle: -pi / 2,
            child: CircularProgressIndicator(
              value: percent / 100,
              color: Colors.white,
              strokeWidth: 5,
              backgroundColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
