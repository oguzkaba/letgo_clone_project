import 'package:flutter/material.dart';
import 'package:letgo_clone_project/view/chatPage.dart';
import 'package:letgo_clone_project/view/homePage.dart';
import 'package:letgo_clone_project/view/myadsPage.dart';
import 'package:letgo_clone_project/view/notificationPage.dart';

class Global {
  static const Map<int, dynamic> gridItemList = {
    0: [Color(0xFF58D89F), 'Elektronik', Icons.phone_android],
    1: [Color(0xFFA26596), 'Oyun', Icons.videogame_asset],
    2: [Color(0xFFFFBF00), 'Ev Eşyaları', Icons.chair],
    3: [Color(0xFF1164B4), 'Araba', Icons.directions_car],
    4: [Color(0xFFFF5800), 'Diğer Araçlar', Icons.moped],
    5: [Color(0xFF009F6B), 'Araç Parçaları', Icons.panorama_photosphere_select],
    6: [Color(0xFF848482), 'Bahçe ve Hırdavat', Icons.handyman],
    7: [Color(0xFF7dc072), 'Spor ve Outdoor', Icons.sports_basketball],
    8: [Color(0xFFFC6C85), 'Moda ve Aksesuar', Icons.dry_cleaning],
    9: [Color(0xFF89CFF0), 'Bebek ve Çocuk', Icons.child_friendly],
    10: [Color(0xFFD982B5), 'Film,Kitap ve Müzik', Icons.headset],
    11: [Color(0xFFD4AF37), 'Diğer', Icons.scanner]
  };

  final List<Widget> pages = [
    HomePage(),
    NotificationPage(),
    ChatPage(),
    MyAdsPage()
  ];
}
