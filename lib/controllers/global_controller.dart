import 'package:desktop/controllers/nav_controller.dart';
import 'package:desktop/controllers/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends Bindings {
  final pageController = PageController();

  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController());
    Get.lazyPut<VideoController>(() => VideoController());
  }
}
