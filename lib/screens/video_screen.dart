import 'package:desktop/models/video.dart';
import 'package:desktop/screens/video_detail_screen.dart';
import 'package:desktop/screens/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class VideoScreen extends StatelessWidget {
  var isContent = false.obs;
  final int typeId;
  Video? _currentVideo;

  VideoScreen({super.key, required this.typeId});

  void onDetail(Video video) {
    isContent.value = true;
    _currentVideo = video;
  }

  void deactive() {
    isContent.value = false;
    _currentVideo = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Obx(() {
        return isContent.value
            ? VideoDetialScreen(video: _currentVideo!)
            : VideoListScreen(
                typeId: typeId,
                onTap: onDetail,
              );
      }),
    );
  }
}
