import 'package:get/get.dart';
import 'package:rewind_api_2/app/modules/home/models/list_article_model.dart';

class ListArticleService{
  final _connect = Get.find<GetConnect>();

  Future<List<ListNewsModel>> getListArticleService() async{
    final response = await _connect.get('posts', 
    decoder: (data) => List<ListNewsModel>.from(data.map((x) => ListNewsModel.fromJson(x))));
    if(!response.hasError){
      return response.body!;
    } else{
      throw Get.snackbar("Error", response.statusCode.toString());
    }
  }
}