import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

import '../../home/model/user_info_model.dart';
import '../providers/user_profile_provider.dart';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController

  File? documentFile;

  var fileName = ''.obs;


  GetStorage _getStorage = GetStorage('app_storage');


  var id = ''.obs;
  var userId = ''.obs;
  var fullName = ''.obs;
  var bioInfoText = ''.obs;
  var nickName = ''.obs;
  var email = ''.obs;
  var phoneNo = ''.obs;
  var officialEmail = ''.obs;
  var facebook = ''.obs;
  var linkedin = ''.obs;
  var twitter = ''.obs;
  var image = ''.obs;
  var officeMail = ''.obs;
  var jobSector = ''.obs;
  var batch = ''.obs;



  var sscInstitution = ''.obs;
  var sscGrade = ''.obs;
  var sscPassYear = ''.obs;
  var hscInstitution = ''.obs;
  var hscGrade = ''.obs;
  var hscPassYear = ''.obs;
  var bscInstitution = ''.obs;
  var bscGrade = ''.obs;
  var bscPassYear = ''.obs;
  var mscInstitution = ''.obs;
  var mscGrade = ''.obs;
  var mscPassYear = ''.obs;



  var professionalInfoText= ''.obs;

  var company = ''.obs;
  var address = ''.obs;
  var designation = ''.obs;
  var year = ''.obs;
  var joiningDate = ''.obs;
  var endDate = ''.obs;

  var updateYear = ''.obs;
  var updateJoiningDate = <String> [].obs;
  var updateEndDate = <String>[].obs;

  RxBool checkValue = false.obs;


  var isUserInfoLoading = false.obs;
  var userInfo = UserInfoModel().obs;


  var isLoading = false.obs;

  var count = 1.obs;
  @override
  void onInit() {
    super.onInit();
    userId.value =  _getStorage.read('userID').toString();
    print("user........id"+userId.value.toString());
    fetchUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> getFile() async {

    final pickedFile = await FilePicker.platform.pickFiles();

    if(pickedFile != null){
      documentFile = File(pickedFile.files.single.path.toString());
      fileName.value = pickedFile.files.single.name.toString();

    }
  }

  chooseJoiningDate() async{

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2130),
        builder: (context,widget) => Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.dark(
                surface: Colors.blueAccent
            ),
            dialogBackgroundColor: Colors.blueAccent.shade200,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.white,
                onSurface: Colors.white, // button text color
              ),
            ),
          ),
          child: widget!,
        )
    );
    joiningDate.value = pickedDate.toString().substring(0,11);

  }
  chooseEndgDate() async{

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2130),
        builder: (context,widget) => Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.dark(
                surface: Colors.blueAccent
            ),
            dialogBackgroundColor: Colors.blueAccent.shade200,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.white,
                onSurface: Colors.white, // button text color
              ),
            ),
          ),
          child: widget!,
        )
    );
    endDate.value = pickedDate.toString().substring(0,11);


  }

  Future<void> fetchUserInfo() async {
    isUserInfoLoading.value = true;
    try {

      await UserProfileProvider().getUserInfo().then((value) {
        userInfo.value = value!;
        id.value = userInfo.value.userInfo![0].id.toString();
        fullName.value = userInfo.value.userInfo![0].fullName.toString();
        bioInfoText.value = userInfo.value.userInfo![0].bio.toString();
        nickName.value = userInfo.value.userInfo![0].nickName.toString();
        phoneNo.value = userInfo.value.userInfo![0].phoneNo.toString();
        facebook.value = userInfo.value.userInfo![0].facebookLink.toString();
        linkedin.value = userInfo.value.userInfo![0].linkedinLink.toString();
        twitter.value = userInfo.value.userInfo![0].twitterLink.toString();
        image.value = userInfo.value.userInfo![0].image.toString();
        officeMail.value = userInfo.value.userInfo![0].officeEmail.toString();
        jobSector.value = userInfo.value.userInfo![0].jobSector.toString();
        batch.value = userInfo.value.userInfo![0].batch.toString();

        sscInstitution.value = userInfo.value.userInfo![0].educationalInfo!.sscInstitution.toString();
        sscGrade.value = userInfo.value.userInfo![0].educationalInfo!.sscGrade.toString();
        sscPassYear.value = userInfo.value.userInfo![0].educationalInfo!.sscPassingYear.toString();
        hscInstitution.value = userInfo.value.userInfo![0].educationalInfo!.hscInstitution.toString();
        hscGrade.value = userInfo.value.userInfo![0].educationalInfo!.hscGrade.toString();
        hscPassYear.value = userInfo.value.userInfo![0].educationalInfo!.hscPassingYear.toString();
        bscInstitution.value = userInfo.value.userInfo![0].educationalInfo!.bscInstitution.toString();
        bscGrade.value = userInfo.value.userInfo![0].educationalInfo!.bscGrade.toString();
        bscPassYear.value = userInfo.value.userInfo![0].educationalInfo!.bscPassingYear.toString();
        mscInstitution.value = userInfo.value.userInfo![0].educationalInfo!.mscInstitution.toString();
        mscGrade.value = userInfo.value.userInfo![0].educationalInfo!.mscGrade.toString();
        mscPassYear.value = userInfo.value.userInfo![0].educationalInfo!.mscPassingYear.toString();


        for(int i = 0 ; i< userInfo.value.userInfo![0].professionalInfo!.length ; i++){
          updateJoiningDate.add(
              userInfo.value.userInfo![0].professionalInfo![i].year.toString() == 'null' ?
              "" : userInfo.value.userInfo![0].professionalInfo![i].year.toString().substring(0,4)
          );

          updateEndDate.add(
            userInfo.value.userInfo![0].professionalInfo![i].year.toString() == 'null' ?
            "" : userInfo.value.userInfo![0].professionalInfo![i].year.toString().length > 3 ?
            userInfo.value.userInfo![0].professionalInfo![i].year.toString().substring(0,3) :
            userInfo.value.userInfo![0].professionalInfo![i].year.toString().substring(0,3)
          );
        }

        print('joinlist 111111'+updateJoiningDate.value.toString());
        print('endlist 111111'+updateEndDate.value.toString());



      });

       isUserInfoLoading.value = false;
    }

    catch(e){
      print(e.toString());
    }
  }

  Future<dynamic> updateBio() async {

    isLoading.value = true;

    var status = await UserProfileProvider().updateUserBio(bioInfoText.value.toString());
    print("bio status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      fetchUserInfo();
      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }

  Future<dynamic> updateSocialInfo() async {

    isLoading.value = true;

    var status = await UserProfileProvider().updateUserSocialInfo(
      phoneNo.value.toString(),
      officialEmail.value.toString(),
      facebook.value.toString(),
      twitter.value.toString(),
      linkedin.value.toString(),

    );
    print("bio status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      fetchUserInfo();
      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }

  Future<dynamic> updateEducationInfo() async {

    isLoading.value = true;

    var status = await UserProfileProvider().updateUserEducationInfo(
      userId.value.toString(),
      sscInstitution.value.toString(),
      sscPassYear.value.toString(),
      sscGrade.value.toString(),
      hscInstitution.value.toString(),
      hscPassYear.value.toString(),
      hscGrade.value.toString(),
      bscInstitution.value.toString(),
      bscPassYear.value.toString(),
      bscGrade.value.toString(),
      mscInstitution.value.toString(),
      mscPassYear.value.toString(),
      mscGrade.value.toString(),

    );
    print("bio status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      fetchUserInfo();
      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }

  Future<dynamic> updateProfessioanlInfo() async {

    isLoading.value = true;

    var status = await UserProfileProvider().updateUserProfessionalnfo(
      userId.value.toString(),
      address.value.toString(),
      year.value.toString(),
      designation.value.toString(),
      company.value.toString(),

    );
    print("bio status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      fetchUserInfo();
      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }
}
