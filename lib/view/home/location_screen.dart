import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/location_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key,required this. title,required this.imgUrl,required this.universityCount});

  final String title;
  final String imgUrl;

  final String universityCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Column(
          children: [
            Text(title),
            SizedBox(height: 10.h,),
             Text('$universityCount universities',style: TextStyle(fontSize: 12.sp),),
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imgUrl))),
        
        
        
        
          ),
        
          SizedBox(height: 20.h,),
        
        
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Obx(()=> ConstrainedBox(constraints:locationController.showMoreFlag.value ?BoxConstraints(maxHeight: 65.h): const BoxConstraints(),child: 
          
          
          RichText(text: TextSpan(children: [
          TextSpan(text: locationController.locationContent),
          
          
          // TextSpan(text:locationController.showMoreFlag.value?'Show More':'Show Less',style: TextStyle(color: Colors.blue),  recognizer:  TapGestureRecognizer()
          //                     ..onTap = () {
          
          
          
          
          //                         locationController.showMoreFlag.value=!locationController.showMoreFlag.value;
          
          // if(locationController.showMoreFlag.value){
          //   locationController.locationContent.substring(0,10);
          // }else{
          //   locationController.locationContent=locationController.locationContent;
          // }
          
          
          //                     })
          
          ]))
          
          
          
          
          // Text('Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', softWrap: true,
          //         ),
          )
          
          ),
        ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Obx(
                  ()=> TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50.w, 30.h),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                    
                    
                    onPressed: (){
                  
                    locationController.showMoreFlag.value=!locationController.showMoreFlag.value;
                  
                  }, child: Text(locationController.showMoreFlag.value?'Show More':'Show Less')),
                ),
              ),
        
              SizedBox(height: 20.h,),
        
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
        
        
                      borderRadius: BorderRadius.circular(15.r)
        
        
                    ),
                
                
                
                  ),
                     Container(
                
                    height: 100.h,
                    width: 170.w,
                
                    decoration: BoxDecoration(
                          color: Colors.amber,
        
        
                      borderRadius: BorderRadius.circular(15.r)
        
        
                    ),
                
                
                
                
                  ),
                     Container(
                
                    height: 100.h,
                    width: 170.w,
                
                    decoration: BoxDecoration(
                          color: Colors.amber,
        
        
                      borderRadius: BorderRadius.circular(15.r)
        
        
                    ),
                
                
                
                
                  )
                
                
                
                
                
                ],),
              ),
              SizedBox(height: 20.h,),
        
        
              Container(
        
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                
                
                child: Text('Trending Subjects')),
        
        
                SizedBox(
        
                  height: 60.h,
                  child: ListView(

                    scrollDirection: Axis.horizontal,
                    
                    
                    children: List.generate(10,(index)=>
                      
                  
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                  
                    padding: EdgeInsets.all(12.sp),
                  
                    decoration: BoxDecoration(
                  
                      color: Colors.amber,
                      
                      
                      borderRadius: BorderRadius.circular(20.r),),
                  
                  
                  child: Center(child: Text('sdffffff')),
                  
                  ),
                  
                  
                  
                  
                  
                  
                  ),),
                )
        
        
        
              
        
        
        
        
        
        
        ],),
      ),





    ),);
  }
}