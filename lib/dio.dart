import 'package:dart_interface/user.dart';
import 'package:dio/dio.dart';

class Dio_Client {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'localhost:5781/',
      connectTimeout: 3500,
      receiveTimeout: 3500, 
      sendTimeout: 3500
      )
  );

  final _baseUrl = "localhost:5781/";

  Future<User> getProfile({required String id}) async {
    _dio.options.headers['Authorization'] = 'Bearer token'; 

    Response userData = await _dio.get(_baseUrl + 'user');
  

    print('User info: ${userData.data}');

    User user = User.fromJson(userData.data);

    return user; 

  }  
}