class CourseDetailsModel {
  int? tp;
  int? courseId;
  String? courseName;
  String? countryName;
  String? universityName;
  int? moreInformation;
  String? details;
  String? tutionFees;
  int? levelId;
  String? duration;
  String? intakeName;
  String? ieltsMinimumScore;
  String? subjectName;
  int? subjectId;
  String? levelDetailName;
  String? rowNo;

  CourseDetailsModel(
      {this.tp,
      this.courseId,
      this.courseName,
      this.countryName,
      this.universityName,
      this.moreInformation,
      this.details,
      this.tutionFees,
      this.levelId,
      this.duration,
      this.intakeName,
      this.ieltsMinimumScore,
      this.subjectName,
      this.subjectId,
      this.levelDetailName,
      this.rowNo});

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    tp = json['tp'];
    courseId = json['Course_Id'];
    courseName = json['Course_Name'];
    countryName = json['Country_Name'];
    universityName = json['University_Name'];
    moreInformation = json['More_Information'];
    details = json['Details'];
    tutionFees = json['Tution_Fees'];
    levelId = json['Level_Id'];
    duration = json['Duration'];
    intakeName = json['intake_Name'];
    ieltsMinimumScore = json['Ielts_Minimum_Score'];
    subjectName = json['Subject_Name'];
    subjectId = json['Subject_Id'];
    levelDetailName = json['Level_Detail_Name'];
    rowNo = json['RowNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={} ;
    data['tp'] =tp;
    data['Course_Id'] =courseId;
    data['Course_Name'] =courseName;
    data['Country_Name'] =countryName;
    data['University_Name'] =universityName;
    data['More_Information'] =moreInformation;
    data['Details'] =details;
    data['Tution_Fees'] =tutionFees;
    data['Level_Id'] =levelId;
    data['Duration'] =duration;
    data['intake_Name'] =intakeName;
    data['Ielts_Minimum_Score'] =ieltsMinimumScore;
    data['Subject_Name'] =subjectName;
    data['Subject_Id'] =subjectId;
    data['Level_Detail_Name'] =levelDetailName;
    data['RowNo'] =rowNo;
    return data;
  }
}