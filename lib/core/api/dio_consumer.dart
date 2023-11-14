import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/api_interceptor.dart';
import 'package:quotes/core/api/end_point.dart';
import 'package:quotes/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndPoint.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < 500;
      };
    client.interceptors.add(di.sl<ApiInterceptors>());
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParam}) async {
    final response = await client.get(path, queryParameters: queryParam);
    return _handle(response);
  }
}

dynamic _handle(Response<dynamic> response) {
  return jsonDecode(
    response.data.toString(),
  );
}
