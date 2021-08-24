import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';
import 'package:letgo_clone_project/view/widgets/swiper_widget.dart';

// ignore: must_be_immutable
class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);

  DataViewController dvc = Get.put(DataViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: Get.height * .5,
          child: SwiperWidget(
              imgList: dvc.imgList,
              imageHeight: Get.height * .5,
              fit: BoxFit.fitHeight),
        ),
      )),
    );
  }
}
