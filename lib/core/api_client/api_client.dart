import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:teaching_app/core/api_client/api_result.dart';
import 'package:teaching_app/core/api_client/header_interceptor.dart';
import 'api_exception.dart';

typedef JsonMap = Map<String, dynamic>;

class ApiClient {
  static final ApiClient _instance = ApiClient.internal();
  static late Dio _dio;
  static ApiResult apiResult = ApiResult();

  ApiClient.internal() {
    _dio = Dio()
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(LogInterceptor(responseBody: true, logPrint: _log));
  }

  factory ApiClient() => _instance;

  final CancelToken _cancelToken = CancelToken();

  Future get(url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams}) async {
    try {
      url = url;
      Response response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future<dynamic> post(url,
      {FormData? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams}) async {
    try {
      url = url;
      Response response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
        // cancelToken: _cancelToken,
      );
      final data = response.data;
      if (data != null && data is String) {
        // Proceed with decoding if data is a string
        return jsonDecode(data);
      }
      return data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future update(
    String url, {
    JsonMap? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      url = url;
      Response response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future delete(
    String url, {
    required JsonMap body,
    Map<String, dynamic>? header,
  }) async {
    try {
      url = url;
      Response response = await _dio.delete(
        url,
        data: body,
        options: Options(headers: header),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future<Map<String, dynamic>> _handleError(String path, Object error) {
    if (error is DioError) {
      final method = error.requestOptions.method;
      final response = error.response;

      apiResult.setStatusCode(response?.statusCode);

      final data = response?.data;
      int? statusCode = response?.statusCode;
      if (statusCode == 401) {
      } else if (statusCode == 422) {
      } else {}

      if (error.type == DioErrorType.connectionTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        statusCode = HttpStatus
            .requestTimeout; //Set the error code to 408 in case of timeout
      }
      throw ApiException(
        errorMessage:
            response?.data != null ? (response?.data['success'] ?? '') : '',
        path: path,
        message: 'received server error $statusCode while $method data',
        response: data,
        statusCode: statusCode,
        method: method,
      );
    } else {
      int errorCode = 0; //We will send a default error code as 0

      throw ApiException(
        path: path,
        message: 'received server error $errorCode',
        response: error.toString(),
        statusCode: errorCode,
        method: '',
      );
    }
  }

  // ///Creates the url for different backend micro services
  // String _createApiUrl(String url, Backend? backend) {
  //   switch (backend) {
  //     case Backend.reporting:
  //       return url;
  //     default:
  //       return url;
  //   }
  // }

  void _log(Object object) {
    log("$object");
  }

  Future download(String url,
      {required String path,
      void Function(int, int)? onReceiveProgress}) async {
    try {
      await Dio().download(url, path,
          onReceiveProgress: onReceiveProgress,
          cancelToken: _cancelToken,
          options: Options(followRedirects: false));
    } catch (error) {
      return _handleError(url, error);
    }
  }
}
