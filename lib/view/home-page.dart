import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/controller/dataView_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  Map<IconData, String> iconList = {
    Icons.home_filled: 'Ana Sayfa',
    Icons.notifications: 'Bildirimler',
    Icons.message: 'Sohbet',
    Icons.widgets: 'İlanlarım'
  };
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
          title: Text('LetGo'),
          actions: [
            TextButton(
                onPressed: null,
                child: Text('Filtreler',
                    style: TextStyle(fontSize: 16, color: Colors.redAccent)))
          ]),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            50,
            (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(color: Colors.grey),
                )),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white54,
        top: -20,
        curveSize: 60,
        activeColor: Colors.redAccent,
        color: Colors.grey,
        style: TabStyle.fixedCircle,

        items: [
          TabItem<Widget>(icon: Container(color:Colors.redAccent,child: Icon(Icons.home)), title: 'Ana Sayfa'),
          TabItem(icon: Icons.notifications, title: 'Bidirimler'),
          TabItem<Widget>(
              icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.photo_camera, color: Colors.white),
                    Text('Sat', style: TextStyle(color: Colors.white))
                  ]),
              title: 'Sat'),
          TabItem(icon: Icons.message, title: 'Sohbet'),
          TabItem(icon: Icons.widgets, title: 'İlanlarım'),
        ],
        initialActiveIndex: 2, //optional, default as 0
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
