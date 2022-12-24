import 'package:fifa_world_cup_2022/app/core/rest/custom_dio.dart';
import 'package:fifa_world_cup_2022/app/core/ui/global/global_context.dart';
import 'package:fifa_world_cup_2022/app/core/ui/global/global_context_impl.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/login/login_route.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/register/register_route.dart';
import 'package:fifa_world_cup_2022/app/pages/home/home_route.dart';
import 'package:fifa_world_cup_2022/app/pages/splash/splash_route.dart';
import 'package:fifa_world_cup_2022/app/pages/sticker_detail/sticker_detail_route.dart';
import 'package:fifa_world_cup_2022/app/repositories/auth/auth_repository.dart';
import 'package:fifa_world_cup_2022/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'core/ui/theme/theme_config.dart';
import 'pages/my_stickers/my_stickers_route.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>(
          (i) => GlobalContextImpl(
            navigatorKey: navigatorKey,
            authRepository: i(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album 2022',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => const HomeRoute(),
          '/my-stickers': (_) => const MyStickersRoute(),
          '/sticker-detail': (_) => const StickerDetailRoute(),
        },
      ),
    );
  }
}
