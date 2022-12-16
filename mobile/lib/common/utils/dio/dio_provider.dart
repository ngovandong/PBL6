import 'package:dio/dio.dart';
import 'package:mobile/common/utils/dio/dio_interceptor.dart';

class HttpRequestResponse {
  final dynamic data;
  final int? statusCode;
  final String? statusMessage;

  HttpRequestResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}

abstract class DioProvider {
  static final Dio _dio = Dio()..interceptors.add(DioInterceptor());

  static Future<HttpRequestResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    final Response response = await _dio.get(
      endpoint,
      queryParameters: queryParams,
    );

    return HttpRequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  static Future<HttpRequestResponse> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final Response response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );

    return HttpRequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  static Future<HttpRequestResponse> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final Response response = await _dio.put(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );

    return HttpRequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  static Future<HttpRequestResponse> patch({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final Response response = await _dio.patch(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );

    return HttpRequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  static Future<HttpRequestResponse> delete(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final Response response = await _dio.delete(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );

    return HttpRequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  // static Future<HttpRequestResponse> download({
  //   required String url,
  //   String? savedPath,
  // }) async {
  //   final String fileName =
  //       RegExp(r'(?<=%2F)(.*)(?=\?alt=)').firstMatch(url)!.group(0)!;

  //   if (Platform.isAndroid) {
  //     savedPath ??= (await getExternalStorageDirectory())!.path;
  //   } else {
  //     savedPath ??= (await getApplicationDocumentsDirectory()).path;
  //   }

  //   final Response response =
  //       await _dio.download(url, join(savedPath, fileName));

  //   final HttpRequestResponse dataResponse = HttpRequestResponse(
  //     data: response.data,
  //     statusCode: response.statusCode,
  //     statusMessage: response.statusMessage,
  //   );

  //   return dataResponse;
  // }
}
