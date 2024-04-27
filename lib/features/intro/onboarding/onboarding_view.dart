import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se7tey/core/functions/routing.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';
import 'package:se7tey/core/widgets/custom_btn.dart';
import 'package:se7tey/features/intro/onboarding/onboarding_model.dart';
import 'package:se7tey/features/intro/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          if (currentPage != 2)
            TextButton(
                onPressed: () {
                  pushToWithReplacement(context, const WelcomeView());
                },
                child: Text(
                  'تخطي',
                  style: getbodyStyle(color: AppColors.blue),
                ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //pageView
            Expanded(
                child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: pageController,
              itemBuilder: (context, index) {
                return Column(children: [
                  const Spacer(),
                  //image
                  SvgPicture.asset(
                    pages[index].image,
                    width: 350,
                  ),
                  const Spacer(),
                  //title
                  Text(
                    pages[index].title,
                    style: getTitleStyle(color: AppColors.blue),
                  ),
                  const Spacer(),
                  Text(
                    pages[index].body,
                    style: getbodyStyle(),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ]);
              },
              itemCount: pages.length,
            )),

            //footer
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: SlideEffect(
                        spacing: 8.0,
                        radius: 15,
                        dotWidth: 20,
                        dotHeight: 13,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: AppColors.blue),
                  ),
                  const Spacer(),
                  if (currentPage == 2)
                    CustomButton(
                      text: 'هيا بنا',
                      onPressed: () {
                        pushToWithReplacement(context, const WelcomeView());
                      },
                      width: 100,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
