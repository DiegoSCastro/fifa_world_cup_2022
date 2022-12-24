import 'package:fifa_world_cup_2022/app/core/ui/styles/app_colors.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final String iconAsset;
  final String label;
  final int value;
  const StatusTile({
    required this.iconAsset,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 46,
          child: CircleAvatar(
            radius: 46,
            backgroundColor: context.colors.grey,
            child: Image.asset(iconAsset),
          ),
        ),
        title: Text(
          label,
          style: context.textStyles.textPrimaryFontRegular.copyWith(color: Colors.white),
        ),
        trailing: Text(
          '$value',
          style: context.textStyles.textPrimaryFontMedium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
