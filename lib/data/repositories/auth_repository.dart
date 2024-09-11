import 'package:recipe_app/data/models/auth/login_request.dart';
import 'package:recipe_app/data/models/auth/register_request.dart';
import 'package:recipe_app/data/services/auth_api_service.dart';
import 'package:recipe_app/data/services/auth_local_service.dart';
import 'package:recipe_app/data/models/auth/auth_response.dart';
import 'package:recipe_app/data/social_login/social_login_request.dart';

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
      // Xatoni qayta ishlash
      throw Exception('Ro\'yxatdan o\'tish muvaffaqiyatsiz bo\'ldi: $e');
    }
  }

  Future<void> login(LoginRequest request) async {
    try {
      final AuthResponse authResponse = await authApiService.login(request);
      authLocalService.saveToken(authResponse);
    } catch (e) {
      // Xato matni to'g'rilandi
      throw Exception('Kirish muvaffaqiyatsiz bo\'ldi: $e');
    }
  }

  Future<void> socialLogin(SocialLoginRequest request) async {
    try {
      final AuthResponse authResponse =
          await authApiService.socialLogin(request);
      authLocalService.saveToken(authResponse);
    } catch (e) {
      // Social login xatolarini boshqarish
      throw Exception(
          'Ijtimoiy tarmoq orqali kirish muvaffaqiyatsiz bo\'ldi: $e');
    }
  }

  Future<void> logout() async {
    try {
      await authApiService.logout();
      authLocalService.clearToken(); // Tokenni tozalash
    } catch (e) {
      // Chiqishdagi xatolarni boshqarish
      throw Exception('Chiqish muvaffaqiyatsiz bo\'ldi: $e');
    }
  }
}
