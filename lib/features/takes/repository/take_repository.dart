import 'package:dio/dio.dart';
import 'package:takesavenue/utils/app_constants.dart';
import 'package:takesavenue/utils/models/take.dart';
import 'package:takesavenue/utils/models/user.dart';

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
      await _dio.post(
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

  Future<List<Take>> getFeedTakes() async {
    try {
      final response = await _dio.get(AppConstants.takesUrl);
      print(response);
      final List<Take> takes =
          ((response.data as Map<String, dynamic>)['takes'] as List)
              .map((take) => Take.fromJson(take))
              .toList();
      return takes;
    } catch (e) {
      print(e);
      throw Exception('Failed to get feed takes $e');
    }
  }

  Future<List<Take>> getUserTakes(String userId) async {
    try {
      final response = await _dio.post(
        AppConstants.userTakesUrl,
        data: {'id': userId},
      );
      final List<Take> takes =
          ((response.data as Map<String, dynamic>)['takes'] as List)
              .map((take) => Take.fromJson(take))
              .toList();
      return takes;
    } catch (e) {
      print(e);
      throw Exception('Failed to get user takes');
    }
  }

  Future<List<User>> fetchLeaderboard() async {
    try {
      final response = await _dio.get(AppConstants.leaderboardUrl);
      final List<User> users =
          ((response.data as Map<String, dynamic>)['users'] as List)
              .map((take) => User.fromJson(take))
              .toList();
      return users;
    } catch (e) {
      print(e);
      throw Exception('Failed to get leaderboar');
    }
  }
}
