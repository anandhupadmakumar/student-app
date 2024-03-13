
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/http/http_urls.dart';

import '../view/common_widgets/loader.dart';

class HttpRequest {
  static Future<Response> httpGetRequest(
      {Map<String, dynamic>? bodyData, String endPoint = ''}) async {
    if (kDebugMode) {
      print('get request ====> $endPoint $bodyData ');
    }

    final Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('trinity_token') ?? "";
    final response = await dio.get(
      '${HttpUrls.baseUrl}$endPoint',
      options: Options(headers: {
        'ngrok-skip-browser-warning': 'true',
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }),
      queryParameters: bodyData,
    );
    if (kDebugMode) {
      print('get result ====> $response  ');
    }
    return response;
  }

  static Future<Response?> httpPostRequest(
      {Map<String, dynamic>? bodyData, String endPoint = '',bool?isQuery=false}) async {
    if (kDebugMode) {
      print('post request ====> $endPoint $bodyData ');
    }
    final Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('trinity_token') ?? "";
    try {
      final Response response = await dio.post(
        '${HttpUrls.baseUrl}$endPoint',
        options: Options(headers: {
          'ngrok-skip-browser-warning': 'true',
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        queryParameters:isQuery==true?bodyData:null ,
        data: bodyData,
      );
      if (kDebugMode) {
        print('post result ====> ${response.data}  ');
      }
      return response;
    } catch (e) {
      Loader.stopLoader();
      return null;
    }
  }
}
