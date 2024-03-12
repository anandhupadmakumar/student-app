class CourseListDataModel {
  int? courseId;
  String? courseName;
  int? universityId;
  String? universityName;

  CourseListDataModel(
      {this.courseId, this.courseName, this.universityId, this.universityName});

  CourseListDataModel.fromJson(Map<String, dynamic> json) {
    courseId = json['Course_Id'];
    courseName = json['Course_Name'];
    universityId = json['University_Id'];
    universityName = json['University_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Course_Id'] = courseId;
    data['Course_Name'] = courseName;
    data['University_Id'] = universityId;
    data['University_Name'] = universityName;
    return data;
  }
}