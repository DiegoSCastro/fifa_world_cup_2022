import '../../../models/group_stickers.dart';

abstract class MyStickersView {
  void loadPage(List<GroupStickers> album);
  void error(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupStickers> album);
  void showLoader();
}
