import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/image_picker_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ImagePickerController controller = Get.put(ImagePickerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("GetX tutorial"),
      ),
      body: Obx(()=> Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: controller.imagePath.isNotEmpty ?
                FileImage(File(controller.imagePath.toString())) : null
              ),
            ),
            TextButton(onPressed: (){
              controller.getImage();
            }, child: Text('Pick Image'))
        ],
      )
      )
    );
  }
}
