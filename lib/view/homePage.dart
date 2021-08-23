import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';
import 'package:letgo_clone_project/view/productPage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  DataViewController dvc = Get.put(DataViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  child: Icon(Icons.people, color: Colors.white),
                  radius: 10,
                  backgroundColor: Colors.redAccent),
            ),
            title: Text('LetGo Clone'),
            actions: [
              TextButton(
                  onPressed: null,
                  child: Text('Filtreler',
                      style: TextStyle(fontSize: 16, color: Colors.redAccent)))
            ]),
        body: _gridViewContent(),
        floatingActionButton: _floatAButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => _bottomBar()));
  }

  Padding _gridViewContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
            50,
            (index) => InkWell(
                  onTap: () => Get.to(() => ProductView()),
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                                child: Image.asset('assets/laptop.jpg',
                                    fit: BoxFit.cover))),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: Text('₺' + (index + 1000).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ))
                      ])),
                )),
      ),
    );
  }

  FloatingActionButton _floatAButton() {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.white,
        onPressed: () {},
        child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_camera),
                Text('Sat',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
              ],
            )));
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        currentIndex: dvc.bottomNavIndex.value,
        onTap: (index) => dvc.bottomNavIndex.value = index,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Anasayfa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Bildirimler'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Sohbet'),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'İlanlarım')
        ]);
  }
}
