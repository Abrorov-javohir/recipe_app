import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/bloc/login_event.dart';
import 'package:recipe_app/bloc/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio;

  LoginBloc(this._dio) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield LoginLoading();
      try {
        final response = await _dio.post(
          'http://recipe.flutterwithakmaljon.uz/api/login',
          options: Options(
            headers: {
              'Authorization':
                  'Bearer your_token_here', // Agar kerak bo'lsa token
            },
          ),
          data: {
            'email': event.email,
            'password': event.password,
          },
        );

        if (response.statusCode == 200) {
          final prefs = await SharedPreferences.getInstance();
          final token = response.data['token']; // Tokenni oling
          await prefs.setString('token', token);

          yield LoginSuccess(token); // Tokenni yuboring
        } else {
          yield LoginFailure('Invalid credentials'); // Xato sababi
        }
      } catch (e) {
        yield LoginFailure(e.toString()); // Xatolik
      }
    }
  }
}
