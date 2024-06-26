import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/login_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("GetX tutorial"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              TextFormField(
                controller: controller.emailController.value,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
              TextFormField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(
                  hintText: 'password'
              ),
            ),
            SizedBox(height: 50,),
            Obx((){
              return InkWell (
                onTap: (){
                  controller.loginapi();
                },
                child: controller.loading.value ? CircularProgressIndicator(): Container(
                  height: 45,
                  color: Colors.green,
                  child: Center(
                    child: Text("LOGIN"),
                  ),
                ),
              );
            })
          ],
        ),
      ),

    );
  }
}
