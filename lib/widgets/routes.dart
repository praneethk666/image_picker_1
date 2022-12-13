import 'package:get/get.dart';
import 'package:image_picker_1/views/home_page.dart';
import 'package:image_picker_1/views/location_screen.dart';

class GetRoutes{
  static const home = '/',
  locationScreen='/locationScreen';
  static List<GetPage> routes=[
    GetPage(name: home, page: ()=>HomePage()),
    GetPage(name: locationScreen, page: ()=> LocationScreen()),
    ];
}