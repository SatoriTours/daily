import 'package:get/get.dart';

import '../modules/articles/bindings/articles_binding.dart';
import '../modules/articles/views/articles_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/share_dialog/bindings/share_dialog_binding.dart';
import '../modules/share_dialog/views/share_dialog_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
      transition: Transition.leftToRight,
      transitionDuration: Duration(milliseconds: 200),
      reverseTransitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.ARTICLES,
      page: () => const ArticlesView(),
      binding: ArticlesBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
