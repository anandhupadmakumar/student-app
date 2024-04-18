import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trinity/http/http_urls.dart';

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
    Loader.showLoader();
    final response = await dio.get(
      '${HttpUrls.baseUrl}$endPoint',
      options: Options(headers: {
        'ngrok-skip-browser-warning': 'true',
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }),
      queryParameters: bodyData,
    );

    if (response.data != null) {
      Loader.stopLoader();
    }

    if (kDebugMode) {
      print('get result ====> $response  ');
    }

    return response;
  }

  static Future<Response?> httpPostRequest(
      {Map<String, dynamic>? bodyData,
      String endPoint = '',
      bool? isQuery = false}) async {
    //
    if (kDebugMode) {
      print('post request ====> $endPoint $bodyData ');
    }
    final Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('trinity_token') ?? "";
    try {
      Loader.showLoader();
      final Response response = await dio.post(
        '${HttpUrls.baseUrl}$endPoint',
        options: Options(headers: {
          'ngrok-skip-browser-warning': 'true',
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        queryParameters: isQuery == true ? bodyData : null,
        data: bodyData,
      );
      if (kDebugMode) {
        print('post result ====> ${response.data}  ');
      }
      if (response.data != null) {
        Loader.stopLoader();
      }
      return response;
    } catch (e) {
      Loader.stopLoader();
      return null;
    }
  }
}
