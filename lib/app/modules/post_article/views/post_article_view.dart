import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:rewind_api_2/app/modules/shared/color_schemes/color_scheme.dart';
import 'package:rewind_api_2/app/modules/shared/text_styles/text_style.dart';

import '../controllers/post_article_controller.dart';

class PostArticleView extends GetView<PostArticleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('StarNews', style: headline1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: IconButton(onPressed: ()=>Get.back(), 
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Text("Judul", style: headline3,),
            Gap(10),
            TextField(
              style: headline2,
              controller: controller.title,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: backgroundColor
              ),
              onSubmitted: (value) => controller.changeFocus(),
            ),
            Gap(25),
            Text("Content Article", style: headline3,),
            Gap(10),
            TextField(
              style: headline3.copyWith(fontWeight: FontWeight.w400),
              controller: controller.desc,
              focusNode: controller.nodeTwo,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: backgroundColor
              ),
              maxLines: 10,
            ),
            Gap(100),
            GestureDetector(
              onTap: () => controller.isLoading.value ? null : controller.postArticleControlelr(),
              child: Container(
                height: 57,
                width: 301,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: backgroundColor
                ),
                child: controller.isLoading.value
                ? CircularProgressIndicator()
                : Center(child: Text("Post", style: headline1.copyWith(fontWeight: FontWeight.w700),)),
              ),
            )
          ],
        ),
      )
    );
  }
}
