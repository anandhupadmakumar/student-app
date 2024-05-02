import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/http/http_urls.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/login_controller.dart';
import '../../../controller/profile/profile_controller.dart';
import '../../common_widgets/date_picker_widget.dart';
import '../widgets/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    if (loginController.isUserLogin.value == true) {
      profileController.profileInitFunctions();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Obx(
        () => SizedBox(
            child: loginController.isUserLogin.value == false
                ? Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                              image: AssetImage('assets/Account-rafiki.png')),
                          SizedBox(
                              width: 250.w,
                              child: Text(
                                'Please create an account and complete ypur profile so that e can give you a better study abroad experience',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.sp),
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: () {
                              showBottomSheet(
                                  context: context,
                                  builder: (ctx) => Container(
                                        padding: EdgeInsets.all(15.sp),
                                        height: 350.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.r),
                                                topRight:
                                                    Radius.circular(20.r))),
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
                                            Obx(
                                              () => TextFormField(
                                                obscureText: loginController
                                                    .obsecureText.value,
                                                controller: homeController
                                                    .loginMobController,
                                                decoration: InputDecoration(
                                                    hintText: 'Password',
                                                    suffixIcon: IconButton(
                                                        onPressed: () {
                                                          if (loginController
                                                                  .obsecureText
                                                                  .value ==
                                                              false) {
                                                            loginController
                                                                .obsecureText
                                                                .value = true;
                                                          } else {
                                                            loginController
                                                                .obsecureText
                                                                .value = false;
                                                          }
                                                        },
                                                        icon: loginController
                                                                    .obsecureText
                                                                    .value ==
                                                                false
                                                            ? Icon(
                                                                Icons
                                                                    .visibility,
                                                                size: 18.sp,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .visibility_off,
                                                                size: 18.sp,
                                                              )),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                loginController.userLogin(
                                                    username: homeController
                                                        .loginUserNameController
                                                        .text,
                                                    password: homeController
                                                        .loginMobController
                                                        .text);

                                                // loginController.getOtp(mobileNumber:homeController.loginMobController.text,context: context);
                                              },
                                              child: Container(
                                                width: 200.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
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
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    // height: Get.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: ExpansionTile(
                              // shape:OutlineInputBorder(),
                              tilePadding: EdgeInsets.all(20.w),
                              collapsedBackgroundColor: Colors.white,

                              leading: CircleAvatar(
                                radius: 50.r,
                                child: const Center(
                                  child: Icon(Icons.person),
                                ),
                              ),

                              title: const Text('Profile'),

                              trailing:
                                  const Icon(Icons.keyboard_arrow_down_rounded),

                              children: [
                                const Text('Student Name'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: TextField(
                                    controller:
                                        profileController.studentNameController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text('Gender'),
                                SizedBox(
                                  height: 10.h,
                                ),

                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: DropdownButtonFormField(
                                      iconDisabledColor: Colors.grey,
                                      iconEnabledColor: Colors.black,
                                      value: profileController
                                                  .profileGenderDropDownValue
                                                  .value ==
                                              ''
                                          ? 'Select'
                                          : profileController
                                              .profileGenderDropDownValue.value,
                                      style:
                                          TextStyle(fontSize: 12.sp, height: 1),
                                      decoration: InputDecoration(
                                          isDense: true,
                                          //  contentPadding: EdgeInsets.all(13),
                                          // hintText: data.inspectionDropdownValue.value
                                          //     .isEmpty? 'Location':'',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r))),
                                      onChanged: (value) {
                                        if (value != null) {
                                          profileController
                                              .profileGenderDropDownValue
                                              .value = value;
                                        }
                                      },
                                      hint: Text(
                                        'Select',
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                      items: ['Select', 'Male', 'Female']
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e.toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.black),
                                                ),
                                              ))
                                          .toList()),
                                ),
                                // Container(
                                //   margin:
                                //       EdgeInsets.symmetric(horizontal: 15.w),
                                //   child: TextField(
                                //     controller: profileController
                                //         .studentGenderController,
                                //     decoration: InputDecoration(
                                //         border: OutlineInputBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(5.r))),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text('Address'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: TextField(
                                    controller: profileController
                                        .studentAddressController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text('Contact No'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: TextField(
                                    controller: profileController
                                        .studentContactNoController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text('Email ID'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: TextField(
                                    controller: profileController
                                        .studentEmailController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text('DOB'),
                                SizedBox(
                                  height: 10.h,
                                ),

                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: datepickerWidget(
                                        context: context,
                                        datePickController: profileController
                                            .studentDobController,
                                        labelText: 'Select DOB',
                                        titleText: '')),
                                // Container(
                                //   margin:
                                //       EdgeInsets.symmetric(horizontal: 15.w),
                                //   child: TextField(
                                //     controller:
                                //         profileController.studentDobController,
                                //     decoration: InputDecoration(
                                //         border: OutlineInputBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(5.r))),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (profileController.studentNameController.text.isNotEmpty &&
                                        profileController
                                            .studentGenderController
                                            .text
                                            .isNotEmpty &&
                                        profileController
                                            .studentAddressController
                                            .text
                                            .isNotEmpty &&
                                        profileController
                                            .studentContactNoController
                                            .text
                                            .isNotEmpty &&
                                        profileController.studentEmailController
                                            .text.isNotEmpty &&
                                        profileController.studentDobController
                                            .text.isNotEmpty) {
                                      profileController.updateStudent();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Please fill all the fields')));
                                    }
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
                                        'Save',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: SizedBox(
                              child: ExpansionTile(
                                // shape:OutlineInputBorder(),
                                tilePadding: EdgeInsets.all(20.w),
                                collapsedBackgroundColor: Colors.white,

                                leading: CircleAvatar(
                                  radius: 50.r,
                                  child: const Center(
                                    child: Icon(Icons.person),
                                  ),
                                ),

                                title: const Text('Qualification'),

                                trailing: const Icon(
                                    Icons.keyboard_arrow_down_rounded),

                                // backgroundColor: Colors.red,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      profileController
                                          .isAddQualification.value = true;
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
                                          'Add Qualification Details',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Obx(
                                    () => profileController
                                            .isAddQualification.value
                                        ? Column(
                                            children: [
                                              const Text('Class/Level'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .studentClasscontroller,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('Field'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .studentFieldcontroller,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('College'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .studentCollegecontroller,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('Specification'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .studentSpecificationController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('From Year'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .studentFromYearcontroller,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('To Year'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .studentToYearController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('Percentage'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .studentPercentageController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (profileController.studentNameController.text.isNotEmpty &&
                                                          profileController
                                                              .studentClasscontroller
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .studentPercentageController
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .studentCollegecontroller
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .studentFromYearcontroller
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .studentFieldcontroller
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .studentFieldcontroller
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .studentSpecificationController
                                                              .text
                                                              .isNotEmpty) {
                                                        profileController
                                                            .saveQualificationDetails();
                                                        //  profileController.updateStudent();
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        'Please fill all the fields')));
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 150.w,
                                                      height: 40.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        color: Colors.purple,
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Save',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      profileController
                                                          .isAddQualification
                                                          .value = false;
                                                    },
                                                    child: Container(
                                                      width: 150.w,
                                                      height: 40.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        color: Colors.purple,
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Close',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      height: Get.width > 615 ? 380.h : 280.h,
                                      child: GetBuilder<ProfileController>(
                                          builder: (qualificationData) {
                                        return profiledataListWidget(
                                          qualificationData,
                                          profileController
                                              .qualificationDataList,
                                        );
                                      }),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      profileController
                                          .isAddWorkExperience.value = true;
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
                                          'Add Work Experience',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Obx(
                                    () => profileController
                                            .isAddWorkExperience.value
                                        ? Column(
                                            children: [
                                              const Text('Company Name'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .workCompanyNameController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('Designation'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .workDesignationController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('Salary(Monthly)'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .workSalaryController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('From Year'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .wrokFromYearcontroller,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              const Text('To Year'),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: TextField(
                                                  controller: profileController
                                                      .workToYearController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (profileController.workCompanyNameController.text.isNotEmpty &&
                                                          profileController
                                                              .workDesignationController
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .workSalaryController
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .wrokFromYearcontroller
                                                              .text
                                                              .isNotEmpty &&
                                                          profileController
                                                              .workToYearController
                                                              .text
                                                              .isNotEmpty) {
                                                        profileController
                                                            .saveWorkExperience();
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        'Please fill all the fields')));
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 150.w,
                                                      height: 40.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        color: Colors.purple,
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Save',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      profileController
                                                          .isAddWorkExperience
                                                          .value = false;
                                                    },
                                                    child: Container(
                                                      width: 150.w,
                                                      height: 40.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        color: Colors.purple,
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Close',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: Get.width,
                                        height: Get.width > 615 ? 380.h : 280.h,
                                        child: GetBuilder<ProfileController>(
                                            builder: (workData) {
                                          return Expanded(
                                            child: ListView(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              children: List.generate(
                                                  workData
                                                      .workExperienceDataList
                                                      .length,
                                                  (index) => Stack(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        15.w),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    15.h),
                                                            width: 220.w,
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(),
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.r)),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 100
                                                                            .w,
                                                                        child:
                                                                            const Text(
                                                                          'Company Name',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )),
                                                                    const Text(
                                                                        ' : '),
                                                                    Expanded(
                                                                      child: Text(
                                                                          '${workData.workExperienceDataList[index]['Company']}'),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 100
                                                                            .w,
                                                                        child:
                                                                            const Text(
                                                                          'Designation',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )),
                                                                    const Text(
                                                                        ' : '),
                                                                    Expanded(
                                                                      child: Text(
                                                                          '${workData.workExperienceDataList[index]['Designation']}'),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 100
                                                                            .w,
                                                                        child:
                                                                            const Text(
                                                                          'Salary(Monthly)',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )),
                                                                    const Text(
                                                                        ' : '),
                                                                    Expanded(
                                                                      child: Text(
                                                                          '${workData.workExperienceDataList[index]['Salary']}'),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 100
                                                                            .w,
                                                                        child:
                                                                            const Text(
                                                                          'From Year',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )),
                                                                    const Text(
                                                                        ' : '),
                                                                    Expanded(
                                                                      child: Text(
                                                                          '${workData.workExperienceDataList[index]['Ex_From']}'),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 100
                                                                            .w,
                                                                        child:
                                                                            const Text(
                                                                          'To Year',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        )),
                                                                    const Text(
                                                                        ' : '),
                                                                    Expanded(
                                                                      child: Text(
                                                                          '${workData.workExperienceDataList[index]['Ex_To']}'),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 8.w,
                                                            top: 4.h,
                                                            child:
                                                                PopupMenuButton(
                                                                    splashRadius:
                                                                        2,
                                                                    onSelected:
                                                                        (index1) {
                                                                      if (index1 ==
                                                                          1) {
                                                                        profileController
                                                                            .workCompanyNameController
                                                                            .text = workData.workExperienceDataList[index]
                                                                                ['Company'] ??
                                                                            '';
                                                                        profileController
                                                                            .workDesignationController
                                                                            .text = workData.workExperienceDataList[index]
                                                                                ['Designation'] ??
                                                                            '';
                                                                        profileController
                                                                            .workSalaryController
                                                                            .text = workData.workExperienceDataList[index]
                                                                                ['Salary'] ??
                                                                            '';
                                                                        profileController
                                                                            .wrokFromYearcontroller
                                                                            .text = workData.workExperienceDataList[index]
                                                                                ['Ex_From'] ??
                                                                            '';
                                                                        profileController
                                                                            .workToYearController
                                                                            .text = workData.workExperienceDataList[index]
                                                                                ['Ex_To'] ??
                                                                            '';
                                                                        profileController
                                                                            .workExperienceSlno
                                                                            .value = workData.workExperienceDataList[index]
                                                                                ['Slno'] ??
                                                                            0;

                                                                        profileController
                                                                            .workExperienceSlno
                                                                            .value = workData.workExperienceDataList[index]
                                                                                ['Work_Experience_Id'] ??
                                                                            0;
                                                                        profileController
                                                                            .isAddWorkExperience
                                                                            .value = true;
                                                                      } else if (index1 ==
                                                                          2) {
                                                                        showDialog(
                                                                          barrierDismissible:
                                                                              false,
                                                                          context:
                                                                              Get.context!,
                                                                          builder: (ctx) =>
                                                                              AlertDialog(
                                                                            title:
                                                                                const Text(
                                                                              'Warning',
                                                                              style: TextStyle(fontWeight: FontWeight.w800),
                                                                            ),
                                                                            content:
                                                                                const SingleChildScrollView(
                                                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                Text("Do you want to delete?"),
                                                                              ]),
                                                                            ),
                                                                            actions: [
                                                                              TextButton(
                                                                                child: const Text(
                                                                                  'Yes',
                                                                                  style: TextStyle(fontWeight: FontWeight.w700),
                                                                                ),
                                                                                onPressed: () async {
                                                                                  profileController.deleteWorkExperience(workExperienceId: workData.workExperienceDataList[index]['Work_Experience_Id'] ?? 0, dltIndex: index);
                                                                                  Get.back();
                                                                                },
                                                                              ),
                                                                              TextButton(
                                                                                child: const Text('Cancel', style: TextStyle(fontWeight: FontWeight.w700)),
                                                                                onPressed: () {
                                                                                  Get.back();
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                    itemBuilder:
                                                                        (context) {
                                                                      return [
                                                                        const PopupMenuItem<int>(
                                                                            value:
                                                                                1,
                                                                            child:
                                                                                Text('Edit')),
                                                                        const PopupMenuItem<int>(
                                                                            value:
                                                                                2,
                                                                            child:
                                                                                Text('Delete')),
                                                                      ];
                                                                    }),
                                                          )
                                                        ],
                                                      )),
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: ExpansionTile(
                              // shape: const OutlineInputBorder(),
                              tilePadding: EdgeInsets.all(20.w),
                              collapsedBackgroundColor: Colors.white,

                              leading: CircleAvatar(
                                radius: 50.r,
                                child: const Center(
                                  child: Icon(Icons.person),
                                ),
                              ),

                              title: const Text('Language'),

                              // backgroundColor: Colors.red,

                              trailing:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              children: [
                                InkWell(
                                  onTap: () {
                                    profileController.isAddLanguage.value =
                                        true;
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
                                        'Add Language Details',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Obx(
                                  () => profileController.isAddLanguage.value
                                      ? Column(
                                          children: [
                                            const Text('Exam'),
                                            GetBuilder<ProfileController>(
                                                builder: (languageData) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: DropdownButtonFormField(
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    value: languageData
                                                                .examDropDownValue
                                                                .value ==
                                                            ''
                                                        ? 'Select'
                                                        : languageData
                                                            .examDropDownValue
                                                            .value,
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        height: 1),
                                                    decoration: InputDecoration(
                                                        isDense: true,
                                                        //  contentPadding: EdgeInsets.all(13),
                                                        // hintText: data.inspectionDropdownValue.value
                                                        //     .isEmpty? 'Location':'',
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.r))),
                                                    onChanged: (value) {
                                                      languageData
                                                              .examDropDownValue
                                                              .value =
                                                          value.toString() ??
                                                              '';
                                                    },
                                                    hint: Text(
                                                      'Exam',
                                                      style: TextStyle(
                                                          fontSize: 12.sp),
                                                    ),
                                                    items: languageData
                                                        .ieltsDropDownList
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                              value: e[
                                                                  'Ielts_Type_Name'],
                                                              child: Text(
                                                                e['Ielts_Type_Name']
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ))
                                                        .toList()),
                                              );
                                            }),
                                            // SizedBox(
                                            //   height: 10.h,
                                            // ),
                                            // Container(
                                            //   margin:
                                            //       EdgeInsets.symmetric(horizontal: 15.w),
                                            //   child: TextField(
                                            //     decoration: InputDecoration(
                                            //         border: OutlineInputBorder(
                                            //             borderRadius:
                                            //                 BorderRadius.circular(5.r))),
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('Exam Date'),
                                            SizedBox(
                                              height: 10.h,
                                            ),

                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: datepickerWidget(
                                                    context: context,
                                                    datePickController:
                                                        profileController
                                                            .examDateController,
                                                    labelText: 'Select Date',
                                                    titleText: '')),
                                            // Container(
                                            //   margin:
                                            //       EdgeInsets.symmetric(horizontal: 15.w),
                                            //   child: TextField(
                                            //     controller: profileController.examDateController,
                                            //     decoration: InputDecoration(
                                            //         border: OutlineInputBorder(
                                            //             borderRadius:
                                            //                 BorderRadius.circular(5.r))),
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('GRE/GMAT Score'),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: TextField(
                                                controller: profileController
                                                    .gMatScroreController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('Listening'),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: TextField(
                                                controller: profileController
                                                    .listeningScoreController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('NEET Score'),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: TextField(
                                                controller: profileController
                                                    .neetScroreController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('Reading'),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: TextField(
                                                controller: profileController
                                                    .readingScroreController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('IELTS Score'),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: TextField(
                                                controller: profileController
                                                    .ieltsScrorecontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('Writing'),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: TextField(
                                                controller: profileController
                                                    .writingScroreController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            const Text('Speaking'),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              child: TextField(
                                                controller: profileController
                                                    .speakingScroreController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.r))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    if (profileController
                                                                .examDropDownValue
                                                                .value !=
                                                            "" &&
                                                        profileController
                                                            .gMatScroreController
                                                            .text
                                                            .isNotEmpty &&
                                                        profileController
                                                            .listeningScoreController
                                                            .text
                                                            .isNotEmpty &&
                                                        profileController
                                                            .neetScroreController
                                                            .text
                                                            .isNotEmpty &&
                                                        profileController
                                                            .readingScroreController
                                                            .text
                                                            .isNotEmpty &&
                                                        profileController
                                                            .ieltsScrorecontroller
                                                            .text
                                                            .isNotEmpty &&
                                                        profileController
                                                            .writingScroreController
                                                            .text
                                                            .isNotEmpty &&
                                                        profileController
                                                            .speakingScroreController
                                                            .text
                                                            .isNotEmpty &&
                                                        profileController
                                                            .examDateController
                                                            .text
                                                            .isNotEmpty) {
                                                      profileController
                                                          .saveIeltsDetails();
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      'Please fill all the fields')));
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 150.w,
                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      color: Colors.purple,
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    profileController
                                                        .isAddLanguage
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    width: 150.w,
                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      color: Colors.purple,
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  height: Get.width > 615 ? 500.h : 350.h,
                                  child: GetBuilder<ProfileController>(
                                      builder: (workData) {
                                    return ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const ClampingScrollPhysics(),
                                      children: List.generate(
                                          workData.languageDetailsList.length,
                                          (index) => Stack(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 15.w),
                                                    padding:
                                                        EdgeInsets.all(15.w),
                                                    width: 250.w,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.r)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'Exam',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['Ielts_Type_Name']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'Exam Date',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['Exam_Date']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'GRE/GMAT Score',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['gre_score']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'NEET Score',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['neet_score']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'IELTS Score',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['Description']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'Listening',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['Listening']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'Reading',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['Reading']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'Writing',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['Writing']}'),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 120.w,
                                                                child:
                                                                    const Text(
                                                                  'Speaking',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )),
                                                            const Text(' : '),
                                                            Expanded(
                                                              child: Text(
                                                                  '${workData.languageDetailsList[index]['Speaking']}'),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 8.w,
                                                    top: 4.h,
                                                    child: PopupMenuButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        splashRadius: 2,
                                                        onSelected: (index1) {
                                                          if (index1 == 1) {
                                                            profileController
                                                                .gMatScroreController
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'gre_score'] ??
                                                                '';
                                                            profileController
                                                                .listeningScoreController
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Listening'] ??
                                                                '';
                                                            profileController
                                                                .neetScroreController
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'neet_score'] ??
                                                                '';
                                                            profileController
                                                                .readingScroreController
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Reading'] ??
                                                                '';
                                                            profileController
                                                                .ieltsScrorecontroller
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Description'] ??
                                                                '';
                                                            profileController
                                                                .writingScroreController
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Writing'] ??
                                                                '';
                                                            profileController
                                                                .speakingScroreController
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Speaking'] ??
                                                                '';
                                                            profileController
                                                                .examDateController
                                                                .text = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Exam_Date'] ??
                                                                '';
                                                            profileController
                                                                .isAddLanguage
                                                                .value = true;
                                                            profileController
                                                                .languageId
                                                                .value = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Ielts_Details_Id'] ??
                                                                0;
                                                            profileController
                                                                .languageSlno
                                                                .value = workData
                                                                            .languageDetailsList[
                                                                        index]
                                                                    ['Slno'] ??
                                                                0;
                                                            profileController
                                                                .examDropDownValue
                                                                .value = workData
                                                                            .languageDetailsList[
                                                                        index][
                                                                    'Ielts_Type_Name'] ??
                                                                '';
                                                          } else if (index1 ==
                                                              2) {
                                                            showDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              context:
                                                                  Get.context!,
                                                              builder: (ctx) =>
                                                                  AlertDialog(
                                                                title:
                                                                    const Text(
                                                                  'Warning',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800),
                                                                ),
                                                                content:
                                                                    const SingleChildScrollView(
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            "Do you want to delete?"),
                                                                      ]),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    child:
                                                                        const Text(
                                                                      'Yes',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      profileController.deleteLanguage(
                                                                          languageId: workData.languageDetailsList[index]['Ielts_Details_Id'] ??
                                                                              0,
                                                                          dltIndex:
                                                                              index);
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  TextButton(
                                                                    child: const Text(
                                                                        'Cancel',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w700)),
                                                                    onPressed:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        itemBuilder: (context) {
                                                          return [
                                                            const PopupMenuItem<
                                                                    int>(
                                                                value: 1,
                                                                child: Text(
                                                                    'Edit')),
                                                            const PopupMenuItem<
                                                                    int>(
                                                                value: 2,
                                                                child: Text(
                                                                    'Delete')),
                                                          ];
                                                        }),
                                                  )
                                                ],
                                              )),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: ExpansionTile(
                              // shape: const OutlineInputBorder(),
                              tilePadding: EdgeInsets.all(20.w),
                              collapsedBackgroundColor: Colors.white,
                              leading: CircleAvatar(
                                radius: 50.r,
                                child: const Center(
                                  child: Icon(Icons.person),
                                ),
                              ),
                              title: const Text('Application'),
                              // backgroundColor: Colors.red,
                              trailing:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              children: [
                                InkWell(
                                  onTap: () {
                                    homeController.pageIndex.value = 0;

                                    // Get.offAll(()=>const BottomNavigationScreen());

                                    //  profileController. saveIeltsDetails();
                                  },
                                  child: Container(
                                    width: 200.w,
                                    // height: 40.h,
                                    padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.purple,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Search Course and Start Applying',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  height: Get.width > 615 ? 450.h : 280.h,
                                  child: GetBuilder<ProfileController>(
                                      builder: (workData) {
                                    return ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                          workData.courseApplyApplicationList
                                              .length,
                                          (index) => Container(
                                                margin: EdgeInsets.only(
                                                    right: 15.w),
                                                padding: EdgeInsets.all(12.w),
                                                width: 300.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Row(
                                                      // crossAxisAlignment:
                                                      //     CrossAxisAlignment
                                                      //         .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 100.w,
                                                          child: const Text(
                                                            'Course Name',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(': '),
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Text(
                                                              '${workData.courseApplyApplicationList[index]['Course_Name']}',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 100.w,
                                                          child: const Text(
                                                            'Country Name',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(': '),
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Text(
                                                                '${workData.courseApplyApplicationList[index]['Country_Name']}'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      // crossAxisAlignment:
                                                      //     CrossAxisAlignment
                                                      //         .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 100.w,
                                                          child: const Text(
                                                            'University',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(': '),
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Text(
                                                                '${workData.courseApplyApplicationList[index]['University_Name'] ?? ''}'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                            width: 100.w,
                                                            child: const Text(
                                                              'Status',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            )),
                                                        const Text(': '),
                                                        Expanded(
                                                          child: Text(
                                                              '${workData.courseApplyApplicationList[index]['Application_Status_Name']}'),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                            width: 100.w,
                                                            child: const Text(
                                                              'Remark',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            )),
                                                        const Text(': '),
                                                        Expanded(
                                                          child: Text(
                                                              '${workData.courseApplyApplicationList[index]['Ex_To']}'),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                    );
                                  }),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.all(20.w),
                              collapsedBackgroundColor: Colors.white,
                              leading: CircleAvatar(
                                radius: 50.r,
                                child: const Center(
                                  child: Icon(Icons.person),
                                ),
                              ),
                              title: const Text('Document'),
                              trailing:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: TextFormField(
                                    controller: profileController
                                        .documentSelectedFileController,
                                    style:
                                        TextStyle(fontSize: 14.sp, height: 1),
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.sp),
                                        prefixIcon: Icon(
                                          Icons.file_open,
                                          size: 12.sp,
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () async {
                                            profileController
                                                    .documentSelectedFileController
                                                    .text =
                                                await profileController
                                                    .pickfile();
                                          },
                                          child: Container(
                                            color: Colors.purple,
                                            width: 100.w,
                                            height: 40.h,
                                            child: Center(
                                              child: Text(
                                                'choose file',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                        labelStyle: TextStyle(fontSize: 14.sp),
                                        labelText: 'Select File',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.r),
                                                bottomLeft:
                                                    Radius.circular(4.r)))),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GetBuilder<ProfileController>(
                                    builder: (languageData) {
                                  return Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: DropdownButtonFormField(
                                        iconDisabledColor: Colors.grey,
                                        iconEnabledColor: Colors.black,
                                        //  value: languageData.documentDropDownValue.value==''?'Select':languageData.examDropDownValue.value,
                                        style: TextStyle(
                                            fontSize: 12.sp, height: 1),
                                        decoration: InputDecoration(
                                            isDense: true,
                                            //  contentPadding: EdgeInsets.all(13),
                                            // hintText: data.inspectionDropdownValue.value
                                            //     .isEmpty? 'Location':'',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.r))),
                                        onChanged: (value) {
                                          languageData.documentDropDownValue
                                              .value = value.toString() ?? '';
                                        },
                                        hint: Text(
                                          'Document',
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                        items: languageData
                                            .documentTypeDropDownList
                                            .map((e) => DropdownMenuItem(
                                                  value: e['Document_Name'],
                                                  child: Text(
                                                    e['Document_Name']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.black),
                                                  ),
                                                ))
                                            .toList()),
                                  );
                                }),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (profileController
                                            .documentSelectedFileController
                                            .text
                                            .isNotEmpty &&
                                        profileController
                                                .documentDropDownValue.value !=
                                            '') {
                                      await profileController.saveDocument();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Please fill all the fields')));
                                    }

                                    // homeController.pageIndex.value=0;

                                    // Get.offAll(()=>const BottomNavigationScreen());

                                    //  profileController. saveIeltsDetails();
                                  },
                                  child: Container(
                                    width: 200.w,
                                    // height: 40.h,
                                    padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.purple,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Save',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GetBuilder<ProfileController>(
                                    builder: (documentData) {
                                  return ListView(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    shrinkWrap: true,
                                    children: List.generate(
                                        documentData
                                            .studentDocumentDetailsList.length,
                                        (index) => ListTile(
                                              minVerticalPadding: 10.h,
                                              contentPadding:
                                                  const EdgeInsets.all(8),
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              tileColor: Colors.white,
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Entry Date',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    documentData
                                                            .studentDocumentDetailsList[
                                                        index]['Entry_Date'],
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Document Name',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    documentData
                                                            .studentDocumentDetailsList[
                                                        index]['Document_Name'],
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              trailing: IconButton(
                                                  onPressed: () async {
                                                    await launchUrl(Uri.parse(
                                                        '${HttpUrls.documentBaseUrl}${documentData.studentDocumentDetailsList[index]['File_Name']}'));
                                                  },
                                                  icon: Container(
                                                    width: 100.w,
                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.r)),
                                                    child: const Center(
                                                        child: Text(
                                                      'view',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                  )),
                                            )),
                                  );
                                }),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () async {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text(
                                    'Logout',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  content: const SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Are you sure to logout?")
                                        ]),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      onPressed: () async {
                                        await loginController.logout();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800)),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              );

                              // homeController.pageIndex.value=0;

                              // Get.offAll(()=>const BottomNavigationScreen());

                              //  profileController. saveIeltsDetails();
                            },
                            child: Container(
                              width: 200.w,
                              // height: 40.h,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.purple,
                              ),
                              child: const Center(
                                child: Text(
                                  'Logout',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }

  ListView profiledataListWidget(
      ProfileController qualificationData, List listData) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: List.generate(
          listData.length,
          (index) => Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15.w),
                    padding: EdgeInsets.all(15.w),
                    width: 220.w,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: 100.w,
                                child: const Text(
                                  'Class/Level',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Text(': '),
                            Expanded(
                              child: Text('${listData[index]['Credential']}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 100.w,
                                child: const Text(
                                  'Field',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Text(': '),
                            Expanded(
                              child: Text('${listData[index]['Field']}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 100.w,
                                child: const Text(
                                  'Specification',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Text(': '),
                            Expanded(
                              child: Text('${listData[index]['school']}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 100.w,
                                child: const Text(
                                  'College',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Text(': '),
                            Expanded(
                              child:
                                  Text('${listData[index]['Backlog_History']}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 100.w,
                                child: const Text(
                                  'From Year',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Text(': '),
                            Expanded(
                              child: Text('${listData[index]['Fromyear']}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 100.w,
                                child: const Text(
                                  'To Year',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Text(': '),
                            Expanded(
                              child: Text('${listData[index]['Toyear']}'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    top: 4.h,
                    child: PopupMenuButton(
                        splashRadius: 2,
                        onSelected: (index1) {
                          if (index1 == 1) {
                            profileController.studentClasscontroller.text =
                                listData[index]['Credential'] ?? '';
                            profileController.studentPercentageController.text =
                                listData[index]['MarkPer'] ?? '';
                            profileController.studentCollegecontroller.text =
                                listData[index]['school'] ?? '';
                            profileController.studentFromYearcontroller.text =
                                listData[index]['Fromyear'] ?? '';
                            profileController.studentToYearController.text =
                                listData[index]['Toyear'] ?? '';
                            profileController.studentFieldcontroller.text =
                                listData[index]['Field'] ?? '';
                            profileController
                                    .studentSpecificationController.text =
                                listData[index]['Backlog_History'] ?? '';
                            profileController.isAddQualification.value = true;
                            profileController.qualificationId.value =
                                listData[index]['Qualification_Id'] ?? 0;
                            profileController.qualificationSlno.value =
                                listData[index]['slno'] ?? 0;
                          } else if (index1 == 2) {
                            showDialog(
                              barrierDismissible: false,
                              context: Get.context!,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                  'Warning',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                content: const SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Do you want to delete?"),
                                      ]),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    onPressed: () async {
                                      profileController.deleteQualification(
                                          qualificationId: listData[index]
                                                  ['Qualification_Id'] ??
                                              0,
                                          dltIndex: index);
                                      Get.back();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Cancel',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem<int>(
                                value: 1, child: Text('Edit')),
                            const PopupMenuItem<int>(
                                value: 2, child: Text('Delete')),
                          ];
                        }),
                  )
                ],
              )),
    );
  }
}
