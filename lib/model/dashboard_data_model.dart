class DashBoardDataModel {
  int? countryId;
  String? countryName;
  int? universityId;
  String? universityName;

  DashBoardDataModel(
      {this.countryId,
      this.countryName,
      this.universityId,
      this.universityName});

  DashBoardDataModel.fromJson(Map<String, dynamic> json) {
    countryId = json['Country_Id'];
    countryName = json['Country_Name'];
    universityId = json['University_Id'];
    universityName = json['University_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['Country_Id'] = countryId;
    data['Country_Name'] = countryName;
    data['University_Id'] = universityId;
    data['University_Name'] = universityName;
    return data;
  }
}