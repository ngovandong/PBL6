import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/common/constants/env_keys.dart';
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

  static Future<HttpRequestResponse> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    final String endpoint = '${dotenv.env[EnvKeys.apiUrl]}$url';

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

  static Future<HttpRequestResponse> post({
    required String url,
    Map<String, dynamic>? formBody,
    Map<String, dynamic>? queryParams,
  }) async {
    final String endpoint = '${dotenv.env['API_URL']}$url';

    final Response response = await _dio.post(
      endpoint,
      data: formBody,
      queryParameters: queryParams,
    );

    return HttpRequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  static Future<dynamic> patch({
    required String url,
    Map<String, dynamic>? formBody,
    Map<String, dynamic>? queryParams,
  }) async {
    final String endpoint = '${dotenv.env['API_URL']}$url}';
    final Response response = await _dio.patch(endpoint, data: formBody);
    return response.data;
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
