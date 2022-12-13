// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_1/controllers/location_controller.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);
  final LocationServices locationcontroller = Get.put(LocationServices());
  final String imagepath = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: const Text("LOcation Services")),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 27,),
          Stack(children: [
            Image.file(
              File(
                imagepath,
              ),
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            )
          ]),
          const SizedBox(height: 20,),
          OutlinedButton(
              onPressed: () {
                locationcontroller.getLocationServices();
                //   locationcontroller.getLocation();
              },
              child: const Icon(Icons.location_on_sharp)),
              const SizedBox(height: 20,),
          GetBuilder<LocationServices>(builder: (controller2) {
            return Container(
              color:const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Text(controller2.locationData != null
                      ? "longitude : ${controller2.locationData!.longitude}"
                      : "longitude : Not available",style: const TextStyle(fontWeight: FontWeight
                      .bold),),
                  Text(controller2.locationData != null
                      ? "latitude : ${controller2.locationData!.latitude}"
                      : "latitude : Not available",style: const TextStyle(fontWeight: FontWeight
                      .bold))
                ],
              ),
            );
          }),
          const SizedBox(height: 20,),
          OutlinedButton(onPressed: (){
            locationcontroller.urlLauncher();
          }, child: const Text("show in maps"))
        ],
      )),
    );
  }
}
