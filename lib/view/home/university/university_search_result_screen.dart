import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/location_controller.dart';

class UniversityResultScreen extends StatelessWidget {
  const UniversityResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Column(
      children: [
        Text('Bangor University',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w800),),

         Text('United Kingdom',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400)),
      ],
    ),centerTitle: true,),
    body: Container(child:SingleChildScrollView(
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          
          
          children: [
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 15.w),
        
          //   height: 200.h,
          //   width: Get.width,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage(imgUrl))),
        
        
        
        
          // ),
        
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
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(

                
                
                  
                  children: [
                
                  Material(
                    
                    borderRadius: BorderRadius.circular(21.r),
                    elevation: 5,
                    child: Container(

                      padding: EdgeInsets.all(8.sp),
                                    
                      height: 55.h,
                      width: 305.w,
                                    
                                    
                            
                            
                      decoration: BoxDecoration(
                            color: Colors.white,
                            
                            
                        borderRadius: BorderRadius.circular(21.r)
                            
                            
                      ),
                    
                      child: Row(
                       
                        
                        
                        children: [
                    
                        Icon(Icons.star,color: Color(0xFF631BAF),),
                        SizedBox(width: 100.w,),
                    
                        Text('data'),
                         SizedBox(width: 100.w,),
                         Text('data'),
                    
                    
                    
                    
                    
                      ],),
                                    
                                    
                                    
                    ),
                  ),

                    SizedBox(height: 15.h,),
                     Material(
                    
                    borderRadius: BorderRadius.circular(21.r),
                    elevation: 5,
                    child: Container(

                      padding: EdgeInsets.all(8.sp),
                                    
                      height: 55.h,
                      width: 305.w,
                                    
                                    
                            
                            
                      decoration: BoxDecoration(
                            color: Colors.white,
                            
                            
                        borderRadius: BorderRadius.circular(21.r)
                            
                            
                      ),
                    
                      child: Row(
                       
                        
                        
                        children: [
                    
                        Icon(Icons.star,color: Color(0xFF631BAF),),
                        SizedBox(width: 100.w,),
                    
                        Text('data'),
                         SizedBox(width: 100.w,),
                         Text('data'),
                    
                    
                    
                    
                    
                      ],),
                                    
                                    
                                    
                    ),
                  ),
                  SizedBox(height: 15.h,),
                     Material(
                    
                    borderRadius: BorderRadius.circular(21.r),
                    elevation: 5,
                    child: Container(

                      padding: EdgeInsets.all(8.sp),
                                    
                      height: 55.h,
                      width: 305.w,
                                    
                                    
                            
                            
                      decoration: BoxDecoration(
                            color: Colors.white,
                            
                            
                        borderRadius: BorderRadius.circular(21.r)
                            
                            
                      ),
                    
                      child: Row(
                       
                        
                        
                        children: [
                    
                        Icon(Icons.star,color: Color(0xFF631BAF),),
                        SizedBox(width: 100.w,),
                    
                        Text('data'),
                         SizedBox(width: 100.w,),
                         Text('data'),
                    
                    
                    
                    
                    
                      ],),
                                    
                                    
                                    
                    ),
                  ),

                  SizedBox(height: 15.h,),

                   Material(
                    
                    borderRadius: BorderRadius.circular(21.r),
                    elevation: 5,
                    child: Container(

                      padding: EdgeInsets.all(8.sp),
                                    
                      height: 55.h,
                      width: 305.w,
                                    
                                    
                            
                            
                      decoration: BoxDecoration(
                            color: Colors.white,
                            
                            
                        borderRadius: BorderRadius.circular(21.r)
                            
                            
                      ),
                    
                      child: Row(
                       
                        
                        
                        children: [
                    
                        Icon(Icons.star,color: Color(0xFF631BAF),),
                        SizedBox(width: 100.w,),
                    
                        Text('data'),
                         SizedBox(width: 100.w,),
                         Text('data'),
                    
                    
                    
                    
                    
                      ],),
                                    
                                    
                                    
                    ),
                  ),

                    SizedBox(height: 15.h,),
                     Material(
                    
                    borderRadius: BorderRadius.circular(21.r),
                    elevation: 5,
                    child: Container(

                      padding: EdgeInsets.all(8.sp),
                                    
                      height: 55.h,
                      width: 305.w,
                                    
                                    
                            
                            
                      decoration: BoxDecoration(
                            color: Colors.white,
                            
                            
                        borderRadius: BorderRadius.circular(21.r)
                            
                            
                      ),
                    
                      child: Row(
                       
                        
                        
                        children: [
                    
                        Icon(Icons.star,color: Color(0xFF631BAF),),
                        SizedBox(width: 100.w,),
                    
                        Text('data'),
                         SizedBox(width: 100.w,),
                         Text('data'),
                    
                    
                    
                    
                    
                      ],),
                                    
                                    
                                    
                    ),
                  ),
                  SizedBox(height: 15.h,),
                     Material(
                    
                    borderRadius: BorderRadius.circular(21.r),
                    elevation: 5,
                    child: Container(

                      padding: EdgeInsets.all(8.sp),
                                    
                      height: 55.h,
                      width: 305.w,
                                    
                                    
                            
                            
                      decoration: BoxDecoration(
                            color: Colors.white,
                            
                            
                        borderRadius: BorderRadius.circular(21.r)
                            
                            
                      ),
                    
                      child: Row(
                       
                        
                        
                        children: [
                    
                        Icon(Icons.star,color: Color(0xFF631BAF),),
                        SizedBox(width: 100.w,),
                    
                        Text('data'),
                         SizedBox(width: 100.w,),
                         Text('data'),
                    
                    
                    
                    
                    
                      ],),
                                    
                                    
                                    
                    ),
                  ),
                
                
                
                
                ],),
              ),
              SizedBox(height: 15.h,),
        
        
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
      ),)
    
    
    ,);
  }
}