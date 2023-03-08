import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rewind_api_2/app/modules/shared/color_schemes/color_scheme.dart';
import 'package:rewind_api_2/app/modules/shared/text_styles/text_style.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Detail News', style: headline1),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        body: Obx(() => Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
              child: Container(
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
                padding:
                    EdgeInsets.only(left: 19, right: 8, top: 26, bottom: 16),
                child: controller.isLoading.value
                    ? SkeletonListTile()
                    : ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Text(
                            controller.detailNews.value.title.toString(),
                            style: headline2,
                          ),
                        ),
                        subtitle: Text(
                          controller.detailNews.value.body.toString(),
                          style:
                              headline3.copyWith(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                      ),
              ),
            )));
  }
}
