import 'package:fifa_world_cup_2022/app/pages/auth/register/presenter/register_presenter_impl.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'presenter/register_presenter.dart';

class RegisterRoute extends FlutterGetItPageRoute {
  const RegisterRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RegisterPresenter>(
          (i) => RegisterPresenterImpl(authRepository: i()),
        ),
      ];

  @override
  WidgetBuilder get page => (context) => RegisterPage(presenter: context.get());
}
