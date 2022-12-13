import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_1/controllers/homepage_controller.dart';
import 'package:image_picker_1/views/location_screen.dart';
import 'package:image_picker_1/widgets/routes.dart';

import '../controllers/theme_controller.dart';
import '../widgets/themes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController homePageController = Get.put(HomePageController());
 // final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "IMAGE PICKER",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<HomePageController>(
                builder: (controller) => controller.selectedpath == ''
                    ? Image.asset('assests/images/image_placeholder.png',
                        height: 200, width: 200, fit: BoxFit.fill)
                    : Stack(children: [
                        Image.file(
                          File(controller.selectedpath),
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                        controller.removeImage()
                      ])),
            OutlinedButton(
                onPressed: () async {
                  Get.find<HomePageController>().selectImage(context);
                },
                child: const Text("SELECT IMAGE")),
                OutlinedButton(onPressed: (){Get.toNamed(GetRoutes.locationScreen,arguments: homePageController.selectedpath);}, child: const Icon(Icons.navigate_next_sharp))
                // OutlinedButton(onPressed: (){
                //   if(Get.isDarkMode){
                //   themeController.changeTheme(Themes.lightTheme);
                //   themeController.saveTheme(false);
                  
                // }
                // else{
                //   themeController.changeTheme(Themes.darkTheme);
                //   themeController.saveTheme(true);
                // }}, child: Text("CHANGE THEME"))
          ],
        ),
      ),
    ));
  }
}
