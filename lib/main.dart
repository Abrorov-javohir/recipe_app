import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/core/di/di.dart';
import 'package:recipe_app/core/navigation/router.dart';
import 'package:recipe_app/bloc/auth/auth_bloc.dart';
import 'package:recipe_app/data/repositories/auth_repository.dart';
import 'package:recipe_app/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive-ni ishga tushirish
  final documentsDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);

  // "auth" box-ni ochish
  await Hive.openBox<String>('auth');

  // Qaramliklarni ro'yxatdan o'tkazish
  await dependencyInit();

  runApp(MyApp());
}

@RoutePage()
class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: getIt.get<AuthRepository>(),
            userRepository: getIt.get<UserRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
