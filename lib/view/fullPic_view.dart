import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';
import 'package:letgo_clone_project/view/widgets/swiper_widget.dart';

// ignore: must_be_immutable
class FullPictureView extends StatelessWidget {
  FullPictureView({Key? key, required this.initialIndex}) : super(key: key);
  final int? initialIndex;

  DataViewController dvc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        child: SwiperWidget(
            initialPic: initialIndex ?? 0,
            imgList: dvc.imgList,
            imageHeight: Get.height,
            fit: BoxFit.contain));
  }
}
