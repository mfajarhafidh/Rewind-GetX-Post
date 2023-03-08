import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Initializer {
  static Future init() async{
    try{
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
      _initGetConnect();
    } catch(e){
      rethrow;
    }
  }

  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    connect.baseUrl = 'https://jsonplaceholder.typicode.com/';
    Get.put(connect);
  }
}
