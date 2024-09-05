import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:recipe_app/bloc/auth/auth_bloc.dart';
import 'package:recipe_app/core/navigation/router.gr.dart';
import 'package:recipe_app/data/models/auth/login_request.dart';
import 'package:recipe_app/data/models/user/user.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedAuthState) {
          context.router.replace(const HomeRoute());

          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return const HomeScreen();
          //   }),
          //   (route) => false,
          // );
          final User user = state.user;
          if (kDebugMode) {
            print("Ism: ${user.name}");
          }
          if (kDebugMode) {
            print("Email: ${user.email}");
          }
          if (kDebugMode) {
            print("phone: ${user.phone}");
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator:
                      EmailValidator(errorText: 'Enter a valid email').call,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: MinLengthValidator(6,
                          errorText: 'Password must be at least 6 digits long')
                      .call,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.maxFinite,
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (state is LoadingAuthState) {
                            return;
                          }

                          if (_formKey.currentState!.validate()) {
                            final request = LoginRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            context
                                .read<AuthBloc>()
                                .add(LoginAuthEvent(request: request));
                          }
                        },
                        child: state is LoadingAuthState
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Login'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
