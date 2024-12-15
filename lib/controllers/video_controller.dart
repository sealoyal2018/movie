import 'package:desktop/models/video.dart';
import 'package:desktop/services/tian_kong_api_service.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  final _apiService = TianKongApiService();

  Future<HttpPageResult<Video>> getList(int typeId, [int page = 1]) async {
    return _apiService.getList(typeId, page);
  }
}
