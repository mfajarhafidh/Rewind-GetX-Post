import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:rewind_api_2/app/modules/post_article/services/post_article_service.dart';

class PostArticleController extends GetxController {
  RxBool isLoading = false.obs;
  FocusNode nodeTwo = FocusNode();

  void changeFocus(){
    nodeTwo.requestFocus();
  }

  final title = TextEditingController();
  final desc = TextEditingController();

  Future postArticleControlelr() async{
    isLoading.toggle();
    try{
      final response = await PostArticleService().postArticleService(title: title.text, desc: desc.text);
      Logger().d(response);
      Get.back();
      Get.snackbar("Success", "You have succesfully posted the Article!");
    } catch(e){
      isLoading.toggle();
      Get.snackbar("Failed", "Failed to post the Article!");
    }
  }
}
