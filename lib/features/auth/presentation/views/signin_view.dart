import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7tey/core/functions/email_validate.dart';
import 'package:se7tey/core/functions/routing.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';
import 'package:se7tey/core/widgets/custom_btn.dart';
import 'package:se7tey/core/widgets/custom_dialogs.dart';
import 'package:se7tey/features/auth/presentation/manager/auth_cubit.dart';
import 'package:se7tey/features/auth/presentation/manager/auth_states.dart';
import 'package:se7tey/features/auth/presentation/views/register_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key, required this.index});
  final int index;

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;

  String handleUserType(int index) {
    return widget.index == 0 ? 'دكتور' : 'مريض';
  }

  String handleEmailType(int index) {
    return widget.index == 0 ? 'doctor' : 'patient';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          log('done');
        } else if (state is RegisterErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 250,
                  ),
                  const Gap(20),
                  Text(
                    'سجل دخول الان كـ "${handleUserType(widget.index)}"',
                    style: getTitleStyle(),
                  ),
                  const Gap(30),

                  //email
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: '${handleEmailType(widget.index)}@example.com',
                      hintStyle: getbodyStyle(color: AppColors.gray),
                      prefixIcon: const Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                      } else if (!emailValidate(value)) {
                        return 'من فضلك ادخل الايميل بشكل صحيح';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Gap(25),

                  //password
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    obscuringCharacter: '*',
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: '********',
                      hintStyle: getbodyStyle(color: AppColors.gray),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon((isVisible)
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7, top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'نسيت كلمة السر؟',
                        style: getbodyStyle(),
                      ),
                    ),
                  ),

                  const Gap(25),

                  //login btn

                  CustomButton(
                    text: 'تسجيل الدخول',
                    onPressed: () async {
                      // if(_formKey.currentState!.validate()){
                      //   await context.read<AuthCubit>().registerPatient(name, _emailController, _passwordController);
                      // }
                    },
                    radius: 25,
                  ),

                  const Gap(35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لديك حساب؟',
                        style: getbodyStyle(),
                      ),
                      TextButton(
                          onPressed: () {
                            pushToWithReplacement(
                                context,
                                RegisterView(
                                  index: widget.index,
                                ));
                          },
                          child: Text(
                            'سجل الان',
                            style: getbodyStyle(color: AppColors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
