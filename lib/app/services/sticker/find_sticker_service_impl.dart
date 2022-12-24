import 'package:fifa_world_cup_2022/app/models/register_sticker_model.dart';
import 'package:fifa_world_cup_2022/app/models/sticker_model.dart';
import 'package:fifa_world_cup_2022/app/repositories/stickers/stickers_repository.dart';
import 'package:fifa_world_cup_2022/app/services/sticker/find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
  final StickersRepository stickersRepository;

  FindStickerServiceImpl({required this.stickersRepository});

  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
    var sticker = await stickersRepository.findStickerByCode(countryCode, stickerNumber);
    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
        stickerName: '',
        stickerCode: countryCode,
        stickerNumber: stickerNumber,
      );
      sticker = await stickersRepository.create(registerSticker);
    }
    return sticker;
  }
}
