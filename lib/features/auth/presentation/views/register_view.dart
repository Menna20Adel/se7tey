import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7tey/core/functions/email_validate.dart';
import 'package:se7tey/core/functions/routing.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';
import 'package:se7tey/core/widgets/custom_btn.dart';
import 'package:se7tey/core/widgets/custom_dialogs.dart';
import 'package:se7tey/core/widgets/nav_bar_widget.dart';
import 'package:se7tey/features/auth/presentation/manager/auth_cubit.dart';
import 'package:se7tey/features/auth/presentation/manager/auth_states.dart';
import 'package:se7tey/features/auth/presentation/views/doctoe_register_data.dart';
import 'package:se7tey/features/auth/presentation/views/signin_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.index});
  final int index;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
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
          if (widget.index == 0) {
            pushAndRemoveUntil(context, const DoctorUploadData());
          } else {
            pushAndRemoveUntil(context, const NavBarWidget());
          }
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
                    'سجل حساب جديد كـ "${handleUserType(widget.index)}"',
                    style: getTitleStyle(),
                  ),
                  const Gap(30),

                  //name
                  TextFormField(
                    controller: _displayName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'الاسم',
                      hintStyle: getbodyStyle(color: AppColors.gray),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                      return null;
                    },
                  ),
                  const Gap(25),

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
                      textAlign: TextAlign.end,
                      obscureText: isVisible,
                      obscuringCharacter: '*',
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
                      )),
                  const Gap(25),

                  //register btn

                  CustomButton(
                    text: 'تسجيل الحساب',
                    onPressed: () {
                      if (widget.index == 0) {
                        context.read<AuthCubit>().registerDoctor(
                            _displayName.text,
                            _emailController.text,
                            _passwordController.text);
                      } else {
                        context.read<AuthCubit>().registerPatient(
                            _displayName.text,
                            _emailController.text,
                            _passwordController.text);
                      }
                    },
                    radius: 25,
                  ),
                  const Gap(35),

                  //have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لديك حساب؟',
                        style: getbodyStyle(),
                      ),
                      TextButton(
                          onPressed: () {
                            pushToWithReplacement(
                                context,
                                SigninView(
                                  index: widget.index,
                                ));
                          },
                          child: Text(
                            'سجل دخول',
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
