import 'package:dio/dio.dart';

class ApiInterceptors implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  options.headers["content-type"]="application/json";
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
  }
}
