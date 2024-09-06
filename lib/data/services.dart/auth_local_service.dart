import 'package:hive/hive.dart';
import 'package:recipe_app/data/models/auth/auth_response.dart';

class AuthLocalService {
  final Box<String> _box = Hive.box<String>('auth');

  // Save token from AuthResponse
  void saveToken(AuthResponse auth) {
    _box.put('token', auth.token);
  }

  // Retrieve the token
  String? getToken() {
    return _box.get('token');
  }

  // Clear the token
  void clearToken() {
    _box.delete('token');
  }
}