import 'package:dart_interface/user.dart';
import 'package:dio/dio.dart';

class Dio_Client {
  final Dio _dio = Dio();

  final _baseUrl = "localhost:5781/";

  Future<User> getProfile({required String id}) async {
    Response userData = await _dio.get(_baseUrl + 'user');

    print('User info: ${userData.data}');

    User user = User.fromJson(userData.data);

    return user; 

  }  
}