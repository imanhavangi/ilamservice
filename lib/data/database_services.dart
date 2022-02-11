import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class DatabaseServices {
  static Future<String> sms(
      {required String phoneNumber, String requestType = 'login'}) async {
    try {
      Dio dio = Dio();

      Map<String, String> params = {
        'mobile': phoneNumber,
      };
      Map<String, String> head = {
        'api_key': 'iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn',
      };
      dio.options = BaseOptions(
        headers: head,
        baseUrl: 'https://www.appbesaz.com/ilamservice/register/',
        method: 'POST',
        queryParameters: params,
      );
      final response = await dio.request('');
      // Map<String, dynamic> res = json.decode(response.data.toString());
      return response.data.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> sms2(
      {required String phoneNumber, String requestType = 'login'}) async {
    var r = await http.post(
      Uri.parse('https://www.appbesaz.com/ilamservice/register/'),
      headers: <String, String>{
        'apiKey': 'iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn'
      },
      body: jsonEncode({'mobile': '09215147902'}),
    );
    return r.body.toString();
  }
}
