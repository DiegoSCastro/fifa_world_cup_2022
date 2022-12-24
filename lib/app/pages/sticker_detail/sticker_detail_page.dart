import 'package:fifa_world_cup_2022/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:flutter/material.dart';

import '../../core/ui/styles/app_button_styles.dart';
import '../../core/ui/styles/app_text_styles.dart';
import '../../core/ui/widgets/button.dart';
import '../../core/ui/widgets/rounded_button.dart';
import 'view/sticker_detail_view_impl.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;
  const StickerDetailPage({super.key, required this.presenter});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                hasSticker ? 'assets/images/sticker.png' : 'assets/images/sticker_pb.png',
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '$countryCode $stickerNumber',
                      style: context.textStyles.textPrimaryFontBold.copyWith(fontSize: 22),
                    ),
                  ),
                  const Spacer(),
                  RoundedButton(
                    icon: Icons.remove,
                    onPressed: widget.presenter.decrementAmount,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '$amount',
                      style: context.textStyles.textSecondaryFontMedium,
                    ),
                  ),
                  RoundedButton(
                    icon: Icons.add,
                    onPressed: widget.presenter.incrementAmount,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  countryName,
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              Button.primary(
                label: '${hasSticker ? 'Atualizar' : 'Adicionar'} figurinha',
                onPressed: widget.presenter.saveSticker,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Button(
                label: 'Excluir figurinha',
                onPressed: widget.presenter.deleteSticker,
                width: MediaQuery.of(context).size.width * 0.9,
                outlined: true,
                style: context.buttonStyles.primaryOutlinedButton,
                labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
