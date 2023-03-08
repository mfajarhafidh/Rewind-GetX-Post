import 'package:get/get.dart';

import '../controllers/post_article_controller.dart';

class PostArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostArticleController>(
      () => PostArticleController(),
    );
  }
}
