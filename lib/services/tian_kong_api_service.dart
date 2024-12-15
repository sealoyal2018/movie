// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:desktop/models/video.dart';
import 'package:dio/dio.dart';

class TianKongApiService {
  final Dio _dio = Dio();

  Future<HttpPageResult<Video>> getList(int typeId, [int pageIndex = 1]) async {
    final i = pageIndex;
    var params = {
      "ac": "detail",
      "t": typeId,
      "wd": '',
      "pg": '$i',
    };

    var res = await _dio.get('https://api.tiankongapi.com/api.php/provide/vod/',
        queryParameters: params);
    var json = jsonDecode(res.data) as Map<String, dynamic>;
    // final json = res.extra;
    final code = json['code'];
    final msg = json['msg'];
    final pagecount = json['pagecount'];
    final limit = int.parse(json['limit']);
    final total = json['total'];
    final list = json['list'];
    final page = int.parse(json['page']);
    var videoDetails = <Video>[];
    if (total > 0) {
      for (final i in list) {
        final item = Video.fromJson(i);
        videoDetails.add(item);
      }
    }

    return HttpPageResult(
        code: code,
        msg: msg,
        page: page,
        pagecount: pagecount,
        limit: limit,
        total: total,
        list: videoDetails);
  }
}

class HttpPageResult<T> {
  final int code;
  final String msg;
  final int page;
  final int pagecount;
  final int limit;
  final int total;
  final List<T> list;

  HttpPageResult(
      {required this.code,
      required this.msg,
      required this.page,
      required this.pagecount,
      required this.limit,
      required this.total,
      required this.list});
}
