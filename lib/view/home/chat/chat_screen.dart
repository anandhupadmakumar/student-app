import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/controller/home_controller.dart';

import '../../../controller/login_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   const Color.fromARGB(255, 238, 237, 237),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(Icons.abc),
            ),
            Text('Please login to start chat',),
            InkWell(
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (ctx) => Container(
                      padding: EdgeInsets.all(15.sp),
                          height: 300.h,
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r))),
                          child: Column(
                          
                            children: [

                              SizedBox(height: 20.h,),
                              Container(
                                width: 20.w,
                                height: 2.h,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 15.h,),

                              Text('Login or SignUp',style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w800),),
                              SizedBox(height: 15.h,),
                              TextFormField( 
                                controller: homeController.loginMobController,
                               
                              
                                decoration: InputDecoration(border: OutlineInputBorder()),
                              
                              
                              
                              ),
                              SizedBox(height: 15.h,),
                              InkWell(
                                onTap: (){

                                  loginController.getOtp(mobileNumber:homeController.loginMobController.text,context: context);



                                },
                                child: Container(
                                                width: 200.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20.r),
                                                  color: Colors.purple,
                                                ),
                                                child:const  Center(
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
              },
              child: Container(
                width: 200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child: Center(
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
