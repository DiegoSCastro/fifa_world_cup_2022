import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../repositories/stickers/stickers_repository.dart';
import '../../repositories/stickers/stickers_repository_impl.dart';
import '../../services/sticker/find_sticker_service.dart';
import '../../services/sticker/find_sticker_service_impl.dart';
import 'presenter/sticker_detail_presenter.dart';
import 'presenter/sticker_detail_presenter_impl.dart';
import 'sticker_detail_page.dart';

class StickerDetailRoute extends FlutterGetItPageRoute {
  const StickerDetailRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>((i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<FindStickerService>(
            (i) => FindStickerServiceImpl(stickersRepository: i())),
        Bind.lazySingleton<StickerDetailPresenter>((i) => StickerDetailPresenterImpl(
              findStickerService: i(),
              stickersRepository: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => StickerDetailPage(presenter: context.get());
}
