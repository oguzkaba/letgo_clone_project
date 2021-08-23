import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/view/fullPic_view.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget(
      {Key? key,
      required this.imageHeight,
      required this.imgList,
      required this.fit,
      this.initialPic})
      : super(key: key);
  final BoxFit? fit;
  final double? imageHeight;
  final List<String> imgList;
  final int? initialPic;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      onTap: (index) => Get.to(() => FullPictureView(initialIndex: index)),
      viewportFraction: 1,
      itemCount: imgList.length,
      itemBuilder: (context, index) {
        return Image.network(
          imgList[index],
          height: imageHeight,
          fit: fit,
        );
      },
      index: initialPic ?? 0,
      pagination: SwiperPagination(
        alignment: Alignment.bottomRight,
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: Colors.white,
        ),
      ),
    );
  }
}
