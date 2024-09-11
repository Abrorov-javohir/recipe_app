import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/bloc/auth/auth_bloc.dart';
import 'package:recipe_app/core/gen/assets.gen.dart';
import 'package:recipe_app/core/helpers/dialogs.dart';
import 'package:recipe_app/core/navigation/router.gr.dart';
import 'package:recipe_app/ui/screens/home_Screen.dart';

@RoutePage()
class BeginRegisterScreen extends StatefulWidget {
  const BeginRegisterScreen({super.key});

  @override
  State<BeginRegisterScreen> createState() => _BeginRegisterScreenState();
}

class _BeginRegisterScreenState extends State<BeginRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          Appdialogs.showLoading(context);
        } else {
          Appdialogs.hideLoading(context);
        }

        if (state is AuthenticatedAuthState) {
          context.router.replace(const HomeRoute());
        }

        if (state is ErrorAuthState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/image/for_register.png"), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Overlay
            Container(
              color: Colors.black54,
            ),
            // Content
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Create an \nAccount",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur  elit, \nsed do eiusmod tempor incididunt ut.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity, // Full width
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.router.replace(LoginRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3FB4B1),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 20),
                            Text(
                              "Register using email",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                // Handle Google login
                                context.read<AuthBloc>().add(
                                    SocialLoginAuthEvent(
                                        SocialLoginType.google));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xff3FB4B1).withOpacity(0.4),
                                minimumSize: const Size(152, 60),
                              ),
                              child: Assets.svg.google.svg(),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Apple login
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xff3FB4B1).withOpacity(0.4),
                                minimumSize: const Size(152, 60),
                              ),
                              child: Assets.svg.apple.svg(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Have an account?"),
                          TextButton(
                            onPressed: () {
                              context.router.replace(LoginRoute());
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
