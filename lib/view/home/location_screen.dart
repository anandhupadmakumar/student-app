import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trinity/controller/location_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.description});

  final String title;
  final String imgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(title),
            SizedBox(
              height: 10.h,
            ),
            //  Text('$universityCount universities',style: TextStyle(fontSize: 12.sp),),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                height: 200.h,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imgUrl))),
              ),

              SizedBox(
                height: 20.h,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(description),
              ),

              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 15.w),
              //   child: Obx(
              //     ()=> TextButton(
              //       style: TextButton.styleFrom(
              //         padding: EdgeInsets.zero,
              //         minimumSize: Size(50.w, 30.h),
              //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //         alignment: Alignment.centerLeft),

              //       onPressed: (){

              //       locationController.showMoreFlag.value=!locationController.showMoreFlag.value;

              //     }, child: Text(locationController.showMoreFlag.value?'Show More':'Show Less')),
              //   ),
              // ),

              SizedBox(
                height: 20.h,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Wrap(
                  runSpacing: 20.h,
                  spacing: 20.w,
                  children: [
                    Container(
                      height: 100.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Text('Intake'),
                      ),
                    ),
                    Container(
                      height: 100.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Text('duration'),
                      ),
                    ),
                    //    Container(

                    //   height: 100.h,
                    //   width: 170.w,

                    //   decoration: BoxDecoration(
                    //         color: Colors.amber,

                    //     borderRadius: BorderRadius.circular(15.r)

                    //   ),

                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // Container(

              //   margin: EdgeInsets.symmetric(horizontal: 15.w),

              //   child: Text('Trending Subjects')),

              //   SizedBox(

              //     height: 60.h,
              //     child: ListView(

              //       scrollDirection: Axis.horizontal,

              //       children: List.generate(10,(index)=>

              //     Container(
              //       margin: EdgeInsets.only(left: 20.w),

              //       padding: EdgeInsets.all(12.sp),

              //       decoration: BoxDecoration(

              //         color: Colors.amber,

              //         borderRadius: BorderRadius.circular(20.r),),

              //     child: Center(child: Text('sdffffff')),

              // ),

              // ),),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
