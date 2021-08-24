import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';
import 'package:letgo_clone_project/controller/service.dart';
import 'package:letgo_clone_project/model/product_model.dart';
import 'package:letgo_clone_project/view/productPage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Service apiMng = Service();

  DataViewController dvc = Get.put(DataViewController());

  @override
  Widget build(BuildContext context) {
    Future<List<ProductModel>> _future;
    _future = apiMng.fetchData();
    return FutureBuilder<List<ProductModel>>(
        future: _future,
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          ///snapshot = o an gelen değer
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(
                    snapshot.data!.length,
                    (index) => InkWell(
                          onTap: () => Get.to(() => ProductView()),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                            child: Image.asset(
                                                'assets/laptop.jpg',
                                                fit: BoxFit.cover))),
                                    Expanded(
                                        child: Center(
                                      child: Text(
                                          snapshot.data![index].productPrice
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ))
                                  ])),
                        )),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
