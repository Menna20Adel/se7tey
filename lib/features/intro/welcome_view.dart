import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';
import 'package:se7tey/core/widgets/custom_btn.dart';
import 'package:se7tey/features/auth/presentation/views/signin_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'assets/welcome-bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      Positioned(
        top: 100,
        right: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'اهلا بيك',
              style: getTitleStyle(fontSize: 38),
            ),
            const Gap(15),
            Text(
              'سجل واحجز عند دكتورك وانت فالبيت',
              style: getbodyStyle(),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 80,
          right: 25,
          left: 25,
          child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  )
                ],
              ),
              child: Column(children: [
                Text(
                  'سجل دلوقتي كــ',
                  style: getbodyStyle(fontSize: 18, color: AppColors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    CustomButton(
                        text: 'دكتور',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SigninView(index: 0)));
                        },
                        height: 70,
                        color: AppColors.lightBlue.withOpacity(.7),
                        textColor: AppColors.black),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        text: 'مريض',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SigninView(index: 1)));
                        },
                        height: 70,
                        color: AppColors.lightBlue.withOpacity(.7),
                        textColor: AppColors.black)
                  ],
                ),
              ])))
    ]));
  }
}
