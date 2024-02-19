import 'dart:convert';

class UniversityModel {
  String? universityName;
  String? country;
  String ? imgUrl;

  UniversityModel({this.universityName, this.country,this.imgUrl});

  UniversityModel.fromJson(Map<String, dynamic> json) {
    universityName = json['University_Name'];
    country = json['Country'];
    imgUrl=json['Logo_Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['University_Name'] = universityName;
    data['Country'] = country;
    data['Logo_Url']=imgUrl;
    return data;
  }
}