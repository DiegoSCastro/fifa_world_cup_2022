import 'package:fifa_world_cup_2022/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/my_stickers/view/my_stickers_view.dart';

abstract class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);

  void refresh();
}
