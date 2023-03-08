import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rewind_api_2/app/modules/shared/color_schemes/color_scheme.dart';
import 'package:rewind_api_2/app/modules/shared/text_styles/text_style.dart';
import 'package:rewind_api_2/app/routes/app_pages.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'StarNews',
            style: headline1,
          ),
        ),
      ),
      body: Obx(() => controller.isLoading.value
          ? SkeletonListView()
          : ListView.builder(
            itemCount: controller.listNews.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black54,
                          offset: Offset(0.0, 0.75)
                        )
                      ]),
                  padding: EdgeInsets.only(
                      left: 19, right: 8, top: 26, bottom: 16),
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.DETAIL_ARTICLE,
                        arguments: {
                          'id': controller.listNews[index].id.toString()
                        }),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                          controller.listNews[index].title.toString(),
                          style: headline2),
                    ),
                    subtitle: Text(
                      controller.listNews[index].body.toString(),
                      style:
                          headline3.copyWith(fontWeight: FontWeight.w400),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      textAlign: TextAlign.justify
                    ),
                  ),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: () => Get.toNamed(Routes.POST_ARTICLE),
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
