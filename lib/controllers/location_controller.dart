
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationServices extends GetxController{
   final Location loc = Location();
   bool isLoading = false;
   static late PermissionStatus permissionStatus;
   LocationData? locationData;
   /// checks location is on or off 
   static late bool serviceEnabled;

/// checks permission for location service
   Future<void>getLocationServices() async{
    permissionStatus = await loc.hasPermission();
    if(permissionStatus== PermissionStatus.denied){
      permissionStatus = await loc.requestPermission();
    }
    serviceEnabled = await loc.serviceEnabled();
    if(serviceEnabled== false){
      serviceEnabled = await loc.requestService();
      }
      if(serviceEnabled){
        getLocation();
      }  
    }


    Future<void> urlLauncher() async{
      final Uri _url = Uri.parse("https://www.google.com/maps/dir/${locationData!.latitude},${locationData!.longitude}/Goa/@16.3119895,75.0338239,8z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x3bbfba106336b741:0xeaf887ff62f34092!2m2!1d74.123996!2d15.2993265");
      if(!await launchUrl(_url,mode: LaunchMode.platformDefault)){
        throw "could not launch url";
      }
    }
    Future<void>getLocation()async{
      locationData = await loc.getLocation();
      update();
      
    }
    

    
  }
