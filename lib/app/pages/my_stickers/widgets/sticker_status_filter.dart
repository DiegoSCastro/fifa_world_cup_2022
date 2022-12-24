import 'package:fifa_world_cup_2022/app/core/ui/styles/app_button_styles.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_colors.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_text_styles.dart';
import 'package:fifa_world_cup_2022/app/core/ui/widgets/button.dart';
import 'package:fifa_world_cup_2022/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;
  const StickerStatusFilter({
    super.key,
    required this.filterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: width * .3,
            onPressed: () {
              presenter.statusFilter('all');
            },
            style: filterSelected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'all'
                ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium.copyWith(color: Colors.white),
            label: 'Todas',
          ),
          Button(
            width: width * .3,
            onPressed: () {
              presenter.statusFilter('missing');
            },
            style: filterSelected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'missing'
                ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium.copyWith(color: Colors.white),
            label: 'Faltando',
          ),
          Button(
            width: width * .3,
            onPressed: () {
              presenter.statusFilter('repeated');
            },
            style: filterSelected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'repeated'
                ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium.copyWith(color: Colors.white),
            label: 'Repetidas',
          ),
        ],
      ),
    );
  }
}
