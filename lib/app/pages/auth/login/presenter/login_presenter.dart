import 'package:fifa_world_cup_2022/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/login/view/login_view.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView> {
  Future<void> login(String email, String password);
}
