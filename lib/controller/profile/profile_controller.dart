import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/http/aws_upload.dart';
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



  //add Language 
  TextEditingController gMatScroreController = TextEditingController();
  TextEditingController listeningScoreController = TextEditingController();
  TextEditingController neetScroreController = TextEditingController();
  TextEditingController readingScroreController = TextEditingController();
  TextEditingController ieltsScrorecontroller = TextEditingController();
  TextEditingController writingScroreController = TextEditingController();
  TextEditingController speakingScroreController = TextEditingController();
  TextEditingController examDateController = TextEditingController();



  TextEditingController documentSelectedFileController = TextEditingController();




  RxBool isAddQualification = false.obs;
  RxBool isAddWorkExperience = false.obs;

  RxString examDropDownValue=''.obs;
   RxString documentDropDownValue=''.obs;

  RxBool isAddLanguage = false.obs;
  List qualificationDataList = [];
  List workExperienceDataList = [];

  List ieltsDropDownList = [];
  List documentTypeDropDownList = [];
  List courseApplyApplicationList = [];
  Uint8List? fileBytes;
 FilePickerResult? sendSelectedFile;


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



   pickfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null) {
      fileBytes = result.files.first.bytes;
    }
    print(result);
    print('a.......................');
if(result!=null){
   AwsUpload.uploadToAws(result);

}
   sendSelectedFile = result;

    // final data=  await   AwsUpload.uploadToAws(result!);

   
    // purchaseController.update();

//  String base64String = purchaseController. bytesToBase64(fileBytes!);

    // adminHomeController. base64String.value=bytesToBinary(fileBytes!);

// print('file bytes: $base64String');

    return result!.files.first.name;
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
        "slno": 0,
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
        "Slno": 0,
        "Student_Id": studentId,
        "Ex_From": wrokFromYearcontroller.text,
        "Ex_To": workToYearController.text,
        "Years": studentCollegecontroller.text,
        "Company": workCompanyNameController.text,
        "Designation": workDesignationController.text,
        "Salary": workSalaryController.text,
        "country_6": 0,
        "country6_name": '',
        "Salary_Mode": '',
      },
      endPoint: '${HttpUrls.saveWorkExperience}',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          workCompanyNameController.clear();
          workDesignationController.clear();
          workSalaryController.clear();
          wrokFromYearcontroller.clear();
          workToYearController.clear();
        }
      }
    });
  }

  void getQualificationDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpGetRequest(
      endPoint: '${HttpUrls.getQualificationDetails}$userId',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          print(data);
          qualificationDataList = data;
        }
      }
    });
    update();
  }


  void getWorkExperienceDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpGetRequest(
      endPoint: '${HttpUrls.getWorkExperienceDetails}$userId',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          print(data);
          workExperienceDataList = data;
        }
      }
    });
    update();
  }


  void saveIeltsDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final studentId = preferences.getInt('trinity_student_id') ?? '';



  //    gMatScroreController 
  //  listeningScoreController 
  //  neetScroreController 
  //  readingScroreController 
  //  ieltsScrorecontroller 
  //  writingScroreController 
  //  speakingScroreController 

    await HttpRequest.httpPostRequest(
      bodyData: {
        "Ielts_Details_Id": 0,
        "Slno": 0,
        "Student_Id": studentId,
        "Ielts_Type":ieltsDropDownList.where((element) => element['Ielts_Type_Name']==examDropDownValue.value).toList()[0]['Ielts_Type'],
        "Ielts_Type_Name": examDropDownValue.value,
        "Exam_Check":1,
        "Exam_Date": DateFormat('yyyy-MM-dd').format(
                              DateFormat('dd-MM-yyyy').parse((
                                  examDateController.text))),
        "Description": '',
        "Listening": listeningScoreController.text,
        "Reading": readingScroreController.text,
        "Writing": writingScroreController.text,
        "Speaking": speakingScroreController.text,
        "Overall": '',
        "gre_score": gMatScroreController.text,
        "neet_score": neetScroreController.text,



      },
      endPoint: '${HttpUrls.saveIeltsDetails}',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data[0];
        if (data.isNotEmpty) {
          
     gMatScroreController .clear();
   listeningScoreController .clear();
   neetScroreController .clear();
   readingScroreController .clear();
   ieltsScrorecontroller .clear();
   writingScroreController .clear();
   speakingScroreController .clear();
   examDateController.clear();
        }
      }
    });
  }




  void getIeltsDropDownList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpGetRequest(
      endPoint: '${HttpUrls.getIeltsDetails}',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data;
        if (data.isNotEmpty) {
          print(data);
    

          ieltsDropDownList   = data[11];
          ieltsDropDownList.insert(0,{"Ielts_Type": 0, "Ielts_Type_Name": "Select"});

            
          print('dropdown item  document${documentTypeDropDownList}');
        }
      }
    });
    update();
  }
void getDocumentDropDownList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpGetRequest(
      bodyData: {


        'Document_Name':''



      },
      endPoint: '${HttpUrls.getDocumentListDropDown}',
    ).then((value) async {
      if (value != null) {
        print('login ${value.data}');

documentTypeDropDownList=value.data[0];
 documentTypeDropDownList.insert(0,{"Document_Id": 0, "Document_Name": "Select","Category_Id":'null'});

       
        
      }
    });
    update();
  }






  void getApplication() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';

    await HttpRequest.httpGetRequest(
      endPoint: '${HttpUrls.getStudentCourseApply}$userId',
    ).then((value) async {
      if (value != null) {
        print('login ${value.data}');


        courseApplyApplicationList=value.data[0];

       
        
      }
    });
    update();
  }



   saveDocument() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final studentId = preferences.getInt('trinity_student_id') ?? '';

dynamic data;

 if (documentSelectedFileController.text.isNotEmpty &&
        documentSelectedFileController.text != '') {
      data = await AwsUpload.uploadToAws(sendSelectedFile!);
    }

    print(data);


    await HttpRequest.httpPostRequest(isQuery: true,
      bodyData: {

        "Student_Id":studentId,
        "Document_Id":documentTypeDropDownList.where((element) => element['Document_Name']==documentDropDownValue.value).toList()[0]['Document_Id'],
        "File_Name":documentSelectedFileController.text,
        "Image_Detail":data,


       
      },
      endPoint: '${HttpUrls.saveDocument}',
    ).then((value) async {
      if (value != null) {
        // print('login ${value.data}');

        List data = value.data;
        if (data.isNotEmpty) {
         documentDropDownValue.value='';
         documentSelectedFileController.clear();
        }
      }
    });
    update();
  }












}
