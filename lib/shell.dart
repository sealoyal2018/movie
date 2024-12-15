import 'package:desktop/controllers/nav_controller.dart';
import 'package:desktop/screens/video_screen.dart';
import 'package:desktop/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  final NavController _navController = Get.find();
  List<VideoScreen> _videoScreens = [];
  @override
  void initState() {
    _videoScreens.addAll([
      VideoScreen(typeId: 6),
      VideoScreen(typeId: 3),
      VideoScreen(typeId: 31),
      VideoScreen(typeId: 25),
      VideoScreen(typeId: 37),
      VideoScreen(typeId: 42),
      VideoScreen(typeId: 44),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 180,
          child: SideMenu(),
        ),
        // VerticalDivider(),
        Expanded(
            child: ColoredBox(
          color: Color.fromRGBO(247, 249, 250, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: PageView(
                  controller: _navController.pageController,
                  onPageChanged: (i) {
                    debugPrint(
                        'i >>> $i, pageIndex>>>${_navController.pageIndex}');
                    debugPrint(
                        '_videoScreens.lenght >>> ${_videoScreens.length}');
                    _videoScreens[_navController.pageIndex.value].deactive();
                  },
                  children: _videoScreens,
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
