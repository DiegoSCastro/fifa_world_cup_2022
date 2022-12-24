import 'package:fifa_world_cup_2022/app/pages/home/home_page.dart';
import 'package:fifa_world_cup_2022/app/pages/home/presenter/home_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/home/presenter/home_presenter_impl.dart';
import 'package:fifa_world_cup_2022/app/repositories/user/user_repository.dart';
import 'package:fifa_world_cup_2022/app/repositories/user/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRoute extends FlutterGetItPageRoute {
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
        Bind.lazySingleton<HomePresenter>((i) => HomePresenterImpl(userRepository: i())),
      ];

  @override
  WidgetBuilder get page => (context) => HomePage(
        presenter: context.get(),
      );
}
