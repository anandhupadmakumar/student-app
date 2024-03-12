import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/http/http_request.dart';

import '../../http/http_urls.dart';

final profileController = Get.put(ProfileController());

class ProfileController extends GetxController {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentGenderController = TextEditingController();
  TextEditingController studentAddressController = TextEditingController();
  TextEditingController studentContactNoController = TextEditingController();
  TextEditingController studentEmailController = TextEditingController();
  TextEditingController studentDobController = TextEditingController();
//add qualification
  TextEditingController studentClasscontroller = TextEditingController();
  TextEditingController studentPercentageController = TextEditingController();
  TextEditingController studentCollegecontroller = TextEditingController();
  TextEditingController studentFromYearcontroller = TextEditingController();
  TextEditingController studentToYearController = TextEditingController();
  TextEditingController studentFieldcontroller = TextEditingController();
  TextEditingController studentSpecificationController =
      TextEditingController();

  //add workExperience
  TextEditingController workCompanyNameController = TextEditingController();
  TextEditingController workDesignationController = TextEditingController();
  TextEditingController workSalaryController = TextEditingController();
  TextEditingController wrokFromYearcontroller = TextEditingController();
  TextEditingController workToYearController = TextEditingController();

  RxBool isAddQualification = false.obs;
  RxBool isAddWorkExperience = false.obs;

  void getStudentDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpGetRequest(
      //  bodyData: {
      //      "Student_Id_": userId,

      //  },

      endPoint: '${HttpUrls.getStudentProfileDetails}$userId',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          studentNameController.text = data[0]['Student_Name'] ?? '';
          studentGenderController.text = data[0]['Gender'] ?? '';
          studentAddressController.text = data[0]['Address1'] ?? '';
          studentContactNoController.text = data[0]['Phone_Number'] ?? '';
          studentEmailController.text = data[0]['Email'] ?? '';
          studentDobController.text = data[0]['Dob'] ?? '';
        }

        // if(data.isEmpty){

        // }else{
        // //    preferences.setString('trinity_token', value.data['token']);

        // // preferences.setString('trinity_student_name', value.data['0'][0]['Student_Name']);
        // // preferences.setInt('trinity_student_id', value.data['0'][0]['Student_Id']);

        // Get.back();

        // }

        //sharedprefference
        //token store
        //user id
        //
      }
    });
  }

  void updateStudent() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final studentId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpPostRequest(
      bodyData: {
        "Student_Id": studentId,
        "Student_Name": studentNameController.text,
        "Last_Name": '',
        "Address1": studentAddressController.text,
        "Gender": studentGenderController.text,
        "Pincode": '',
        "Email": studentEmailController.text,
        "Phone_Number": studentContactNoController.text,
        "Dob": studentDobController.text,
        "Promotional_Code": '',
        "Password": '',
        "Country_Name": '',
      },
      endPoint: '${HttpUrls.updateStudent}',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          studentNameController.clear();
          studentGenderController.clear();
          studentAddressController.clear();
          studentContactNoController.clear();
          studentEmailController.clear();
          studentDobController.clear();

          getStudentDetails();
        }
      }
    });
  }

  void saveQualificationDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final studentId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpPostRequest(
      bodyData: {
        "Qualification_Id": 0,
        "slno": 1,
        "Student_id": studentId,
        "Credential": studentClasscontroller.text,
        "MarkPer": studentPercentageController.text,
        "school": studentCollegecontroller.text,
        "Fromyear": studentFromYearcontroller.text,
        "Toyear": studentToYearController.text,
        "result": '',
        "Field": studentFieldcontroller.text,
        "Backlog_History": studentSpecificationController.text,
        "Year_of_passing": '',
      },
      endPoint: '${HttpUrls.saveQualification}',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          studentClasscontroller.clear();
          studentPercentageController.clear();
          studentCollegecontroller.clear();
          studentFromYearcontroller.clear();
          studentToYearController.clear();
          studentFieldcontroller.clear();
          studentSpecificationController.clear();
        }
      }
    });
  }





  
  void saveWorkExperience() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final studentId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpPostRequest(
      bodyData: {
        "Work_Experience_Id": 0,
        "Slno": 1,
        "Student_Id": studentId,
        "Ex_From": wrokFromYearcontroller.text,
        "Ex_To": workToYearController.text,
        "Years": studentCollegecontroller.text,
        "Company": workCompanyNameController.text,
        "Designation": workDesignationController.text,
        "Salary": workSalaryController.text,
        "country_6": 0,
        "country6_name":'',
        "Salary_Mode": '',
      },
      endPoint: '${HttpUrls.saveWorkExperience}',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          workCompanyNameController .clear();
   workDesignationController .clear();
   workSalaryController .clear();
   wrokFromYearcontroller .clear();
   workToYearController .clear();
        }
      }
    });
  }
}
