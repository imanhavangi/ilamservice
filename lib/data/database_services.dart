import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ilamservice/data/service_product.dart';
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
    required int productId,
    required String description,
    required String brand,
    required String address,
    required String dateSend,
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
                'http://ilamservices.ir/order/service.php?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&product_id=$productId&description=$description&brand=$brand&token=$token&address=$address&date_send=$dateSend'),
          )
          .timeout(const Duration(seconds: 20));
      var m = jsonDecode(r.body);
      return r.body.toString();
    } on TimeoutException catch (e) {
      return 'timeout';
    }
  }

  static Future<String> requestProduct({
    required int productId,
    required String description,
    required String address,
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
                'http://ilamservices.ir/order/product.php?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&product_id=$productId&description=$description&token=$token&address=$address'),
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

  static Future<List<ServiceOrProduct>> getChildServicesOfParent(
      ServiceOrProduct parent) async {
    List<ServiceOrProduct> res = [];
    try {
      var r = await http
          .get(
            Uri.parse(
                'http://ilamservices.ir/data/?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&id=${parent.id}&type=0'),
          )
          .timeout(const Duration(seconds: 20));
      if (r.body != '[]') {
        // it's a list of services.
        var m = jsonDecode(r.body);
        for (var i in m) {
          res.add(ServiceOrProduct(
            type: 0,
            id: int.parse(i['id']),
            fatherId: parent.fatherId,
            name: utf8.decode(i['title'].runes.toList()),
            fileName: '',
            price: null,
          ));
        }
      } else {
        // Might be a list of products.
        r = await http
            .get(
              Uri.parse(
                  'http://ilamservices.ir/data/?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&id=${parent.id}&type=1'),
            )
            .timeout(const Duration(seconds: 20));
        if (r.body != '[]') {
          //It's a List of products.
          var m = jsonDecode(r.body);
          for (var i in m) {
            res.add(ServiceOrProduct(
              type: 1,
              id: int.parse(i['id']),
              fatherId: parent.fatherId,
              name: utf8.decode(i['title'].runes.toList()),
              fileName: utf8.decode(i['file_name'].runes.toList()),
              price: int.parse(i['price']),
            ));
          }
        }
      }

      return res;
    } on TimeoutException catch (e) {
      return [];
    }
  }

  static Future<List<ServiceOrProduct>> getChildServicesOfRepair() async {
    List<ServiceOrProduct> res = [];
    try {
      List<Future<List<ServiceOrProduct>>> list = [];
      List<ServiceOrProduct> tmp =
          await DatabaseServices.getChildServicesOfParent(
              ServiceOrProduct(type: 0, id: 3, fatherId: 3, name: ''));
      for (ServiceOrProduct i in tmp) {
        list.add(DatabaseServices.getChildServicesOfParent(i));
      }
      Future.wait(list).then((List<List<ServiceOrProduct>> productsList) {
        for (var j in productsList) {
          for (var k in j) {
            res.add(k);
          }
        }
      });

      Stream s = Stream.fromIterable(res);
      while (res.isEmpty) {
        Duration d = const Duration(milliseconds: 100);
        await Future.delayed(d);
      }
      int counter = 0;
      for (int i = 0; i < res.length; i++) {
        if (res[i].name.contains('کولر')) {
          ServiceOrProduct tmp = res[counter];
          res[counter++] = res[i];
          res[i] = tmp;
        } else if (res[i].name.contains('آبگرمکن')) {
          ServiceOrProduct tmp = res[counter];
          res[counter++] = res[i];
          res[i] = tmp;
        } else if (res[i].name.contains('یخچال')) {
          ServiceOrProduct tmp = res[counter];
          res[counter++] = res[i];
          res[i] = tmp;
        } else if (res[i].name.contains('لباسشویی')) {
          ServiceOrProduct tmp = res[counter];
          res[counter++] = res[i];
          res[i] = tmp;
        }
      }
      return res;
    } catch (e) {
      return [];
    }
  }
}
