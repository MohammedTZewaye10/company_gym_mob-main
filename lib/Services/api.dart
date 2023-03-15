import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'secure_storage.dart';

class API {
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      String? lang = await Storage().getLanguage();
      final Uri uri = Uri.parse('${baseApiUrl}admin/login');
      var response = await http.post(
        uri,
        headers: {
          'lang': lang ?? 'en',
          'Accept': 'application/json'
        },
        body: {
          'email': email,
          'password': password,
        },
      );
      Clipboard.setData(ClipboardData(text: response.body));
      var decodedBody = jsonDecode(response.body);
      return decodedBody;
    } catch (e) {
      debugPrint('$e');
      return {
        'code': 100,
        'message': 'هەڵەیێک ڕوویدا، تکایە دووبارە هەوڵ بدەوە'
      };
    }
  }

  Future postRequest({
    required String url,
    Map<String, String>? body,
  }) async {
    try {
      String? token = await Storage().getToken();
      String? lang = await Storage().getLanguage();
      Map<String, String> headers = {
        'lang': lang ?? 'en',
      };
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {
        'code': 100,
        'message': 'هەڵەیێک ڕوویدا، تکایە دووبارە هەوڵ بدەوە'
      };
    }
  }

  Future multipartRequest({
    required String url,
    File? file,
    Map<String, String>? body,
  }) async {
    try {
      String token = await Storage().getToken();
      String? lang = await Storage().getLanguage();
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'lang': lang ?? 'en',
      };
      http.MultipartRequest? request;
      if (file == null) {
        request = http.MultipartRequest('POST', Uri.parse(url))
          ..headers.addAll(headers)
          ..fields.addAll(body ?? {});
      } else {
        request = http.MultipartRequest('POST', Uri.parse(url))
          ..headers.addAll(headers)
          ..fields.addAll(body ?? {})
          ..files.add(await http.MultipartFile.fromPath('image', file.path));
      }
      var response = await request.send();
      var str = await response.stream.bytesToString();
      var responseBody = jsonDecode(str);
      debugPrint('$responseBody');
      return responseBody;
    } catch (e) {
      return null;
    }
  }
}
