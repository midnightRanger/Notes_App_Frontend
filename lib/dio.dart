import 'package:dart_interface/interceptor/AuthInterceptor.dart';
import 'package:dio/dio.dart';

import 'domain/models/ModelResponse.dart';
import 'domain/models/user.dart';

class Dio_Client {
  final Dio _dio = Dio(BaseOptions(
      connectTimeout: 3500, receiveTimeout: 3500, sendTimeout: 3500));

  void dioInterceptorInitialize() {
    _dio.interceptors.add(AuthInterceptor());
  }

  final _baseUrl = "http://localhost:5781/";

  Future<User?> getProfile({required String id}) async {
    User? user;
    try {
      _dio.options.headers['Authorization'] = 'Bearer token';

      Response userData = await _dio.get(_baseUrl + 'user');

      print('User info: ${userData.data}');

      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    return user;
  }

  Future<ModelResponse?> authUser({required User user}) async {
    ModelResponse? retrievedUser;
    User? encodedUser;
    Response? response;

    try {
      response = await _dio.post(_baseUrl + 'token',
          data: user.toJson(),
          options: Options(receiveDataWhenStatusError: true));
      retrievedUser = ModelResponse.fromJson(response.data);

      encodedUser = User.fromJson(retrievedUser.data);
      _dio.options.headers['Authorization'] =
          'Bearer ${encodedUser?.accessToken}';

      print('[Auth] : ${response.data}');

      return retrievedUser;
    } catch (e) {
      print(e);
      null;
    }
  }
}
