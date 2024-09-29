import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/share_dialog/bindings/share_dialog_binding.dart';
import '../modules/share_dialog/views/share_dialog_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SHARE_DIALOG;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SHARE_DIALOG,
      page: () => const ShareDialogView(),
      binding: ShareDialogBinding(),
    ),
  ];
}
