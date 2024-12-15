import 'package:desktop/controllers/video_controller.dart';
import 'package:desktop/models/video.dart';
import 'package:desktop/services/tian_kong_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_pagination/number_pagination.dart';

class VideoListScreen extends StatelessWidget {
  final int typeId;
  VideoController videoController = Get.find();
  final ValueChanged<Video> onTap;
  var i = 1.obs;
  VideoListScreen({super.key, required this.typeId, required this.onTap});

  Future<HttpPageResult<Video>> fetchData() async {
    var page = await videoController.getList(typeId, i.value);
    return page;
  }

  Widget buildVideo(BuildContext context, Video video) {
    return GestureDetector(
      child: SizedBox(
        width: 285,
        height: 230,
        child: Card(
          elevation: 6,
          color: Theme.of(context).cardColor,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  video.getPicUrl(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) {
                    return Image.asset(
                      'assets/images/no_pic.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          '${video.vodName}',
                          maxLines: 1,
                          // "【莱斯利】漫威蜘蛛侠2最高难度丨决战蜥蜴博士-第12期",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              wordSpacing: 1.0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '最新更新时间:2024-12-13 20:24:02',
                        // '最新更新时间:${video.vodTime}',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color.fromRGBO(96, 98, 102, 1)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        onTap(video);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return FutureBuilder<HttpPageResult<Video>>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              var pageResult = snapshot.data as HttpPageResult<Video>;
              var num = pageResult.list.length;
              return Column(
                children: [
                  Expanded(
                      child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: num,
                    itemBuilder: (context, index) {
                      return buildVideo(context, pageResult.list[index]);
                    },
                  )),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: NumberPagination(
                        fontSize: 13,
                        selectedButtonColor: Color.fromRGBO(82, 76, 243, 1),
                        controlButtonColor: Colors.transparent,
                        unSelectedButtonColor: Colors.transparent,
                        unSelectedNumberColor: Colors.black,
                        buttonSelectedBorderColor: Colors.transparent,
                        buttonUnSelectedBorderColor: Colors.transparent,
                        enableInteraction: false,
                        onPageChanged: (num) {
                          i.value = num;
                        },
                        totalPages: pageResult.pagecount,
                        currentPage: pageResult.page),
                  )
                ],
              );
            }
          } else {
            // 请求未结束，显示loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    });
  }
}
