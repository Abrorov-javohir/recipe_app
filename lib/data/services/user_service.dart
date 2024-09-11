import 'package:dio/dio.dart';
import 'package:recipe_app/core/di/di.dart';
import 'package:recipe_app/core/network/dio_client.dart';
import 'package:recipe_app/data/models/user/user.dart';

class UserService {
  final Dio dio = getIt.get<DioClient>().dio;

  Future<User> getUser() async {
    try {
      final response = await dio.get('/user');
      return User.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to load user');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(User user) async {
    try {
      final formData = FormData.fromMap({
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'photo': user.photo != null
            ? await MultipartFile.fromFile(user.photo!)
            : null,
      });

      final response = await dio.post('/profile/update', data: formData);

      if (response.statusCode != 200) {
        throw Exception('Failed to update user: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to update user');
    } catch (e) {
      rethrow;
    }
  }
}
