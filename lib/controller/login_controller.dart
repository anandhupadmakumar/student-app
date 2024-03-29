import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/controller/home_controller.dart';
import 'package:student_app/controller/profile/profile_controller.dart';
import 'package:student_app/http/http_request.dart';
import 'package:student_app/model/course_details_data_model.dart';

import '../http/http_urls.dart';
import '../model/login_model.dart';
import '../model/login_otp_model.dart';
import '../view/common_widgets/loader.dart';

LoginController loginController = Get.put(LoginController());

class LoginController extends GetxController {
  RxString dashboardRole = ''.obs;
  LoginModel? loginData;
  LoginOtpModel? userData;
  RxBool isUserLogin = false.obs;
  RxBool obsecureText= true.obs;

  void userLogin({required String username, required String password,CourseDetailsModel? courseDetails}) async {
    await HttpRequest.httpGetRequest(
      bodyData: {
        'Email': username,
        'Password': password,
      },
      endPoint: '${HttpUrls.login}/',
    ).then((value) async {
      if (value != null) {
        print('login ${value.data}');
        SharedPreferences preferences = await SharedPreferences.getInstance();
        List data = value.data['0'];

        if (data.isEmpty) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
              SnackBar(content: Text('Invalid UserName/Password')));
        } else {
          preferences.setString('trinity_token', value.data['token']);

          preferences.setString(
              'trinity_student_name', value.data['0'][0]['Student_Name']);
          preferences.setInt(
              'trinity_student_id', value.data['0'][0]['Student_Id']);

              loginController.isUserLogin.value=true;
              if(courseDetails!=null){
                homeController.checkIsCourseIsSelected(courseDetails.courseId);
              }

           profileController.   profileInitFunctions();

          Get.back();
        }

        //sharedprefference
        //token store
        //user id
        //
      }
    });
  }



   logout() async{


     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    loginController.isUserLogin.value = false;

    sharedPreferences.clear();
    Get.back();

  

  }
}
