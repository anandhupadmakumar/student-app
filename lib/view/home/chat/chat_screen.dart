import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trinity/controller/home_controller.dart';

import '../../../controller/login_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Icon(Icons.abc),
            ),
            const Text(
              'Please login to start chat',
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Builder(builder: (context) {
                return Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: InkWell(
                    onTap: () {
                      if (loginController.isUserLogin.value == true) {
                        //apply function
                      } else {
                        showBottomSheet(
                            context: context,
                            builder: (ctx) => Container(
                                  padding: EdgeInsets.all(15.sp),
                                  height: 300.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r))),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        width: 20.w,
                                        height: 2.h,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        'Login or SignUp',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      TextFormField(
                                        controller: homeController
                                            .loginUserNameController,
                                        decoration: InputDecoration(
                                            hintText: 'Email',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r))),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      TextFormField(
                                        controller:
                                            homeController.loginMobController,
                                        decoration: InputDecoration(
                                            hintText: 'Password',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r))),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          loginController.userLogin(
                                              username: homeController
                                                  .loginUserNameController.text,
                                              password: homeController
                                                  .loginMobController.text);

                                          // loginController.getOtp(mobileNumber:homeController.loginMobController.text,context: context);
                                        },
                                        child: Container(
                                          width: 200.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: Colors.purple,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Continue',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                      }

                      // loginController.getOtp(mobileNumber:homeController.loginMobController.text,context: context);
                    },
                    child: Container(
                      width: 200.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.purple,
                      ),
                      child: const Center(
                        child: Text(
                          'Apply Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            InkWell(
              onTap: () {
                loginBottomSheetWidget(context);
              },
              child: Container(
                width: 200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

PersistentBottomSheetController<dynamic> loginBottomSheetWidget(
    BuildContext context) {
  return showBottomSheet(
      context: context,
      builder: (ctx) => Container(
            padding: EdgeInsets.all(15.sp),
            height: 300.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 20.w,
                  height: 2.h,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Login or SignUp',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  controller: homeController.loginMobController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    // loginController.getOtp(mobileNumber:homeController.loginMobController.text,context: context);
                  },
                  child: Container(
                    width: 200.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.purple,
                    ),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
}
