import 'package:get/get.dart';

class Initializer {
  static Future init() async{
    _initGetConnect();
  }

  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    connect.baseUrl = 'https://jsonplaceholder.typicode.com/';
    Get.put(connect);
  }
}
