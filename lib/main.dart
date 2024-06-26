import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/colors/colors.dart';
import '../../../helper/router.dart';
import '../../../translation/language.dart';

import 'helper/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBFi8qpJgkXzVEB_w8CQ_FqLq2Kv-a1tbc",
      appId: "1:892239360200:android:e6b765d21634c25c4ef5fd",
      messagingSenderId: "XXX",
      projectId: "simple-b6475",
    ),
  );
  await MainBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 690),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Sweep',
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            defaultTransition: Transition.fadeIn,
            initialRoute: AppRouter.getInitialRoute(),
            translations: Language(),
            locale: const Locale('en', 'US'),
            getPages: AppRouter.routes,
            theme: ThemeData(
              fontFamily: 'SFPro',
              scaffoldBackgroundColor: bgColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
  }
}
