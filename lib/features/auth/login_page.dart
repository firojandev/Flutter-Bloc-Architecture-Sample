import 'package:edcr_sup_flutter/features/auth/bloc/login_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_constants.dart';
import '../../common/routes/route_path.dart';
import '../../common/utils/my_colors.dart';
import '../../common/utils/my_text_style.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _empIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool? _rememberMe = false;
  bool _isCardVisible = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Start the animation after the initial build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isCardVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body:BlocListener<LoginBloc,LoginState>(
          listener: (context, state) {
           if (state is LoginSuccessState) {
             //As logged in navigate to dashboard
             context.goNamed(
               RoutePath.dashboard
             );
            } else if (state is LoginErrorState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Login Failed'),
                  content:
                  const Text('Invalid Employee ID or Password'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );

            } else {
              print("Other state");
            }
          },
          child:  Container(
            decoration: const BoxDecoration(
              color: MyColors.backgroundLight, // Your background color
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                alignment: _isCardVisible ? Alignment.center : Alignment.bottomCenter,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _isCardVisible ? 1.0 : 0.0,
                  child: Card(
                    color: MyColors.whiteColor,
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(AppConstants.appName,style:MyTextStyle.titleStyle),
                          const SizedBox(height: 10.0),
                          Text(AppConstants.loginToYourAccount,style: MyTextStyle.textStyle,),
                          const SizedBox(height: 30.0),
                          TextField(
                            controller: _empIdController,
                            decoration: InputDecoration(
                              labelText: 'Employee ID',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 6.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                              const Text('Remember Me'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return const CircularProgressIndicator();
                              } else {
                                return ElevatedButton(
                                  onPressed: () {
                                    context.read<LoginBloc>().add(LoginPostEvent(
                                      _empIdController.text,
                                      _passwordController.text,
                                      'Test',
                                    ));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                    minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: MyColors.whiteColor),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {

                            },
                            child: const Text(
                              'Don\'t have an account? Register here',
                              style: MyTextStyle.textLinkStyle,
                            ),
                          ),
                          const SizedBox(height: 10.0),

                        ],
                      ),
                    ),
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
