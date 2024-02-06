import 'package:e_harithasena_admin/bloc/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/value_validators.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_button.dart';
import '../widgets/forgot_password.dart';
import '../widgets/text_link.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null &&
          currentUser.uid == FirebaseAuth.instance.currentUser!.uid) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 400,
            child: Material(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: BlocProvider(
                  create: (context) => LoginBloc(),
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else if (state is LoginFailureState) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            title: 'Failure',
                            description: state.message,
                            primaryButton: 'Ok',
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              'LOGIN',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Enter your email and password to login.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              validator: emailValidator,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _passwordController,
                              validator: notEmptyValidator,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.lock_outline_sharp,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined),
                                  onPressed: () {
                                    _isObscure = !_isObscure;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              isLoading: false,
                              label: 'LOGIN',
                              iconData: Icons.arrow_forward,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginEvent(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: TextLink(
                                text: 'Forgot Password?',
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) =>
                                        const ForgotPasswordDialog(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
