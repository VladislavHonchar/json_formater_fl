import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _SharedPreferencesKeys{
  static const nameKey = 'name_Key';
}
abstract class _FlutterSecureStorageKeys{
  static const tokenKey = 'token';
}

class ExampleWidgetModel{
  final _storage = SharedPreferences.getInstance();
  final _secureStorage = FlutterSecureStorage();

  Future<void> readName() async{
    final storage = await _storage;
    final name = storage.getString(_SharedPreferencesKeys.nameKey);
    print(name);
  }
  
  Future<void> setName() async{
    final storage = await _storage;
    storage.setString(_SharedPreferencesKeys.nameKey, "Julia");

  }
  
  Future<void> readToken() async{
    final token = await _secureStorage.read(key: _FlutterSecureStorageKeys.tokenKey);
    print(token);
  }
  
  Future<void> setToken() async{
    _secureStorage.write(
      key: _FlutterSecureStorageKeys.tokenKey, 
      value: "bv4378b47vb37vb37vb3v3b");
  }
}