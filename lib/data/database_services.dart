import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ilamservice/data/service_product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

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
      log(e.toString());
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
      log(e.toString());
      return 'timeout';
    }
  }

  static Future<String> requestService({
    required int productId,
    required String description,
    required String brand,
    required String address,
    required String dateSend,
    required int fatherId,
    required String name,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String token = preferences.getString('token') ?? 's';

      var r = await http
          .get(
            Uri.parse(
                'http://ilamservices.ir/order/service.php?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&product_id=$productId&description=$description&brand=$brand&token=$token&address=$address&date_send=$dateSend'),
          )
          .timeout(const Duration(seconds: 20));
      var m = jsonDecode(r.body);
      preferences.setString('code', m['response'].toString());
      preferences.setString('serviceName', name);
      preferences.setInt('fatherId', fatherId);
      return m['response'].toString();
    } on TimeoutException catch (e) {
      log(e.toString());
      return 'timeout';
    }
  }

  static Future<String> changeName({
    required String name,
    required String lastName,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String token = preferences.getString('token') ?? 's';
      var r = await http
          .get(
            Uri.parse(
                'http://ilamservices.ir/login/profile.php?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&name=$name&family=$lastName&token=$token'),
          )
          .timeout(const Duration(seconds: 20));
      var m = jsonDecode(r.body) as Map;
      if (m['response'] == 1) {
        preferences.setString('name', name);
        preferences.setString('lastName', lastName);
      }
      return r.body.toString();
    } on TimeoutException catch (e) {
      log(e.toString());
      return 'timeout';
    }
  }

  static Future<String> requestProduct({
    required int productId,
    required String description,
    required String address,
    required String name,
    required int fatherId,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String token = preferences.getString('token') ?? 's';
      var r = await http
          .get(
            Uri.parse(
                'http://ilamservices.ir/order/product.php?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&product_id=$productId&description=$description&token=$token&address=$address'),
          )
          .timeout(const Duration(seconds: 20));
      var m = jsonDecode(r.body);
      preferences.setString('code', m['response'].toString());
      preferences.setString('serviceName', name);
      preferences.setInt('fatherId', fatherId);

      return m['response'].toString();
    } on TimeoutException catch (e) {
      log(e.toString());
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

  static Future<String> getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? name = sharedPreferences.getString('name') ?? '';
    return name;
  }

  static Future<String> getCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? code = sharedPreferences.getString('code') ?? '';
    return code;
  }

  static Future<ServiceOrProduct> getLastOrder() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? fatherId = sharedPreferences.getInt('fatherId') ?? 0;
    String? serviceName = sharedPreferences.getString('serviceName') ?? '';
    return ServiceOrProduct(
        type: 0, id: 0, fatherId: fatherId, name: serviceName);
  }

  static Future<String> getLastName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? lastName = sharedPreferences.getString('lastName') ?? '';
    return lastName;
  }

  static Future getNameAndLastNameFromServer() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token') ?? 's';
    try {
      var r = await http
          .get(
            Uri.parse(
                'http://ilamservices.ir/data/getprofile.php?api_key=iZiOAbUJweieAcOQgwmlPH5OQKIQR9eLzGh9n8Vn&token=$token'),
          )
          .timeout(const Duration(seconds: 20));

      int start = r.body.indexOf('["name"]');
      int end = r.body.indexOf('[0]');
      String name = r.body.substring(start + 8, end);
      start = name.indexOf('"');
      name = name.substring(start + 1, name.length - 4);
      start = r.body.indexOf('["family"]');
      end = r.body.indexOf('[2]');
      String lastName = r.body.substring(start + 11, end);
      start = lastName.indexOf('"');
      lastName = lastName.substring(start + 1, lastName.length - 4);

      if (name.contains('=>') && name.contains('NUL') && name.contains('\n')) {
        name = '';
      }

      if (lastName.contains(">") &&
          lastName.contains('NUL') &&
          lastName.contains('\n')) {
        lastName = '';
      }
      sharedPreferences.setString('name', name);
      sharedPreferences.setString('lastName', lastName);
    } catch (e) {
      log(e.toString());
    }
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
          if (parent.fatherId == 3) {
            //repair
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
              } else if (res[i].name.contains('پکیج')) {
                ServiceOrProduct tmp = res[counter];
                res[counter++] = res[i];
                res[i] = tmp;
              } else if (res[i].name.contains('جاروبرقی')) {
                ServiceOrProduct tmp = res[counter];
                res[counter++] = res[i];
                res[i] = tmp;
              }
            }
          }
        }
      }

      return res;
    } on TimeoutException catch (e) {
      log(e.toString());
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
