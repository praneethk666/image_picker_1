import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker_1/widgets/routes.dart';

void main() async{
  await GetStorage.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
   //final themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //  themeMode: themeController.theme,
      // theme: Themes.lightTheme,
      // darkTheme: Themes.darkTheme,
      initialRoute:  GetRoutes.home,
      getPages: GetRoutes.routes
    );
  }
}

