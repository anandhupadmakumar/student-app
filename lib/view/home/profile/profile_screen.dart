import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/login_controller.dart';
import '../../../controller/profile/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
   profileController.getStudentDetails();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),

      body:  loginController.isUserLogin.value==true?
      
      
      
      
      
      Container(child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        
        
        children: [
         

        const Image(image: AssetImage('assets/Account-rafiki.png')),
        

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
                               
                              
                                decoration: const InputDecoration(border: OutlineInputBorder()),
                              
                              
                              
                              ),
                              SizedBox(height: 15.h,),
                              InkWell(
                                onTap: (){

                                  // loginController.getOtp(mobileNumber:homeController.loginMobController.text,context: context);



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
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )









      
      
      
      
      ],),):Container(

        padding: EdgeInsets.symmetric(horizontal: 15.w),
        
        child: SingleChildScrollView(
          child: Column(children: [
          ClipRRect(
          
          
          borderRadius: BorderRadius.circular(20.r),
            child:ExpansionTile(
              // shape:OutlineInputBorder(),
              tilePadding: EdgeInsets.all(20.w),
              collapsedBackgroundColor: Colors.white,
            
              leading: CircleAvatar(
            
                radius: 50.r,
                
                child: const Center(child: Icon(Icons.person),),),
              
              
              title: const Text('Profile'),

            
            
            
            
            
            
            
            trailing: const Icon(Icons.keyboard_arrow_down_rounded),
            
            
            children: [
              const Text('Student Name'),
              SizedBox(height: 10.h,),
              Container(

                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField(
                  controller: profileController.studentNameController,
                
                  decoration: InputDecoration(
                
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                
                
                
                  ),
                
                
                ),
              ),

                SizedBox(height: 10.h,),


               const Text('Gender'),
                 SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( 

                controller:  profileController.studentGenderController,
                  
                  decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),
                SizedBox(height: 10.h,),


                const Text('Address'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( 

                    controller:  profileController.studentAddressController,
                  
                  
                  decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),
                SizedBox(height: 10.h,),


              
                const Text('Contact No'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( 

                  controller:   profileController.studentContactNoController,
                  
                  
                  decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),
                SizedBox(height: 10.h,),

                const Text('Email ID'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField(

                  controller:    profileController.studentEmailController, 
                  
                  
                   decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),
                SizedBox(height: 10.h,),


              const Text('DOB'),
                SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField(


                 controller:   profileController.studentDobController,
                  
                  
                   decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),
              SizedBox(height: 20.h,),


              InkWell(onTap: (){

                profileController.updateStudent();



              },

              child:Container(
                width: 200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child:const  Center(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              
              
              
              ),
                   SizedBox(height: 20.h,),










            ],),
          
          
          
          ),
          
          SizedBox(height: 20.h,),
           ClipRRect(
          
          
          borderRadius: BorderRadius.circular(20.r),
            child:ExpansionTile(
              // shape:OutlineInputBorder(),
              tilePadding: EdgeInsets.all(20.w),
              collapsedBackgroundColor: Colors.white,
            
              leading: CircleAvatar(
            
                radius: 50.r,
                
                child: const Center(child: Icon(Icons.person),),),
              
              
              title: const Text('Qualification'),
            
            
            
            
            
            
            
            trailing: const Icon(Icons.keyboard_arrow_down_rounded),
            
            // backgroundColor: Colors.red,
            children: [


              InkWell(onTap: (){


                                  profileController.isAddQualification.value=true;




              },

              child:Container(
                width: 200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child:const  Center(
                  child: Text(
                    'Add Qualification Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              
              
              
              ),
                   SizedBox(height: 20.h,),


                   Obx(
                     ()=> profileController.isAddQualification.value? Container(
                     
                      child: Column(children: [
                     
                     
                          const Text('Class/Level'),
                                       SizedBox(height: 10.h,),
                                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                                     child: TextField( 
                     
                                       controller: profileController.studentClasscontroller,
                                       
                                       
                                       
                                       
                                       decoration: InputDecoration(
                                       
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                                       
                                       
                                       
                      ),),
                                   ),
                                   SizedBox(height: 10.h,),
                                    const Text('Field'),
                                       SizedBox(height: 10.h,),
                                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                                     child: TextField( 
                     
                                       controller: profileController.studentFieldcontroller,
                                       
                                       
                                       
                                       decoration: InputDecoration(
                                       
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                                       
                                       
                                       
                      ),),
                                   ),
                     
                     
                     
                                    SizedBox(height: 10.h,),
                                    const Text('College'),
                                       SizedBox(height: 10.h,),
                                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                                     child: TextField( 
                                       
                                       
                                       controller: profileController.studentCollegecontroller,
                                       decoration: InputDecoration(
                                       
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                                       
                                       
                                       
                      ),),
                                   ),
                     
                     
                                    SizedBox(height: 10.h,),
                                    const Text('Specification'),
                                       SizedBox(height: 10.h,),
                                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                                     child: TextField( 
                     
                                       controller: profileController.studentSpecificationController,
                                       
                                       
                                       
                                       decoration: InputDecoration(
                                       
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                                       
                                       
                                       
                      ),),
                                   ),
                     
                     
                     
                                    SizedBox(height: 10.h,),
                                    const Text('From Year'),
                                       SizedBox(height: 10.h,),
                                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                                     child: TextField( 
                     
                                       controller: profileController.studentFromYearcontroller,
                                       
                                       
                                       
                                       decoration: InputDecoration(
                                       
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                                       
                                       
                                       
                      ),),
                                   ),
                     
                                     SizedBox(height: 10.h,),
                                    const Text('To Year'),
                                       SizedBox(height: 10.h,),
                                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                                     child: TextField( 
                     
                                       controller: profileController.studentToYearController,
                                       
                                       
                                       
                                       decoration: InputDecoration(
                                       
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                                       
                                       
                                       
                      ),),
                                   ),
                     
                     
                                    SizedBox(height: 10.h,),
                                    const Text('Percentage'),
                                       SizedBox(height: 10.h,),
                                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                                     child: TextField( 
                     
                                       controller: profileController.studentPercentageController,
                                       
                                       
                                       
                                       decoration: InputDecoration(
                                       
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                                       
                                       
                                       
                      ),),
                                   ),
                     
                                   SizedBox(height: 20.h,),
                       SizedBox(height: 20.h,),




                     Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   InkWell(onTap: (){

                    profileController.saveQualificationDetails();




                   },
                   
                                 child:Container(
                    width: 150.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.purple,
                    ),
                    child:const  Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                                 ),
                                 
                                 
                                 
                                 ),


                                 SizedBox(width: 15.w,),
                                 InkWell(onTap: (){

                                  profileController.isAddQualification.value=false;




                                 },

              child:Container(
                width: 150.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child:const  Center(
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              
              
              
              ),
                    
                 ],
               ),

                   SizedBox(height: 20.h,),
                      
                      
                      
                      
                      
                      ],),
                     
                     
                     
                     ):Container(),
                   ),


                     SizedBox(
                      width: Get.width,
                      height: 160.h,
                       child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                         children:List.generate(5,(index)=>Container(
                          margin: EdgeInsets.only(right: 15.w),
                          padding: EdgeInsets.all(15.w),
                                         
                         
                                         width: 200.w,
                         
                                         decoration: BoxDecoration(
                         
                                           color: Colors.amber,
                                           
                                           
                                           borderRadius: BorderRadius.circular(20.r)),
                                         
                                         
                                         
                                     
                         
                                         child: Column(
                         
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           
                                           
                                           children: [
                         
                                           
                          Text('Class/Level : class'),
                          SizedBox(width: 50.w,),
                           Text('Field : field'),
                           
                           
                                             
                          
                           Text('College : College'),
                                             
                          Text('Specification : College'),
                            
                                         
                         
                         
                          
                             Text('From Year : College'),
                          
                             Text('To Year : College'),
                                         
                         
                         
                         
                         
                         
                         
                                          
                                         
                                         
                                         
                                         
                                         
                                         ],),
                                         
                                         
                                         
                                         )),
                       ),
                     ),

                SizedBox(height: 20.h,),



                   


                    InkWell(onTap: (){

                      profileController.isAddWorkExperience.value=true;





                    },

              child:Container(
                width: 200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child:const  Center(
                  child: Text(
                    'Add Work Experience',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              
              
              
              ),

                   SizedBox(height: 20.h,),



               Obx(
                 ()=>  profileController.isAddWorkExperience.value?Container(
                 
                      child: Column(children: [
                 
                 
                          const Text('Company Name'),
                    SizedBox(height: 10.h,),
                               Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TextField( 
                    controller: profileController.workCompanyNameController,
                    
                    
                    
                    decoration: InputDecoration(
                    
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                    
                    
                    
                      ),),
                               ),
                               SizedBox(height: 10.h,),
                 const Text('Designation'),
                    SizedBox(height: 10.h,),
                               Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TextField( 
                    controller: profileController.workDesignationController,
                    
                    decoration: InputDecoration(
                    
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                    
                    
                    
                      ),),
                               ),
                 
                 
                 
                 SizedBox(height: 10.h,),
                 const Text('Salary(Monthly)'),
                    SizedBox(height: 10.h,),
                               Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TextField( 
                    controller: profileController.workSalaryController,
                    
                    
                    
                    
                    decoration: InputDecoration(
                    
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                    
                    
                    
                      ),),
                               ),
                 
                 
                              
                 
                 
                 
                 SizedBox(height: 10.h,),
                 const Text('From Year'),
                    SizedBox(height: 10.h,),
                               Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TextField( 
                    controller: profileController.wrokFromYearcontroller,
                    
                    
                    
                    decoration: InputDecoration(
                    
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                    
                    
                    
                      ),),
                               ),
                 
                  SizedBox(height: 10.h,),
                 const Text('To Year'),
                    SizedBox(height: 10.h,),
                               Container(
                     margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TextField( 
                    controller:profileController.workToYearController ,

                    
                    decoration: InputDecoration(
                    
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                    
                    
                    
                      ),),
                               ),
                 
                 
                               
                 
                               SizedBox(height: 20.h,),
                 
                 
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     InkWell(onTap: (){
                 
                      profileController.saveWorkExperience();
                 
                 
                 
                 
                     },
                     
                                   child:Container(
                      width: 150.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.purple,
                      ),
                      child:const  Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                                   ),
                                   
                                   
                                   
                                   ),
                 
                 
                                   SizedBox(width: 15.w,),
                                   InkWell(onTap: (){
                 
                                    profileController.isAddWorkExperience.value=false;
                 
                 
                 
                 
                                   },
                 
                               child:Container(
                  width: 150.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.purple,
                  ),
                  child:const  Center(
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                               ),
                               
                               
                               
                               ),
                      
                   ],
                 ),
                      
                      
                      
                      
                               SizedBox(height: 20.h,),
                      
                      
                      ],),
                 
                 
                 
                 ):Container(),
               ),



             
              













            ],),
          
          
          
          ),
          SizedBox(height: 20.h,),
           ClipRRect(
          
          
          borderRadius: BorderRadius.circular(20.r),
            child:ExpansionTile(
              shape:const OutlineInputBorder(),
              tilePadding: EdgeInsets.all(20.w),
              collapsedBackgroundColor: Colors.white,
            
              leading: CircleAvatar(
            
                radius: 50.r,
                
                child: const Center(child: Icon(Icons.person),),),
              
              
              title: const Text('Language'),
            
            // backgroundColor: Colors.red,
            
            
            
            
            
            
            
            trailing: const Icon(Icons.keyboard_arrow_down_rounded),
            children:[



              InkWell(onTap: (){},

              child:Container(
                width: 200.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child:const  Center(
                  child: Text(
                    'Add Language Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              
              
              
              ),
                   SizedBox(height: 20.h,),


                   Container(

                    child: Column(children: [


                        const Text('Exam'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),
              SizedBox(height: 10.h,),
               const Text('Exam Date'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),



               SizedBox(height: 10.h,),
               const Text('GRE/GMAT Score'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),


               SizedBox(height: 10.h,),
               const Text('Listening'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),



               SizedBox(height: 10.h,),
               const Text('NEET Score'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),

                SizedBox(height: 10.h,),
               const Text('Reading'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),


               SizedBox(height: 10.h,),
               const Text('IELTS Score'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),


               SizedBox(height: 10.h,),
               const Text('Writing'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),


              SizedBox(height: 10.h,),
               const Text('Speaking'),
                  SizedBox(height: 10.h,),
              Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextField( decoration: InputDecoration(
                  
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular( 5.r))
                  
                  
                  
                    ),),
              ),

              SizedBox(height: 20.h,),


               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   InkWell(onTap: (){},
                   
                                 child:Container(
                    width: 150.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.purple,
                    ),
                    child:const  Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                                 ),
                                 
                                 
                                 
                                 ),


                                 SizedBox(width: 15.w,),
                                 InkWell(onTap: (){},

              child:Container(
                width: 150.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.purple,
                ),
                child:const  Center(
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              
              
              
              ),
                    
                 ],
               ),



                
                    
                    
                    
                    
                    
                    ],),



                   ),


                    SizedBox(height: 20.h,),





            ],),
          
          
          
          ),
           SizedBox(height: 20.h,),
           ClipRRect(
          
          
          borderRadius: BorderRadius.circular(20.r),
            child:ExpansionTile(
              shape:const OutlineInputBorder(),
              tilePadding: EdgeInsets.all(20.w),
              collapsedBackgroundColor: Colors.white,
            
              leading: CircleAvatar(
            
                radius: 50.r,
                
                child: const Center(child: Icon(Icons.person),),),
              
              
              title: const Text('Application'),
            
            backgroundColor: Colors.red,
            children: List.generate(5, (index) => const Text('data')),
            
            
            
            
            
            
            
            trailing: const Icon(Icons.keyboard_arrow_down_rounded),),
          
          
          
          ),
          SizedBox(height: 20.h,),
           ClipRRect(
          
          
          borderRadius: BorderRadius.circular(20.r),
            child:ExpansionTile(
              shape:const OutlineInputBorder(),
              tilePadding: EdgeInsets.all(20.w),
              collapsedBackgroundColor: Colors.white,
            
              leading: CircleAvatar(
            
                radius: 50.r,
                
                child: const Center(child: Icon(Icons.person),),),
              
              
              title: const Text('Document'),
            
            backgroundColor: Colors.red,
            children: List.generate(5, (index) => const Text('data')),
            
            
            
            
            
            
            
            trailing: const Icon(Icons.keyboard_arrow_down_rounded),),
          
          
          
          )
                
                
                
                
                
                
                ],),
        ),),









    );
  }
}