import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';
import 'package:letgo_clone_project/model/globals.dart';
import 'package:letgo_clone_project/view/widgets/bottomSheet_widget.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  DataViewController dvc = Get.put(DataViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: CircleAvatar(
                  child: Icon(Icons.people, color: Colors.white, size: 20),
                  backgroundColor: Colors.redAccent),
            ),
            title: Text('LetGo Clone'),
            actions: [
              TextButton(
                  onPressed: null,
                  child: Text('Filtreler',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline)))
            ]),
        body: Obx(() => Global().pages[dvc.bottomNavIndex.value]),
        floatingActionButton: _floatAButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => _bottomBar()));
  }

  FloatingActionButton _floatAButton(context) {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.white,
        onPressed: () => BottomSheetWidget().showBottomSheet(context),
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
