import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:digirh/core/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:digirh/features/auth/data/models/auth_request_model.dart';
import 'package:digirh/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digirh/common_widgets/app_botton.dart';
import 'package:digirh/common_widgets/app_form_field.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => AuthBloc(),
        child: this,
      );
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ValueNotifier<bool> obscured;
  final _formKey = GlobalKey<FormState>();
  late ValueNotifier<String> errorMessage;
  late bool valid;

  void _validateUsername(String value) {
    log(value.isEmpty.toString());
    if (value.isEmpty) {
      setState(() {
        errorMessage.value = "Veuillez saisir votre nom d'utilisateur";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        errorMessage.value = "Veuillez saisir votre mot de passe";
        valid = false;
      });
    } else if (value.length < 6) {
      setState(() {
        errorMessage.value =
            "Le mot de passe doit contenir au moins 6 caractères";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    obscured = ValueNotifier(true);
    errorMessage = ValueNotifier("");
    valid = true;
  }

  void _onSubmit() {
    _validateUsername(_usernameController.text);
    if (valid) {
      _validatePassword(_passwordController.text);
    }
    if (valid) {
      final userModel = AuthRequestModel(
        username: _usernameController.text,
        password: _passwordController.text,
      );
      context.read<AuthBloc>().add(LoginEvent(request: userModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.whiteDarkColor,
        child: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.router.replace(
                  const AppFrame(),
                );
              }
              if (state is LoginFailed) {
                setState(() {
                  errorMessage.value = state.message;
                  valid = false;
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .25,
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      child: SvgPicture.asset(
                        'assets/svg/login.svg',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    AppFormField(
                      hintText: "nom d'utilisateur",
                      controller: _usernameController,
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset(
                          'assets/svg/user.svg',
                        ),
                      ),
                    ),
                    extraSmallVerticalSpacer,
                    ValueListenableBuilder<bool>(
                      valueListenable: obscured,
                      builder: (_, obs, __) => AppFormField(
                        obscured: obs,
                        hintText: "mot de passe",
                        controller: _passwordController,
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset(
                            'assets/svg/lock.svg',
                          ),
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              obscured.value = !obs;
                            },
                            child: obs
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      'assets/svg/show.svg',
                                      width: 20,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      'assets/svg/hide.svg',
                                      width: 20,
                                    ),
                                  )),
                      ),
                    ),
                    extraMiniVerticalSpacer,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ValueListenableBuilder(
                        valueListenable: errorMessage,
                        builder: (context, value, child) {
                          return Text(
                            errorMessage.value,
                            style: TextStyles.extraSmallTextStyle.copyWith(
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                    extraMiniVerticalSpacer,
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        // onTap: () =>
                        //     context.router.replace(const ForgotPasswordEmail()),
                        child: Text(
                          "Mot de passe oublie?",
                          style: TextStyles.smallTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryDarkColor),
                        ),
                      ),
                    ),
                    extraExtraLargeVerticalSpacer,
                    AppBotton(
                        bottonText: "Login",
                        onClick: () {
                          _onSubmit();
                        }),
                    miniVerticalSpacer,
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
