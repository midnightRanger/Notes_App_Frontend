import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  @override 
  void onError(DioError error, ErrorInterceptorHandler handler) {
    super.onError(error, handler);
  }

  @override 
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
    super.onRequest(options, handler);
  }

  @override 
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

}