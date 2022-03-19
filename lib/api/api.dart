import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'http://mark.dbestech.com/api/';
  final String _imgUrl = 'http://mark.dbestech.com/uploads/';
  getImage() {
    return _imgUrl;
  }

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    GetStorage getStorage = GetStorage();
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = getStorage.read('token');
    return '?token=$token';
  }

  getArticles(apiUrl) async {
    http.Response response =
        await http.get(Uri.parse(_url + apiUrl + await _getToken()));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

  getPublicData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}
