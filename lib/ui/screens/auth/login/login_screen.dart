import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/bloc/login_bloc.dart';
import 'package:recipe_app/bloc/login_event.dart';
import 'package:recipe_app/bloc/login_state.dart';
import 'package:recipe_app/ui/screens/auth/register/register_screen.dart';
import 'package:recipe_app/ui/screens/auth/reset_password/reset_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(Dio()), // Dio obyekti kiriting
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
              child: const Text(
                "Register",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(context, '/nextScreen');
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.blue[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.blue[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 250),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginSubmitted(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3FB4B1),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Google login handling
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xff3FB4B1).withOpacity(0.4),
                              minimumSize: const Size(152, 60),
                            ),
                            child: const Text("Google"),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Apple login handling
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xff3FB4B1).withOpacity(0.4),
                              minimumSize: const Size(152, 60),
                            ),
                            child: const Text("Apple"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}