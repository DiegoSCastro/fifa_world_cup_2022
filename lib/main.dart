import 'package:fifa_world_cup_2022/app/fwc_album_app.dart';
import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';

void main() async {
  await Env.i.load();
  runApp(FwcAlbumApp());
}
