import 'package:get/get.dart';
import 'package:rewind_api_2/app/modules/detail_article/models/detail_article_model.dart';
import 'package:rewind_api_2/app/modules/detail_article/services/detail_article_service.dart';

class DetailArticleController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<NewsModel> detailNews = NewsModel().obs;
  String id = '';

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    getDetailArticle();
  }

  Future<void> getDetailArticle() async{
    isLoading.toggle();
    try{
      final response = await DetailArticleService().detailArticleService(id: id);
      detailNews(response);
      isLoading.toggle();
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
