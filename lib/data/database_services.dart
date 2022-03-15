import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:io';
// import 'package:ably_flutter/ably_flutter.dart' as ably;

class DatabaseServices {
  static Future<String> sms(
      {required String phoneNumber, String requestType = 'login'}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      // print(object)
      preferences.setString('mobile', phoneNumber);
      Dio dio = Dio();

      final response = await dio.get(
          'http://www.ilamservices.ir/register/?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&mobile=' +
              phoneNumber);
      // Map<String, dynamic> res = json.decode(response.data.toString());
      return response.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> sms2(
      {required String phoneNumber, String requestType = 'login'}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('mobile', phoneNumber);
      var r = await http
          .get(
            Uri.parse(
                'http://www.ilamservices.ir/register/?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&mobile=$phoneNumber'),
          )
          .timeout(const Duration(seconds: 20));
      return r.toString();
    } on TimeoutException catch (e) {
      return 'timeout';
    }
  }

  static Future<String> sms3(
      {required String phoneNumber, String requestType = 'login'}) async {
    var url = Uri.parse(
        'http://www.ilamservices.ir/register/?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&mobile=$phoneNumber');
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    // var data = await utf8.decoder.bind(response).toString();
    // print('Response ${response.statusCode}: $data');
    httpClient.close();
    return response.toString();
  }

  static Future<String> login({required String code}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String phoneNumber = preferences.getString('mobile') ?? '09215147902';
      var r = await http
          .get(
            Uri.parse(
                'http://ilamservices.ir/login?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&mobile=$phoneNumber&code=$code&platform=sth&os_version=sth&type_mobile=sth&ip=1.1.1.1&version=1'),
          )
          .timeout(const Duration(seconds: 20));

      var m = jsonDecode(r.body);
      if (m['response'] == 0) {
        return 'fail';
      }
      preferences.setString('token', m['token']);
      return r.body.toString();
    } on TimeoutException catch (e) {
      return 'timeout';
    }
  }

  static Future<String> requestService({
    required String service,
    required String title,
    required String description,
    required String name,
    required String address,
    required String brand,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String phoneNumber = preferences.getString('mobile') ?? '09215147902';
      String token = preferences.getString('token') ?? 's';
      print(token);
      print(phoneNumber);
      var r = await http
          .get(
            Uri.parse(
                'http://ilamservices.ir/login/information.php?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&service=$service&title=$title&description=$description&name=$name&token=$token&address=$address&brand=$brand&mobile=$phoneNumber'),
          )
          .timeout(const Duration(seconds: 20));
      var m = jsonDecode(r.body);
      return r.body.toString();
    } on TimeoutException catch (e) {
      return 'timeout';
    }
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token') ?? '';
    if (token == '') {
      return false;
    }
    return true;
  }

  static Future<String> getPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? phone = sharedPreferences.getString('mobile') ?? '';
    return phone;
  }
}
