import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final _secureStorage = const FlutterSecureStorage();

  Future saveUserData({
    required data,
  }) async {
    var encodedData = jsonEncode(data);
    await _secureStorage.write(key: 'user', value: encodedData);
  }

  Future getUserData() async {
    var data = await _secureStorage.read(key: 'user');
    if (data != null) {
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    return null;
  }

  Future getToken() async {
    var data = await _secureStorage.read(key: 'user');
    if (data != null) {
      var decodedData = jsonDecode(data);
      return decodedData['token'];
    }
    return null;
  }

  Future deleteUserData() async {
    await _secureStorage.delete(key: 'user');
    await _secureStorage.delete(key: 'screen');
  }

  Future setScreenType(String type) async {
    await _secureStorage.write(key: 'screen', value: type);
  }

  Future getScreenType() async {
    return await _secureStorage.read(key: 'screen');
  }

  Future setDownloaded(String value) async {
    await _secureStorage.write(key: 'downloaded', value: value);
  }

  Future getDownloaded() async {
    return await _secureStorage.read(key: 'downloaded');
  }

  Future deleteDownload() async {
    await _secureStorage.delete(key: 'downloaded');
  }

  Future saveLanguage(String lang) async {
    await _secureStorage.write(key: 'lang', value: lang);
  }

  Future getLanguage() async {
    return await _secureStorage.read(key: 'lang');
  }

  Future saveMode(String mode) async {
    await _secureStorage.write(key: 'mode', value: mode);
  }

  Future getMode() async {
    return await _secureStorage.read(key: 'mode');
  }
}
