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

  Future<User?> getProfile({required String token}) async {
    User? encodedUser;
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';

      Response rawResponse = await _dio.get(_baseUrl + 'user');

      print('User info: ${rawResponse.data}');

      ModelResponse? modelResponse = ModelResponse.fromJson(rawResponse.data); 
      encodedUser = User.fromJson(modelResponse.data); 

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

    return encodedUser;
  }

    Future<User?> getNotes({required String token}) async {
    User? encodedUser;
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';

      Response rawResponse = await _dio.get(_baseUrl + 'post');

      print('Posts: ${rawResponse.data}');

      ModelResponse? modelResponse = ModelResponse.fromJson(rawResponse.data); 
      encodedUser = User.fromJson(modelResponse.data); 

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

    return encodedUser;
  }

  Future<String?> updateProfile({required String token, required User user,
   required String newPassword, required String oldPassword }) async {
    User? encodedUser;

    ModelResponse? modelProfileResponse;
    ModelResponse? modelPasswordResponse;

    try {
      _dio.options.headers['Authorization'] = 'Bearer ${token}';

      Response updateProfileResponse = await _dio.post(
        _baseUrl + 'user',
        data: user.toJson(),
        options: Options(receiveDataWhenStatusError: true));

      modelProfileResponse = ModelResponse.fromJson(updateProfileResponse.data); 
      encodedUser = User.fromJson(modelProfileResponse.data); 

      Response updatePasswordResponse = await _dio.put(
        _baseUrl + 'user', 
        options: Options(receiveDataWhenStatusError: true),
        queryParameters: {'newPassword': newPassword, 'oldPassword': oldPassword,  }
      );

       modelPasswordResponse = ModelResponse.fromJson(updatePasswordResponse.data);


    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');

        
        
        return "Information: ${ModelResponse.fromJson(e.response!.data).message}"; 
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        return "Information: ${e.message}";
      }
    }

    return "Information: ${modelProfileResponse.message}, ${modelPasswordResponse.data}";
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
          'Bearer ${encodedUser.accessToken}';

      print('[Auth] : ${response.data}');

      return retrievedUser;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');     
        
        return ModelResponse.fromJson(e.response!.data); 
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        return null; 
      }
    }
  }
} 