import 'package:fifa_world_cup_2022/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_2022/app/models/user_sticker_model.dart';
import 'package:fifa_world_cup_2022/app/pages/sticker_detail/view/sticker_detail_view.dart';

abstract class StickerDetailPresenter extends FwcPresenter<StickerDetailView> {
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  });

  void incrementAmount();
  void decrementAmount();

  Future<void> saveSticker();
  Future<void> deleteSticker();
}
