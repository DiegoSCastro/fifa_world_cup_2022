import 'package:fifa_world_cup_2022/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
