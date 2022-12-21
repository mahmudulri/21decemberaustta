// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    this.status,
    this.userInfo,
  });

  int? status;
  List<UserInfo>? userInfo;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    status: json["status"],
    userInfo: List<UserInfo>.from(json["user_info"].map((x) => UserInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user_info": List<dynamic>.from(userInfo!.map((x) => x.toJson())),
  };
}

class UserInfo {
  UserInfo({
    this.id,
    this.fullName,
    this.bio,
    this.nickName,
    this.email,
    this.phoneNo,
    this.twitterLink,
    this.linkedinLink,
    this.facebookLink,
    this.image,
    this.officeEmail,
    this.jobSector,
    this.batch,
    this.professionalInfo,
    this.educationalInfo,
  });

  int? id;
  String? fullName;
  String? bio;
  String? nickName;
  String? email;
  String? phoneNo;
  String? twitterLink;
  String? linkedinLink;
  String? facebookLink;
  String? image;
  String? officeEmail;
  String? jobSector;
  String? batch;
  List<ProfessionalInfo>? professionalInfo;
  EducationalInfo? educationalInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    fullName: json["full_name"],
    bio: json["bio"],
    nickName: json["nick_name"],
    email: json["email"],
    phoneNo: json["phone_no"],
    twitterLink: json["twitter_link"],
    linkedinLink: json["linkedin_link"],
    facebookLink: json["facebook_link"],
    image: json["image"],
    officeEmail: json["office_email"],
    jobSector: json["job_sector"],
    batch: json["batch"],
    professionalInfo: List<ProfessionalInfo>.from(json["professional_info"].map((x) => ProfessionalInfo.fromJson(x))),
    educationalInfo: EducationalInfo.fromJson(json["educational_info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "bio": bio,
    "nick_name": nickName,
    "email": email,
    "phone_no": phoneNo,
    "twitter_link": twitterLink,
    "linkedin_link": linkedinLink,
    "facebook_link": facebookLink,
    "image": image,
    "office_email": officeEmail,
    "job_sector": jobSector,
    "batch": batch,
    "professional_info": List<dynamic>.from(professionalInfo!.map((x) => x.toJson())),
    "educational_info": educationalInfo,
  };
}

class EducationalInfo {
  EducationalInfo({
    this.id,
    this.userId,
    this.sscPassingYear,
    this.hscPassingYear,
    this.bscPassingYear,
    this.mscPassingYear,
    this.sscInstitution,
    this.hscInstitution,
    this.bscInstitution,
    this.mscInstitution,
    this.sscGrade,
    this.hscGrade,
    this.bscGrade,
    this.mscGrade,
  });

  int? id;
  String? userId;
  String? sscPassingYear;
  String? hscPassingYear;
  String? bscPassingYear;
  String? mscPassingYear;
  String? sscInstitution;
  String? hscInstitution;
  String? bscInstitution;
  String? mscInstitution;
  String? sscGrade;
  String? hscGrade;
  String? bscGrade;
  String? mscGrade;

  factory EducationalInfo.fromJson(Map<String, dynamic> json) => EducationalInfo(
    id: json["id"],
    userId: json["user_id"],
    sscPassingYear: json["ssc_passing_year"],
    hscPassingYear: json["hsc_passing_year"],
    bscPassingYear: json["bsc_passing_year"],
    mscPassingYear: json["msc_passing_year"],
    sscInstitution: json["ssc_institution"],
    hscInstitution: json["hsc_institution"],
    bscInstitution: json["bsc_institution"],
    mscInstitution: json["msc_institution"],
    sscGrade: json["ssc_grade"],
    hscGrade: json["hsc_grade"],
    bscGrade: json["bsc_grade"],
    mscGrade: json["msc_grade"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "ssc_passing_year": sscPassingYear,
    "hsc_passing_year": hscPassingYear,
    "bsc_passing_year": bscPassingYear,
    "msc_passing_year": mscPassingYear,
    "ssc_institution": sscInstitution,
    "hsc_institution": hscInstitution,
    "bsc_institution": bscInstitution,
    "msc_institution": mscInstitution,
    "ssc_grade": sscGrade,
    "hsc_grade": hscGrade,
    "bsc_grade": bscGrade,
    "msc_grade": mscGrade,
  };
}

class ProfessionalInfo {
  ProfessionalInfo({
    this.id,
    this.userId,
    this.officeAddress,
    this.nameOfCompany,
    this.year,
    this.designation,
  });

  int? id;
  String? userId;
  String? officeAddress;
  String? nameOfCompany;
  String? year;
  String? designation;

  factory ProfessionalInfo.fromJson(Map<String, dynamic> json) => ProfessionalInfo(
    id: json["id"],
    userId: json["user_id"],
    officeAddress: json["office_address"] == null ? null : json["office_address"],
    nameOfCompany: json["name_of_company"],
    year: json["year"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "office_address": officeAddress == null ? null : officeAddress,
    "name_of_company": nameOfCompany,
    "year": year,
    "designation": designation,
  };
}
