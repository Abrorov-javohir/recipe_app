import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/bloc/login_bloc.dart';
import 'package:recipe_app/bloc/register_bloc.dart';
import 'package:recipe_app/ui/screens/auth/register/register_screen.dart';
import 'package:recipe_app/ui/screens/splash/splash_screen1.dart';
import 'package:dio/dio.dart'; // Dio importini qo'shing agar kerak bo'lsa

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(Dio()), // Dio ni kiriting agar kerak bo'lsa
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const SplashScreen1(),
      ),
    );
  }
}