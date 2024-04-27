import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se7tey/core/widgets/active_nav_bar_btn.dart';
import 'package:se7tey/features/home/views/calendar_view.dart';
import 'package:se7tey/features/home/views/home_view.dart';
import 'package:se7tey/features/home/views/profile_view.dart';
import 'package:se7tey/features/home/views/search_view.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => NavBarWidgetState();
}

class NavBarWidgetState extends State<NavBarWidget> {
  int selectedPage = 0;

  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const CalendarView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          items: [
            //home

            BottomNavigationBarItem(
                activeIcon: const ActiveButton(
                    icon: 'assets/home.svg', label: 'الرئيسية'),
                icon: SvgPicture.asset('assets/home.svg'),
                label: 'Home'),

            // search

            BottomNavigationBarItem(
                activeIcon: const ActiveButton(
                    icon: 'assets/search.svg', label: 'البحث'),
                icon: SvgPicture.asset('assets/search.svg'),
                label: 'Search'),

            // calendar

            BottomNavigationBarItem(
                activeIcon: const ActiveButton(
                    width: 120, icon: 'assets/calendar.svg', label: 'المواعيد'),
                icon: SvgPicture.asset('assets/calendar.svg'),
                label: 'Calendar'),

            // profile

            BottomNavigationBarItem(
                activeIcon: const ActiveButton(
                    icon: 'assets/profile.svg', label: 'الحساب'),
                icon: SvgPicture.asset('assets/profile.svg'),
                label: 'Profile'),
          ]),
    );
  }
}
