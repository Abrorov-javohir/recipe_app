import 'package:recipe_app/data/models/auth/login_request.dart';
import 'package:recipe_app/data/models/auth/register_request.dart';
import 'package:recipe_app/data/services.dart/auth_api_service.dart';
import 'package:recipe_app/data/services.dart/auth_local_service.dart';
import 'package:recipe_app/data/models/auth/auth_response.dart';

class AuthRepository {
  final AuthApiService authApiService;
  final AuthLocalService authLocalService;

  AuthRepository({
    required this.authApiService,
    required this.authLocalService,
  });

  Future<void> register(RegisterRequest request) async {
    try {
      final AuthResponse authResponse = await authApiService.register(request);
      authLocalService.saveToken(authResponse);
    } catch (e) {
      // Handle error (e.g., log it, rethrow it, etc.)
      throw Exception('Registration failed: $e');
    }
  }

  Future<void> login(LoginRequest request) async {
    try {
      final AuthResponse authResponse = await authApiService.login(request);
      authLocalService.saveToken(authResponse);
    } catch (e) {
      // Handle error (e.g., log it, rethrow it, etc.)
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    try {
      await authApiService.logout();
      authLocalService.clearToken(); // Assuming you want to clear the token
    } catch (e) {
      // Handle error (e.g., log it, rethrow it, etc.)
      throw Exception('Logout failed: $e');
    }
  }
}
