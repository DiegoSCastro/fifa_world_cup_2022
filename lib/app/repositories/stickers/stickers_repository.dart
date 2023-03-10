import '../../models/group_stickers.dart';
import '../../models/register_sticker_model.dart';
import '../../models/sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
  Future<StickerModel?> findStickerByCode(String stickerCode, String stickerNumber);
  Future<StickerModel> create(RegisterStickerModel registerStickerModel);
  Future<void> registerUserSticker(int stickerId, int amount);
  Future<void> updateUserSticker(int stickerId, int amount);
}
