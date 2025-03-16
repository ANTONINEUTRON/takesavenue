import 'package:dio/dio.dart';
import 'package:takesavenue/utils/app_constants.dart';

class TakeRepository {
  final _dio = Dio();

  Future<void> saveTake({
    required String userId,
    required String responder,
    required String title,
    required String contenttype,
    required String punishment,
    required String content,
    required int duration,
  }) async {
    try {
      var response = await _dio.post(
        AppConstants.takesUrl,
        data: {
          'userId': userId,
          'responder': responder,
          'title': title,
          'contenttype': contenttype,
          'punishment': punishment,
          'content': content,
          'duration': duration,
        },
      );

      
    } catch (e) {
      print(e);
      throw Exception('Failed to save take');
    }
  }
}
