import 'package:get/get.dart';

import 'package:rewind_api_2/app/modules/detail_article/bindings/detail_article_binding.dart';
import 'package:rewind_api_2/app/modules/detail_article/views/detail_article_view.dart';
import 'package:rewind_api_2/app/modules/home/bindings/home_binding.dart';
import 'package:rewind_api_2/app/modules/home/views/home_view.dart';
import 'package:rewind_api_2/app/modules/post_article/bindings/post_article_binding.dart';
import 'package:rewind_api_2/app/modules/post_article/views/post_article_view.dart';
import 'package:rewind_api_2/app/modules/splash/bindings/splash_binding.dart';
import 'package:rewind_api_2/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ARTICLE,
      page: () => DetailArticleView(),
      binding: DetailArticleBinding(),
    ),
    GetPage(
      name: _Paths.POST_ARTICLE,
      page: () => PostArticleView(),
      binding: PostArticleBinding(),
    ),
  ];
}
