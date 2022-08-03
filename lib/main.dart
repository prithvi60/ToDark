import 'package:dark_todo/app/data/services/storage/services.dart';
import 'package:dark_todo/app/modules/home/binding.dart';
import 'package:dark_todo/app/modules/home/view.dart';
import 'package:dark_todo/app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('OnboardingScreen');

  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DarkToDo',
        home: isviewed != 0 ? const OnboardingScreen() : const HomePage(),
        initialBinding: HomeBinding(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
