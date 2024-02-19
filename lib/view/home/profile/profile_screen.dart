import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/login_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),

      body: Container(child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        
        
        children: [

        Image(image: AssetImage('assets/Account-rafiki.png')),
        

        SizedBox(

          width: 250.w,
          
          child: Text('Please create an account and complete ypur profile so that e can give you a better study abroad experience',

          textAlign: TextAlign.center,
          
          style: TextStyle(fontSize: 12.sp),)),



         SizedBox(height: 15.h,),
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









      
      
      
      
      ],),),









    );
  }
}