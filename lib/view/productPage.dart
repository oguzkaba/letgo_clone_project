import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';
import 'package:letgo_clone_project/controller/product_controller.dart';
import 'package:letgo_clone_project/view/widgets/swiper_widget.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// ignore: must_be_immutable
class ProductView extends StatelessWidget {
  final int? index;
  ProductView({Key? key, this.index}) : super(key: key);

  ProductController prc = Get.find();
  DataViewController dvc = Get.put(DataViewController());

  @override
  Widget build(BuildContext context) {
    String dfString = '';
    initializeDateFormatting('tr');
    var productDate = DateFormat.yMMMd('en_US')
        .add_jm()
        .parse(prc.productList[index!].productDate.toString());
    final difference = DateTime.now().difference(productDate);

    String differenceDateCalc() {
      if (difference.inDays > 30) {
        dfString = (difference.inDays / 30).round().toString() + '+ Ay Önce';
      } else if (difference.inHours > 24) {
        dfString = (difference.inHours / 24).round().toString() + '+ Gün Önce';
      } else if (difference.inMinutes > 60) {
        dfString =
            (difference.inMinutes / 60).round().toString() + '+ Saat Önce';
      } else if (difference.inSeconds > 60) {
        dfString =
            (difference.inSeconds / 60).round().toString() + '+ Dakika Önce';
      }
      return dfString;
    }

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: Get.height * .5,
                child: SwiperWidget(
                    imgList: dvc.imgList,
                    imageHeight: Get.height * .5,
                    fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          prc.productList[index!].productPrice.toString() +
                              ' TL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite, color: Colors.grey))
                    ],
                  ),
                  Text(prc.productList[index!].productTitle.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(differenceDateCalc(),
                            style: TextStyle(fontSize: 16)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility, color: Colors.grey))
                    ],
                  ),
                  Text(prc.productList[index!].productDetails.toString(),
                      style: TextStyle(fontSize: 16)),
                  Text(
                      'Durum: ' +
                          prc.productList[index!].productState.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
