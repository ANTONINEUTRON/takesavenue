import 'package:dio/dio.dart';
import 'package:takesavenue/utils/models/user.dart';
import 'package:takesavenue/utils/app_constants.dart';

class AuthRepository {
  final dio = Dio();

  Future<void> hello() async {
    final _url = "${AppConstants.baseUrl}hello";
    var response = await dio.get(_url);
    print(response.data);
  }

  Future<User> createUserRecord({required User user}) async {
    final userData = {
      'email': user.email,
      'username': user.username,
      'id': user.id,
    };

    try {
      var response = await dio.post(AppConstants.userUrl, data: userData);
      
      var mapOfUser = (response.data as Map<String, dynamic>)["user"];
      return User.fromJson(mapOfUser);
    } catch (e) {
      print(e);
      throw Exception('Failed to create user record: $e');
    }
  }

  Future<User> getUserRecord({required String id}) async{
    try {
      var response = await dio.post("${AppConstants.loginUrl}", data: {"userId": id});

      print((response.data as Map<String, dynamic>)["user"]);
      var mapOfUser = (response.data as Map<String, dynamic>)["user"];
      return User.fromJson(mapOfUser);
    } catch (e) {
      print(e);
      throw Exception('Failed to get user record: $e');
    }
  }
}
