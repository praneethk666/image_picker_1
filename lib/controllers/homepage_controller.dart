// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController{
  String selectedpath = '';
   @override
  void onInit() {
    super.onInit();
    
  }
  selecFromCamera() async{
   XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera);
    if (file != null) {
      update();
      return file.path;
    } else {
      update();
      return '';
    }
    
  }
  Future getLostData() async {
  final LostDataResponse response =
      await ImagePicker().retrieveLostData();
  if (response.files != null) {
     for (final XFile file in response.files!) {
     selectedpath = file.path;
     update();
    }
  }else{
    update();
    return '';
  }
}
  selectFromGallery() async {
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(file!= null){
    update();
    return file.path;
  }else{
    update();
    return '';
  }
}
removeImage(){
  return IconButton(onPressed: (){
    selectedpath='';
    update();
  }, icon: const Icon(Icons.close,color: Colors.white,));
}
 
   Future selectImage(BuildContext context1){
  return showDialog(
        context: context1,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children:  [ const Text(
                      'Select Image From!',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      OutlinedButton(onPressed: ()async{
                        selectedpath = await selectFromGallery();
                        if(selectedpath!=''){
                          //Navigator.pop(context);
                          Get.back();
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));

                        }
                      }, child:const Icon(Icons.photo_sharp)),
                      OutlinedButton(onPressed: ()async{
                        selectedpath = await selecFromCamera();
                        
                        if(selectedpath!= ''){
                          Get.back(); 
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("No Image Captured !"),
                              ));

                        }
                      }, child:const Icon(Icons.camera_alt_sharp)),
                    ],)]))));});}
   
}



