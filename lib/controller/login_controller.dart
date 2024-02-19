import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/controller/home_controller.dart';
import 'package:student_app/http/http_request.dart';

import '../http/http_urls.dart';
import '../model/login_model.dart';
import '../model/login_otp_model.dart';
import '../view/common_widgets/loader.dart';
LoginController loginController=Get.put(LoginController());

class LoginController extends GetxController{

  RxString dashboardRole=''.obs;
 LoginModel? loginData;
 LoginOtpModel? userData;

  void getOtp({required String mobileNumber, required context}) async {
    Loader.showLoader();
    await HttpRequest.httpGetRequest(endPoint: HttpUrls.getOtp, bodyData: {
      "phone": mobileNumber,
    }).then((value) {
      if (value.statusCode == 200) {
        Loader.stopLoader();
        if (jsonDecode(value.toString())['Data'].isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Phone Number not found')));
        } else {
          final data = jsonDecode(value.toString());

          loginData = LoginModel.fromJson(data['Data'][0]);

dashboardRole.value = loginData?.customerType??
'';

          if (loginData != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Otp: ${loginData!.customerOtp}')));
          }
          Get.back();
          showBottomSheet(
            
             backgroundColor: Colors.white,context: context, builder: (ctx)=> Container(
            height: 300,
            child: Column(
              children: [
               
               
                  
                Expanded(
                  child: Container(
                    padding:const  EdgeInsets.symmetric(horizontal: 30),
                    decoration:const  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        const   SizedBox(height: 20,),
                              Container(
                                width: 20,
                                height: 2,
                                color: Colors.grey,
                              ),
                            const   SizedBox(height: 15,),
                        // SizedBox(
                        //     child: Image.asset(
                        //   'assets/images/login_otp_img.png',
                        // )),
                        Pinput(
                          controller: homeController.pinPutOtpController,
                          onCompleted: (value) {
                            if (value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Enter the otp ')));
                            } else {
                          agentLogin(
                                  otp: value, context: context);
                            }
                          },
                        ),
                        SizedBox(
                          height: 34,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn’t receive the OTP ?",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                             
                                  homeController.pinPutOtpController.clear();
            
                                  loginController.getOtp(
                                      mobileNumber: homeController
                                          .loginMobController.text,
                                      context: context);
                                }
                                
                              ,
                              icon: Text(
                                "Resend OTP",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),);

          // Get.to(() => const OtpScreen());
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Server Error')));
      }
    });
  }



  
  void agentLogin({required String otp, required context}) async {
    Loader.showLoader();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String firebaseToken = '';
  

    // print('firbase login token $firebaseToken');

    await HttpRequest.httpGetRequest(endPoint: HttpUrls.agentLogin, bodyData: {
      "phone":homeController.loginMobController .text,
      "otp": otp,
      "Device_Id": firebaseToken,
    }).then((value) {

      if (value.statusCode == 200) {
        Loader.stopLoader();
        final data = jsonDecode(value.toString());

        if (data['0'][0]['Id'].toString() == '0') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Incorrect OTP')));
        homeController.  pinPutOtpController.clear();
        } else {
          userData = LoginOtpModel.fromJson(data['0'][0]);
          preferences.setString('token', '${data['token']}');
          //    preferences.setString('token', '${data['token']}');
          preferences.setString('darlsco_id', data['0'][0]['Id'].toString());
          preferences.setString('type', data['0'][0]['tp'].toString());
          //   preferences.setString('token', '${data['token']}');
       
        dashboardRole.value = userData?.customerType??'';
          switch (dashboardRole.value) {
            case 'user':
            print('user');
          Get.back();
             
              break;
            case 'customer':
            print('customer');
            Get.back();
             
              break;
            default:
              
          }
          homeController.loginMobController.clear();
          homeController.pinPutOtpController.clear();

          // Get.offAll(() => const BottomNavigationScreen());
        }

        // Get.to(() => const BottomNavigationScreen());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Server Error')));
      }
    });
  }



}