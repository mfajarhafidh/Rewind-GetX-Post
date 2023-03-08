import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rewind_api_2/app/initializer.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async{
  await Initializer.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
