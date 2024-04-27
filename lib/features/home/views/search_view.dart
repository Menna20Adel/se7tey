import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ابحث عن دكتور')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: TextFormField(
                controller: searchController,
                style: getbodyStyle(),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: AppColors.blue,
                      )),
                  hintText: 'البحث',
                ),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  'عرض كل الدكاترة',
                  style: getTitleStyle(color: AppColors.blue),
                )),
            SvgPicture.asset('assets/no-search.svg', height: 330),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
