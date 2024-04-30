import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/controller/login_controller.dart';
import 'package:student_app/view/home/widgets/bottom_navigation.dart';
import 'package:student_app/view/login/login_screen.dart';

Future<void> main() async {
  runApp(const MyApp());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getString('trinity_token') != null) {
    loginController.isUserLogin.value = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size.width > 615 &&
              MediaQuery.of(context).size.width < 1440
          ? const Size(834, 1194)
          : MediaQuery.of(context).size.width < 615
              ? const Size(390, 890.2446)
              : const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[50],
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const BottomNavigationScreen(),
    );
  }
}
