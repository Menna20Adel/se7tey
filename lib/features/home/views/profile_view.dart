import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الحساب الشخصـي'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: AppColors.white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              // صورة

              Stack(alignment: Alignment.bottomRight, children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt, color: AppColors.blue),
                    ))
              ]),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('منه الله عادل', style: getTitleStyle(fontSize: 20)),
                  const Gap(10),
                  Text(
                    'الاسكندرية',
                    style: getbodyStyle(),
                  )
                ],
              )
            ],
          ),
          const Gap(20),

          // نبذه تعريفية

          Text('نبذه تعريفية', style: getTitleStyle(color: AppColors.black)),
          const Gap(10),
          Text('لم تضاف', style: getbodyStyle()),
          const Gap(20),
          const Divider(),
          const Gap(20),

          // معلومات التواصل

          Text('معلومات التواصل', style: getTitleStyle(color: AppColors.black)),
          const Gap(10),
          Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightBlue,
              ),
              child: Column(
                children: [
                  //email
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.email,
                          color: AppColors.white,
                        ),
                      ),
                      const Gap(15),
                      Text('patient@example.com',
                          style: getbodyStyle(fontSize: 18))
                    ],
                  ),
                  const Gap(20),

                  //phone
                  Row(
                    children: [
                      Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.phone, color: AppColors.white)),
                      const Gap(15),
                      Text('0123456789', style: getbodyStyle(fontSize: 18))
                    ],
                  )
                ],
              )),
          const Divider(),
          const Gap(20),

          //الحجوزات

          Text('الحجوزات', style: getTitleStyle(color: AppColors.black)),
          const Gap(10),
          Text('لا توجد حجوزات', style: getbodyStyle()),
        ]),
      ),
    );
  }
}
