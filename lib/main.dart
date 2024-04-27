import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';
import 'package:se7tey/features/auth/presentation/manager/auth_cubit.dart';
import 'package:se7tey/features/intro/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyC-rjoh5p-35znHh1lQy7_D9Txxw8MypZk',
          appId: 'com.example.se7tey',
          messagingSenderId: '803106172284',
          projectId: 'se7tey-e39ea'));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            snackBarTheme: SnackBarThemeData(backgroundColor: AppColors.red),
            appBarTheme: AppBarTheme(
                titleTextStyle: getTitleStyle(color: AppColors.white),
                centerTitle: true,
                elevation: 0.0,
                actionsIconTheme: IconThemeData(color: AppColors.blue),
                backgroundColor: AppColors.blue),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.only(
                  left: 20, top: 10, bottom: 10, right: 20),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              suffixIconColor: AppColors.blue,
              prefixIconColor: AppColors.blue,
              fillColor: AppColors.lightBlue,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            dividerTheme: DividerThemeData(
              color: AppColors.black,
              indent: 10,
              endIndent: 10,
            ),
            fontFamily: GoogleFonts.cairo().fontFamily),
      ),
    );
  }
}
