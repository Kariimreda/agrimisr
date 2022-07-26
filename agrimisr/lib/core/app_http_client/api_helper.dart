import 'package:agrimisr/core/app_http_client/app_http_client_base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide Response;
import 'package:easy_localization/easy_localization.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
}

final Dio _dio = Dio(
  BaseOptions(
    baseUrl: 'https://www.',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ),
)..interceptors.add(Logging());

class DioClient {
  final client = AppHttpClient(
    client: _dio,
  );

  Future<Response?> request(
    HttpMethod method,
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
  }) async {
    // we can add headers here which are common for every restapi call
    // headers = {'content-type': 'application/json'};

    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      final response = await _dio.request(
        path,
        options: Options(
          method: _getApiMethodString(method),
          headers: headers,
        ),
        queryParameters: queryParams,
        data: body,
      );
      print(response.data);
      Get.back();
      return response;
    } on DioError catch (e) {
      //show somthing went wrong error
      Get.back();
      Get.dialog(
        AlertDialog(
          title: Text('Auth.Signup.Error'.tr()),
          content: Text('Cart.Error'.tr()),
        ),
      );
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;
  }

  String _getApiMethodString(HttpMethod method) {
    switch (method) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
    }
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
