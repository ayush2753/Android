
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading =false.obs;

  Future <void> loginapi() async {
    loading.value = true;

    try {
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {
            "email" : emailController.value.text,
            "password" : passwordController.value.text
          });

      var data = jsonDecode(response.body);

      if(response.statusCode == 200){
        loading.value = false;
        Get.snackbar("Login Success", "Congratulations",backgroundColor: Colors.blue);
      }else{
        loading.value = false;
        Get.snackbar("Login Failed", data["error"],backgroundColor: Colors.red);
      }
    }catch(e){
      loading.value = false;
      Get.snackbar("Exception", e.toString());
    }
  }
}