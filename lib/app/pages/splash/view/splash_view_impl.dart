import 'package:fifa_world_cup_2022/app/pages/splash/splash_page.dart';
import 'package:fifa_world_cup_2022/app/pages/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/helpers/loader.dart';

abstract class SplashViewImpl extends State<SplashPage>
    with Loader<SplashPage>
    implements SplashView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void logged(bool isLogged) {
    hideLoader();
    if (isLogged) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/auth/login', (route) => false);
    }
  }
}
