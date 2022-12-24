import 'package:fifa_world_cup_2022/app/core/ui/styles/app_button_styles.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_colors.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_text_styles.dart';
import 'package:fifa_world_cup_2022/app/pages/home/presenter/home_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/home/view/home_view_impl.dart';
import 'package:fifa_world_cup_2022/app/pages/home/widgets/status_tile.dart';
import 'package:fifa_world_cup_2022/app/pages/home/widgets/sticker_percent.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({
    super.key,
    required this.presenter,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 35),
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/bola.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      StickerPercent(percent: user?.totalCompletePercent ?? 0),
                      const SizedBox(height: 20),
                      Text(
                        '${user?.totalStickers ?? 0} figurinhas',
                        style: context.textStyles.titleWhite,
                      ),
                      const SizedBox(height: 20),
                      StatusTile(
                        iconAsset: 'assets/images/all_icon.png',
                        label: 'Todas',
                        value: user?.totalAlbum ?? 0,
                      ),
                      const SizedBox(height: 20),
                      StatusTile(
                        iconAsset: 'assets/images/missing_icon.png',
                        label: 'Faltando',
                        value: user?.totalComplete ?? 0,
                      ),
                      const SizedBox(height: 20),
                      StatusTile(
                        iconAsset: 'assets/images/repeated_icon.png',
                        label: 'Repetidas',
                        value: user?.totalDuplicates ?? 0,
                      ),
                      const SizedBox(height: 20),
                      Button(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/my-stickers');
                        },
                        width: MediaQuery.of(context).size.width * .9,
                        outlined: true,
                        style: context.buttonStyles.yellowOutlinedButton,
                        labelStyle: context.textStyles.textSecondaryFontExtraBold
                            .copyWith(color: context.colors.yellow),
                        label: 'Minhas figurinhas',
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
