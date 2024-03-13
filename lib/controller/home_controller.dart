
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/http/http_request.dart';
import 'package:student_app/http/http_urls.dart';
import 'package:student_app/model/dashboard_data_model.dart';
import 'package:student_app/view/home/university/university_search_result_screen.dart';

import '../model/course_details_data_model.dart';
import '../model/course_list_model.dart';

final HomeController homeController = Get.put(HomeController());

class HomeController extends GetxController {
  

  RxInt pageIndex = 0.obs;
  List<DashBoardDataModel> universityListData = [];
  List<CourseListDataModel> universityCourseDataList = [];
  CourseDetailsModel? courseDetails;

  TextEditingController loginMobController = TextEditingController();
  TextEditingController loginUserNameController = TextEditingController();
  TextEditingController pinPutOtpController = TextEditingController();

 
  getDashBoardData() async {
    await HttpRequest.httpGetRequest(
      // bodyData: mapData,

      endPoint: HttpUrls.getDashBoardData,
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {
          List universityData = value.data[0][0]['data'];

          List courseData = value.data[0][1]['data'];

          universityListData = universityData
              .map((e) => DashBoardDataModel.fromJson(e))
              .toList();

          universityCourseDataList =
              courseData.map((e) => CourseListDataModel.fromJson(e)).toList();
        }
      }
    });

   
    update();
  }



   getCourseDetails({required String courseName}) async {

    Map<String,dynamic> mapData={

          'Level_Detail_Id': 0,
    'Country_Id': 0,
    'Intake_Id': 0,
    'Sub_Section_Id': 0,
    'Course_Name': courseName,
    'Branch_Search': '',
    'Duration_Search': '',
    'Ielts_': 0,
    'Page_Start': 0,
    'Page_End': 10,
    'Page_Length': 10,
    'University': 0,
    'Subject_1': 0,

    };
    await HttpRequest.httpGetRequest(
      bodyData: mapData,

      endPoint: HttpUrls.courseSearch,
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {
        print('courseDetails   ${value.data}');


        courseDetails=CourseDetailsModel.fromJson(value.data[0][0]);
         Get.to(() =>const  UniversityResultScreen());

        print(courseDetails);
        }
      }
    });

   
    update();
  }





  courseApply({required CourseDetailsModel? courseName}) async {

    print(courseName);


     SharedPreferences preferences = await SharedPreferences.getInstance();
    final studentId = preferences.getInt('trinity_student_id') ?? '';

  //  List universityIdList=universityCourseDataList.where((element) {
  //   print(element.courseName);
  //   print(courseName);
  //   return element.courseName==courseName;

  //  } ).toList();

    Map<String,dynamic> mapData={
 "Student_Id": studentId,
    "Course_Apply": [
        {
            "Course_Id": courseName?.courseId??0,
        }
    ]

    };
    await HttpRequest.httpPostRequest(
      bodyData: mapData,

      endPoint: HttpUrls.saveStudentCourse,
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {
        print('courseDetails   ${value.data}');

        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text('Applied Successfully')));


        // courseDetails=CourseDetailsModel.fromJson(value.data[0][0]);

        print(courseDetails);
        }
      }
    });

   
    update();
  }









 
}
