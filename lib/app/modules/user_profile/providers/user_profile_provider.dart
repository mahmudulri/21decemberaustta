import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utill/constant.dart';
import '../../home/model/user_info_model.dart';
import 'package:http/http.dart 'as http;

class UserProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  GetStorage _getStorage = GetStorage('app_storage');

  Future<UserInfoModel?> getUserInfo() async {

    final String? logInToken = _getStorage.read('token');

    final String? id = _getStorage.read('userID').toString();



    final url = Uri.parse(BASE_URL+'specific-user/'+id.toString());


    var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("userinfo //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("bodystatus //////////" + jsonResponse['status'].toString());


          // var jsonString = response.body;
          print("responsebbbbbbbbbbbuuuu,,,,,,,,,,,,,,,,,,,,,"+jsonResponse.toString());
          return UserInfoModel.fromJson(jsonResponse);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }


  Future<dynamic?> updateUserBio(String bio) async {

    final String? logInToken = _getStorage.read('token');

    final String? id = _getStorage.read('userID').toString();

    var userData = new Map();
    userData['bio'] = bio;

    final url = Uri.parse(BASE_URL+'update-user-bio/'+id.toString());


    var response = await http.post(
        url,
        body: userData,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("update bio //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("update bio //////////" + jsonResponse['status'].toString());
          return true;
        }
        else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }


  Future<dynamic?> updateUserSocialInfo(String phone,String officialEmail, String facebook,
      String linkedin, String twitter) async {

    final String? logInToken = _getStorage.read('token');

    final String? id = _getStorage.read('userID').toString();

    var userData = new Map();
    userData['office_email'] = officialEmail;
    userData['facebook_link'] = facebook;
    userData['linkedin_link'] = linkedin;
    userData['twitter_link'] = twitter;
    userData['phone_no'] = phone;



    final url = Uri.parse(BASE_URL+'update-contact-social-information/'+id.toString());


    var response = await http.post(
        url,
        body: userData,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("update bio //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("update bio //////////" + jsonResponse['status'].toString());
          return true;
        }
        else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }


  Future<dynamic?> updateUserEducationInfo(String userId,String sscInstitute, String sscPassYear,
      String sscGrade, String hscInstitute, String hscPassYear,
      String hscGrade,String bscInstitute, String bscPassYear,
      String bscGrade,String mscInstitute, String mscPassYear,
      String mscGrade,) async {

    final String? logInToken = _getStorage.read('token');

    final String? id = _getStorage.read('userID').toString();

    var userData = new Map();
    userData['user_id'] = userId;
    userData['ssc_passing_year'] = sscPassYear;
    userData['hsc_passing_year'] = hscPassYear;
    userData['bsc_passing_year'] = bscPassYear;
    userData['msc_passing_year'] = mscPassYear;
    userData['ssc_grade'] = sscGrade;
    userData['hsc_grade'] = hscGrade;
    userData['bsc_grade'] = bscGrade;
    userData['msc_grade'] = mscGrade;
    userData['ssc_institution'] = sscInstitute;
    userData['hsc_institution'] = hscInstitute;
    userData['bsc_institution'] = bscInstitute;
    userData['msc_institution'] = mscInstitute;



    final url = Uri.parse(BASE_URL+'update-user-educational-info/'+id.toString());


    var response = await http.post(
        url,
        body: userData,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("update bio //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("update bio //////////" + jsonResponse['status'].toString());
          return true;
        }
        else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }


  Future<dynamic?> updateUserProfessionalnfo(String userId,String officeAddress, String year,
      String designation, String companyName) async {

    final String? logInToken = _getStorage.read('token');

    final String? id = _getStorage.read('userID').toString();

    var userData = new Map();
    userData['user_id'] = userId;
    userData['office_address'] = officeAddress;
    userData['year'] = year;
    userData['designation'] = designation;
    userData['name_of_company'] = companyName;



    final url = Uri.parse(BASE_URL+'update-user-professional/'+id.toString());


    var response = await http.post(
        url,
        body: userData,
        headers: {'Authorization': 'Bearer $logInToken'}
    );

    if (response.statusCode == 200) {
      print("update bio //////////" + response.body.toString());

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          print("update bio //////////" + jsonResponse['status'].toString());
          return true;
        }
        else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

}
