import 'package:flutter/material.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        'صّـحتـي',
        style: getTitleStyle(fontSize: 20, color: AppColors.black),
      ),
      backgroundColor: AppColors.white,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active, color: AppColors.black))
      ],
    ));
  }
}
