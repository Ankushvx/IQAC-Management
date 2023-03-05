import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portfilioapp/constants/apiconstants.dart';
import 'package:portfilioapp/utils/api_response.dart';

class HttpUtils {
  static final _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.BASE_URL,
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
  ));

  static String _getToken() {
    return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJBTktVU0ggVkVSTUEiLCJlbWFpbCI6IiIsIlVzZXJJZCI6IjIyNTA5IiwiZXhwIjoxNjc2OTEyNjY1LCJpc3MiOiJUZXN0LmNvbSIsImF1ZCI6IlRlc3QuY29tIn0.05Kgf94KFpCTWKbuKw28510sFC_j168bo7BWBQ3DsRs";
  }

  static Future<ApiResponse?> postRequest(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(url,
          data: body,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer ${_getToken()}",
            },
          ));

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<ApiResponse?> getRequest(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: "Bearer ${_getToken()}",
            },
          ));

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
