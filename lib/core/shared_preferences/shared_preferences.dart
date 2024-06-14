import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();

  factory SharedPrefHelper() => _instance;
  SharedPreferences? _prefs;

  SharedPrefHelper._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setIsRegistrationCompleted(bool isCompleted) async {
    return await _prefs!.setBool('isRegistrationCompleted', isCompleted);
  }

  bool getIsRegistrationCompleted() =>
      _prefs!.getBool('isRegistrationCompleted') ?? false;

  Future<bool> setIsLoginSuccessful(bool isSuccessful) async {
    return await _prefs!.setBool('isLoginSuccessful', isSuccessful);
  }

  bool getIsLoginSuccessful() => _prefs!.getBool('isLoginSuccessful') ?? false;

  Future<bool> setDeviceId(String deviceId) async {
    return await _prefs!.setString('device_id', deviceId);
  }

  String getDeviceId() => _prefs!.getString('device_id') ?? '';
}
