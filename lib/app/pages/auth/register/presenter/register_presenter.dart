import 'package:fifa_world_cup_2022/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/register/view/register_view.dart';

abstract class RegisterPresenter extends FwcPresenter<RegisterView> {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
}
