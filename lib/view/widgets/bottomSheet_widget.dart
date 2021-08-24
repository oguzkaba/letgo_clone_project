import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/model/globals.dart';

class BottomSheetWidget {
  void showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(15, 10),
              topRight: Radius.elliptical(15, 10))),
      isScrollControlled: true,
      elevation: 5,
      context: ctx,
      builder: (ctx) => Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            height: Get.height * .65,
            width: Get.width * .8,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.close_rounded)),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text('Ne Satıyorsun?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
              ]),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: GridView.count(
                    padding: EdgeInsets.only(top: 20),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 30,
                    crossAxisCount: 3,
                    children: List.generate(
                        12,
                        (index) => Container(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                      child: Icon(Global.gridItemList[index][2],
                                          color: Colors.white, size: 30),
                                      radius: 30,
                                      backgroundColor:
                                          Global.gridItemList[index][0]),
                                  Text(Global.gridItemList[index][1],
                                      textAlign: TextAlign.center)
                                ],
                              ),
                            )),
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
