import 'package:desktop/controllers/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 40.0,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '即时影视',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              )
            ],
          ),
        ),
        Expanded(child: Obx(() {
          return ListView(
            children: [
              buildNavItem(0, Icons.movie_outlined, '电影'),
              buildNavItem(1, Icons.tv, '连续剧'),
              buildNavItem(2, Icons.category_rounded, '动漫'),
              buildNavItem(3, Icons.verified_outlined, '综艺'),
              buildNavItem(4, Icons.nature_rounded, '电影解说'),
              buildNavItem(5, Icons.games_outlined, '体育赛事'),
            ],
          );
        }))
      ],
    );
  }

  Padding buildNavItem(int index, IconData icon, String title) {
    final selectedIndex = navController.pageIndex;
    return Padding(
      padding: EdgeInsets.only(left: 12, top: 8, right: 4),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        selected: selectedIndex.value == index,
        selectedColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        selectedTileColor: Color.fromRGBO(92, 63, 245, 1),
        onTap: () {
          navController.pageIndexChanged(index);
        },
      ),
    );
  }
}
