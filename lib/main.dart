import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mads_cleaning/views/splash_screen.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mads Cleaning",
      theme: ThemeData(useMaterial3: false),
      themeMode: ThemeMode.light,
      // initialBinding: BindingsBuilder(() {
      //   Get.put(CoreController());
      // }),
      home: SplashScreen(),
    );
  }
}