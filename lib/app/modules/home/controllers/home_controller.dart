import 'package:get/get.dart';
import 'package:rewind_api_2/app/modules/home/models/list_article_model.dart';
import 'package:rewind_api_2/app/modules/home/services/list_article_service.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ListNewsModel> listNews = <ListNewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listNewsModelController();
  }

  Future<void> listNewsModelController() async{
    isLoading.toggle();
    try{
      final response = await ListArticleService().getListArticleService();
      final res = response.reversed;
      listNews.addAll(res);
      isLoading.toggle();
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
