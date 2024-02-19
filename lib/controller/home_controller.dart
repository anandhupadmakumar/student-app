import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/core/sample_api_data/api_data.dart';
import 'package:student_app/http/http_request.dart';
import 'package:student_app/http/http_urls.dart';
import 'package:student_app/model/university_model.dart';

final HomeController homeController = Get.put(HomeController());

class HomeController extends GetxController {
  @override
  void onReady() {
    getUniversityList();
    // TODO: implement onReady
    super.onReady();
  }

  RxInt pageIndex = 0.obs;
  List<UniversityModel> universityListData = [];

  TextEditingController loginMobController = TextEditingController();
  TextEditingController pinPutOtpController = TextEditingController();

  getUniversityList() {
    universityListData =
        universityData.map((e) => UniversityModel.fromJson(e)).toList();
    print(universityListData[0].universityName);
    update();
  }

  getUniversities() async {
    await HttpRequest.httpGetRequest(
      // bodyData: mapData,
      // bodyData: {},
      endPoint: HttpUrls.courseSearch,
    ).then((value) async {
      if (value != null) {
        if (value.data.isNotEmpty) {

          print(value.data);
    
        }
      }
    });
  }
}
