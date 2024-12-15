import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  final pageController = PageController();

  var pageIndex = 0.obs;

  void pageIndexChanged(int index) {
    pageController.jumpToPage(index);
    pageIndex.value = index;
  }
}
