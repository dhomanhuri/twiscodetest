import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future setCart(String _key, int _value) async {
    await _storage.write(key: _key, value: _value.toString());
    print("setCart: $_key, $_value");
  }

  static Future<String> getCart(int index) async =>
      await _storage.read(key: index.toString()) ?? '0';

  static Future<Map<String, String>> readSecureAll() async {
    var all = await _storage.readAll();
    // print("readSecureAll: $all");
    return all;
  }

  static Future<void> deleteSecure(String _key) async {
    await _storage.delete(key: _key);
    print("deleteSecure: $_key");
  }

  static deleteSecureAll() async {
    await _storage.deleteAll();
  }
}
