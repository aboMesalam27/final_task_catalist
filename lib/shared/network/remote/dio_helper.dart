import 'package:dio/dio.dart';
import 'package:final_task_catalist/core/utils/constant.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static Dio? dio;

  static const _connectTimeout = Duration(milliseconds: 32000);
  static const _receiveTimeout = Duration(milliseconds: 32000);
  static const _sendTimeout = Duration(milliseconds: 32000);
  static const String _baseUrl = AppConstants.baseUrl;
  static const Map<String, String> _defaultHeaders = {
    "Content-Type": 'application/json'
  };
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      receiveDataWhenStatusError: true,
      headers: _defaultHeaders,
    ));
    if (!kReleaseMode) {
      dio!.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        if (kDebugMode) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
        }
        return handler.next(options); //continue
      }, onResponse: (Response response, ResponseInterceptorHandler handler) {
        if (kDebugMode) {
          print(
              'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        }
        return handler.next(response);
      }, onError: (DioError err, ErrorInterceptorHandler handler) {
        if (kDebugMode) {
          print(
              'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
        }

        return handler.reject(err);
      }));
    }
  }

  static Future<Response> postData({
    required String url,
    var data,
    Map<String, dynamic>? query,
    String? token,
    CancelToken? cancelToken,
    ProgressCallback? onRecivedProgress,
    ProgressCallback? onSendProgress,
  }) async {
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
      cancelToken: cancelToken,
      onReceiveProgress: onRecivedProgress,
      onSendProgress: onSendProgress,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    return await dio!.get(
      url,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }
}
