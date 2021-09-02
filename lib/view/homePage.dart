import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';
import 'package:letgo_clone_project/controller/product_controller.dart';
import 'package:letgo_clone_project/view/productPage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  ProductController prc = Get.put(ProductController());
  DataViewController dvc = Get.put(DataViewController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        if (prc.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return productGridview();
      }),
    );
  }

  GridView productGridview() {
    return GridView.count(
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
            prc.productList.length,
            (index) => InkWell(
                  onTap: () => Get.to(() => ProductView(index: index)),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 5,
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset('assets/laptop.jpg',
                                          fit: BoxFit.cover),
                                      IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.favorite))
                                    ])),
                            Expanded(
                                child: Text(
                                    prc.productList[index].productPrice
                                            .toString() +
                                        ' TL',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)))
                          ])),
                )));
  }
}
