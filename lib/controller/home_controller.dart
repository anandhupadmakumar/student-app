import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/controller/login_controller.dart';
import 'package:student_app/http/http_request.dart';
import 'package:student_app/http/http_urls.dart';
import 'package:student_app/model/dashboard_data_model.dart';
import 'package:student_app/view/home/university/university_search_result_screen.dart';

import '../model/course_details_data_model.dart';
import '../model/course_list_model.dart';

final HomeController homeController = Get.put(HomeController());

class HomeController extends GetxController {

 @override
  void onReady() {
   homeController.initFunction();
    super.onReady();
  }



  RxInt pageIndex = 0.obs;
  List<DashBoardDataModel> universityListData = [];
  List<CourseListDataModel> universityCourseDataList = [];
  CourseDetailsModel? courseDetails;
  RxBool checkIsCourseSelected=false.obs;


  TextEditingController loginMobController = TextEditingController();
  TextEditingController loginUserNameController = TextEditingController();
  TextEditingController pinPutOtpController = TextEditingController();

  ScrollController searchScrollController=ScrollController();

  List dropDownCountryList = [];
  List dropDownLevelList = [];
  List dropDownIntakeList = [];
  List searchResultList = [];
  RxString dropDownCountryValue = ''.obs;
  RxString dropDownLevelValue = ''.obs;
  RxString dropDownIntakeValue = ''.obs;
  RxInt pageNumber=1.obs;

  List<Map<String, dynamic>> locationDataList = [
    {
      "country_name": "AUSTRALIA",
      "img_url": "assets/location/australia.png",
      "description":
          "World class academic recognition and up to 4-7 year stay back as well as easy part time availability. Australia provides students the opportunity to work part-time while studying, which would help you offset some of your living costs. International students are allowed to work for up to 20 hours/ 40 Hours per fortnight a week during semesters and full-time during the university holidays.",
      "in_take": "INTAKE: September, November.",
    },
    {
      "country_name": "UK",
      "img_url": "assets/location/uk.png",
      "description":
          "High quality of education from world and recognized universities and affordable fees structure With or without IELTS and Availability of scholarships. Two year stay-back and Instalment wise fee Payment and Spouse can work full time.",
      "in_take": "INTAKE: September, November.",
    },
    {
      "country_name": "CANADA",
      "img_url": "assets/location/canada.png",
      "description":
          "Less expensive (Tuition fees and living cost) than US, UK or Australia and possibility of permanent residency while Post study work visa and good job opportunities after completion of studies. Canadian’s quality of life rank 1 in the world.",
      "in_take": "INTAKE: September, November.",
    },
    {
      "country_name": "NEW ZEALAND",
      "img_url": "assets/location/newsland.png",
      "description":
          "New Zealand is a popular study abroad and destination with many programs. New Zealand is undoubtedly the safest country to study in. With globally ranked university and a responsive education system, it has the right mix of opportunities, culture, economy and climate to thrive for an Indian student. Not to miss, its unspoiled scenery will make your experience worth every penny.",
      "in_take": "INTAKE: September, November.",
    },
    {
      "country_name": "GERMANY",
      "img_url": "assets/location/germany.png",
      "description":
          "Free Education at Public Universities and top-Ranked Universities as well as low cost of Living. Study in Germany: Germany has over the years become one of the top destinations for Indian students wanting to study abroad. As per data available from the Ministry of External Affairs, Government of India, about 20,810 Indian students are currently enrolled in German universities (2021). Germany is home to world-class education complete with modern amenities and a major part of the country’s GDP is diverted towards the maintenance of the education system of the country.",
      "in_take": "INTAKE: September, November.",
    },
    {
      "country_name": "SWEDEN",
      "img_url": "assets/location/sweden.jpg",
      "description":
          "The quality and international standing of the Swedish education system needs no explanation, with Universities consistently ranked among the best in the world. Sweden, one of the most modern countries in the world is popularly known as “a land of innovations.” The country is also well-known for providing high quality and unconventional education. Universities in Sweden have a unique student-centric education system. The programs are crafted in a way that promotes group and independent study among students. Studying in Sweden prepares students for a successful future by inculcating in them the true spirit of innovation and group work, the traits highly valued in the job market.",
      "in_take": "INTAKE: September, November.",
    },
  ];


initFunction()async{
 await homeController.getDashBoardData();
   await  homeController. getHomeDropDownData();
}




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

  getSearchData() async {
    List searchList = [];
    await HttpRequest.httpGetRequest(
      // bodyData: mapData,

      endPoint: HttpUrls.getDashBoardData,
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {
          searchList = value.data;
          print('search result ${value.data}');
        }
      }
    });

    return searchList;
  }

  getCourseDetails({required String courseName,required int courseId}) async {
    print('course id $courseId');

    //
    Map<String, dynamic> mapData = {
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

          courseDetails = CourseDetailsModel.fromJson(value.data[0][0]);
          if(loginController.isUserLogin.value==true){
             await checkIsCourseIsSelected(courseId);

          }
         
          Get.to(() => const UniversityResultScreen());

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

    Map<String, dynamic> mapData = {
      "Student_Id": studentId,
      "Course_Apply": [
        {
          "Course_Id": courseName?.courseId ?? 0,
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
          checkIsCourseIsSelected(courseName?.courseId);

          ScaffoldMessenger.of(Get.context!)
              .showSnackBar(SnackBar(content: Text('Applied Successfully')));

          // courseDetails=CourseDetailsModel.fromJson(value.data[0][0]);

          print(courseDetails);
        }
      }
    });

    update();
  }

  getHomeDropDownData() async {
    await HttpRequest.httpGetRequest(
      // bodyData: mapData,

      endPoint: HttpUrls.getHomePageSearchDropDownValues,
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {
          dropDownCountryList = value.data[0];
          dropDownCountryList
              .insert(0, {"Country_Id": 0, "Country_Name": 'Select'});

          dropDownLevelList = value.data[4];

          dropDownLevelList
              .insert(0, {"Level_Detail_Id": 0, "Level_Detail_Name": 'Select'});
          dropDownIntakeList = value.data[5];

          dropDownIntakeList
              .insert(0, {"Intake_Id": 0, "Intake_Name": 'Select'});

          print('search dropDownList result ${value.data[4]}');
        }
      }
    });
    update();
  }

  getCourseSearchData({required int pageStart,required int pageEnd}) async {

    print("level dropdown value  ${dropDownLevelValue.value}");

    List levelIdList=dropDownLevelList.where((element) => element['Level_Detail_Name']==dropDownLevelValue.value).toList();
int levelId=0;
if(levelIdList.isNotEmpty){
  levelId=int.parse(levelIdList[0]['Level_Detail_Id'].toString())    ;
}


    Map<String, dynamic> mapData = {
      "Level_Detail_Id": levelId,
      "Country_Id": 0,
      "Intake_Id": 0,
      "Sub_Section_Id": 0,
      "Course_Name": '0',
      "Ielts_": '0',
      "Page_Start": pageStart,
      "Page_End": pageEnd,
      "Page_Length": 10,
      "University": 0,
      "Subject_1": 0,
    };

    await HttpRequest.httpGetRequest(
      bodyData: mapData,
      endPoint: HttpUrls.courseSearch,
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {
          searchResultList = value.data[0];

          print('search course result ${searchResultList}');
        }
      }
    });
    update();
  }



   checkIsCourseIsSelected(courseId) async {


    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';


   


    List searchList = [];
    await HttpRequest.httpGetRequest(
      // bodyData: mapData,

      endPoint: '${HttpUrls.checkIfCourseIsSelected}$userId/$courseId',
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {
          searchList = value.data;
          print('search result ${value.data}');
          if(value.data[0][0]['result'].toString()=='0'){
            checkIsCourseSelected.value=false;

          }else{
            checkIsCourseSelected.value=true;
          }


        }
      }
    });

   
  }




}
