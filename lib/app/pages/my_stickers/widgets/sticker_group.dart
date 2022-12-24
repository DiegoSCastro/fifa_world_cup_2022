import 'package:fifa_world_cup_2022/app/models/group_stickers.dart';
import 'package:fifa_world_cup_2022/app/models/user_sticker_model.dart';
import 'package:fifa_world_cup_2022/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/app_text_styles.dart';

class StickerGroup extends StatelessWidget {
  final GroupStickers group;
  final String statusFilter;
  const StickerGroup({
    super.key,
    required this.group,
    required this.statusFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 128,
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, 0),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 1.7).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              final stickerList =
                  group.stickers.where((sticker) => sticker.stickerNumber == stickerNumber);

              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                stickerNumber: stickerNumber,
                sticker: sticker,
                countryName: group.countryName,
                countryCode: group.countryCode,
              );

              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;

  final UserStickerModel? sticker;
  final String countryName;
  final String countryCode;

  const Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final presenter = context.get<MyStickersPresenter>();
        await Navigator.of(context).pushNamed('/sticker-detail', arguments: {
          'countryCode': countryCode,
          'stickerNumber': stickerNumber,
          'countryName': countryName,
          'stickerUser': sticker,
        });
        presenter.refresh();
      },
      child: Container(
        color: sticker != null ? context.colors.primary : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: (sticker?.duplicate ?? 0) > 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  sticker?.duplicate.toString() ?? '',
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.yellow,
                  ),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
