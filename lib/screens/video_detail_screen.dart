import 'package:desktop/models/play_source.dart';
import 'package:desktop/models/video.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;

class VideoDetialScreen extends StatefulWidget {
  final Video video;

  const VideoDetialScreen({super.key, required this.video});

  @override
  State<VideoDetialScreen> createState() => _VideoDetialScreenState();
}

class _VideoDetialScreenState extends State<VideoDetialScreen> {
  Map<int, String> section = {};
  List<PlaySource> sources = [];
  final Dio _dio = Dio();
  String? desciption;
  Player? _player;
  mkv.VideoController? _controller;
  final _regex =
      RegExp(r'var\s+main\s*=\s*"(\/\d{8}\/[a-zA-Z0-9]+\/index\.m3u8)"');

  @override
  void initState() {
    super.initState();
    _player = Player(configuration: PlayerConfiguration());
    _controller = mkv.VideoController(_player!);

    var source = (widget.video.vodPlayFrom
            ?.split(widget.video.vodPlayNote ?? '')
            .toList() ??
        []);

    final list = widget.video.vodPlayUrl
            ?.split(widget.video.vodPlayNote ?? '')
            .toList() ??
        [];

    desciption = widget.video.vodContent?.replaceFirst('<p>', '');
    desciption = desciption?.replaceFirst('</p>', '');
    desciption = desciption?.trim();
    desciption ??= '暂无简介';

    sources.addAll(source.asMap().entries.map((v) {
      final str = list[v.key];
      final section = <String, String>{};
      str.split('#').asMap().entries.forEach((ele) {
        final arr = ele.value.split('\$');
        if (arr.isEmpty) {
          section["${ele.key}"] = ele.value;
        } else {
          section[arr[0]] = arr[1];
        }
      });
      return PlaySource(title: v.value, section: section);
    }));
    sources.sort((i, v) {
      return i.title.compareTo(v.title);
    });
    final firstSource = sources.firstOrNull;
    if (firstSource != null && firstSource.section.isNotEmpty) {
      final key = firstSource.section.keys.first;
      final url = firstSource.section[key];
      if (url != null && url.isNotEmpty) {
        _player!.open(Media(url));
      }
    }
  }

  Future<String> getM3u8Url(String url) async {
    if (url.endsWith('.m3u8')) {
      return url;
    }

    final uri = Uri.parse(url);
    final resp = await _dio.get(url);
    if (resp.statusCode == 200) {
      final html = resp.data.toString();
      // 正则表达式提取目标字符串
      final match = _regex.firstMatch(html);
      if (match != null) {
        // 提取到的结果
        String result = match.group(1) ?? '';
        return '${uri.scheme}://${uri.host}$result';
      }
    }
    return url;
  }

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Colors.white),
      padding: EdgeInsets.all(30),
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 600,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13))),
            child: AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: mkv.Video(
                aspectRatio: 16 / 9,
                controller: _controller!,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${widget.video.vodName}',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(desciption!),
          DefaultTabController(
            length: sources.length,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: sources.length * 85,
                  child: TabBar(
                    tabs: [..._buildTabs()],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 800,
                  child: TabBarView(
                      children: sources.map((ele) {
                    return GridView.builder(
                        itemCount: ele.section.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 15),
                        itemBuilder: (cxt, i) {
                          return SizedBox(
                              height: 10,
                              width: 10,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: MaterialButton(
                                    color: Color.fromRGBO(82, 76, 243, 1),
                                    splashColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0))),
                                    onPressed: () async {
                                      final key = ele.section.keys.toList()[i];
                                      final u = ele.section[key];
                                      debugPrint('key = $key');
                                      debugPrint('u = $u');
                                      if (u != null && u.isNotEmpty) {
                                        final url = await getM3u8Url(u);
                                        debugPrint('url = $url');
                                        _controller?.player.open(Media(url));
                                      }
                                    },
                                    child: Text('${i + 1}')),
                              ));
                        });
                  }).toList()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Tab> _buildTabs() {
    return sources.map((item) {
      return Tab(
        text: item.title,
      );
    }).toList();
  }
}
