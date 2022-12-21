import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utill/constant.dart';
import '../../base/views/base_view.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/user_profile_controller.dart';


class UserProfileView extends StatefulWidget {


  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {



  UserProfileController controller = Get.put(UserProfileController());


  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;


    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //     backgroundColor: Color(0xff0FA958),
          //     child: CircleAvatar(
          //       backgroundColor: Colors.white,
          //       child: Icon(
          //         Icons.add,
          //         color: Color(0xff777777),
          //       ),
          //     ),
          //     onPressed: () {
          //       // Get.back();
          //       Get.to(
          //           ()=> BaseView()
          //       );
          //       print('clicked');
          //     }),
          appBar: AppBar(
            elevation: 0.0,
            // backgroundColor: Color(0xff0FA958),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: GestureDetector(
              onTap: (){
                print("Clicked");
                  Get.to(
                      ()=>BaseView()
                  );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Profile",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: screenheight * 0.017,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // backgroundColor: Color(0xff0FA958),
          body: Obx(() => controller.isUserInfoLoading.value == true ? Center(
            child: Container(
              color: Colors.white,
              height: screenheight * 0.25,
              width: screenheight * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                      child: Lottie.asset("assets/files/loading.json")
                  ),
                  Text("Please wait ....",style: GoogleFonts.poppins(
                      color: Colors.grey
                  ),)
                ],
              ),
            ),
          ) : Padding(
            padding: EdgeInsets.only(
              top: 2,
              left: 8,
              right: 8,
            ),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(
                      left: screenheight * 0.020,
                      right: screenheight * 0.020
                  ),
                  child: Divider(
                    height: 2.0,
                    color: titleTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffE5E5E5),
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              0.0, // Move to bottom 5 Vertically
                            ),
                          ),
                        ],
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Obx(() =>  controller.isUserInfoLoading.value == true ? Center(
                        child: CircularProgressIndicator(),
                      ) :
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                  controller.userInfo.value.userInfo![0].image != null || controller.userInfo.value.userInfo![0].image != '' ?
                                  // FadeInImage(
                                  //   placeholder: AssetImage('assets/images/user.png'), image: NetworkImage(
                                  //   IMAGE_HEADER+controller.userInfo.value.userInfo!.image.toString(),
                                  // ),
                                  //   fit: BoxFit.cover,) as ImageProvider<Object>
                                  NetworkImage(IMAGE_HEADER+controller.userInfo.value.userInfo![0].image.toString())  as ImageProvider<Object>
                                      :
                                  AssetImage('assets/images/user.png'),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.userInfo.value.userInfo![0].fullName.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff777777),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.userInfo.value.userInfo![0].jobSector.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.userInfo.value.userInfo![0].professionalInfo!.length == 0 ?
                                        "" : controller.userInfo.value.userInfo![0].professionalInfo![0].nameOfCompany.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff777777),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              await controller.getFile();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(
                                                  controller.fileName == "" ? "Upload CV" :
                                                  controller.fileName.value.toString(),
                                                  style: TextStyle(
                                                    color: Color(0xff777777),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Export CV as",
                                            style: TextStyle(
                                              color: Color(0xff777777),
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(Icons.picture_as_pdf),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),)

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          profileItems_Bio(
                            icon: Icons.person,
                            screenWidth: screenWidth,
                            longText: controller.bioInfoText.toString(),
                            title: "Bio",
                          ),
                          profileItems_Contact_info(
                            screenWidth: screenWidth,
                            title: "Contact & Social Information",
                            icon: Icons.contact_phone,
                          ),
                          profileItems_Educational_info(
                            screenWidth: screenWidth,
                            longText: controller.professionalInfoText.toString(),
                            title: "Educational Info",
                            icon: Icons.school_outlined,
                          ),
                          profileItems_Professional_info(
                            screenWidth: screenWidth,
                            longText: controller.professionalInfoText.toString(),
                            title: "Professional Info",
                            icon: Icons.shopping_bag_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
class profileItems_Bio extends StatefulWidget {
   profileItems_Bio({
    Key? key,
    required this.screenWidth,
    required this.longText,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double screenWidth;
  late  String longText;
  final String title;
  final IconData icon;

  @override
  State<profileItems_Bio> createState() => _profileItems_BioState();
}

class _profileItems_BioState extends State<profileItems_Bio> {

  UserProfileController controller = Get.put(UserProfileController());
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 10.0
            ),
            child: Icon(
              widget.icon,
              size: widget.screenWidth * 0.080,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xff0FA958),
                    width: 4,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff777777),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showBioDialog(context);
                          },
                          child: Icon(
                            Icons.edit_note,
                          ),
                        ),
                      ],
                    ),
                    Obx(() => Text(
                      controller.userInfo.value.userInfo![0].bio.toString() == 'null' ? "" :  controller.userInfo.value.userInfo![0].bio.toString().toString() ,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 13,
                          color: Color(0xff777777),
                        ),
                      ),
                    ),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showBioDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
          contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: EdgeInsets.symmetric(horizontal: 15),

          contentTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          title: Container(
            width: 300,
            child: Text('Enter your bio',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: widget.screenWidth * 0.035
            ),),
          ),
          //EN: Logging out
          content: Padding(
            padding: EdgeInsets.only(
              right: 25
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color(0xffC4C4C4), width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue:  controller.userInfo.value.userInfo![0].bio.toString() == 'null' ? "" :  controller.userInfo.value.userInfo![0].bio.toString(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                  onChanged: (val){
                    controller.bioInfoText.value = val.toString();
                  },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () async {
                var result = await controller.updateBio();
                if(result == true){
                  Navigator.of(context).pop();
                }
                else {
                  Get.snackbar(
                    "Status",
                    "Could not Updated Bio",
                    colorText: Colors.white,
                    backgroundColor: Colors.orangeAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  Navigator.of(context).pop();
                }

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff00602B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class profileItems_Contact_info extends StatefulWidget {
   profileItems_Contact_info({
    Key? key,
    required this.screenWidth,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double screenWidth;
  final String title;
  final IconData icon;

  @override
  State<profileItems_Contact_info> createState() => _profileItems_Contact_infoState();
}

class _profileItems_Contact_infoState extends State<profileItems_Contact_info> {

  UserProfileController controller = Get.put(UserProfileController());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 10.0
            ),
            child: Icon(
              widget.icon,
              size: widget.screenWidth * 0.080,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xff0FA958),
                    width: 4,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff777777),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showContactDialog(context);
                          },
                          child: Icon(
                            Icons.edit_note,
                          ),
                        ),
                      ],
                    ),
                    Obx(() =>  Column(
                      children: [
                        Row(
                          children: [
                            Text("Phone No :",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.0
                              ),
                              child: Text(
                                controller.userInfo.value.userInfo![0].phoneNo.toString() == 'null' ? "" :    controller.userInfo.value.userInfo![0].phoneNo.toString(),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Personal Email :",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0
                              ),
                              child: Text(
                                controller.userInfo.value.userInfo![0].email.toString().toString() == 'null' ? "" :    controller.userInfo.value.userInfo![0].email.toString() ,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Official Email :",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0
                              ),
                              child: Text(
                                controller.userInfo.value.userInfo![0].officeEmail.toString().toString() == 'null' ? "" :    controller.userInfo.value.userInfo![0].officeEmail.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Facebook :",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                )),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0
                                ),
                                child: Text(
                                  controller.userInfo.value.userInfo![0].facebookLink.toString().toString() == 'null' ? "" :   controller.userInfo.value.userInfo![0].facebookLink.toString().toString() ,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Linkedin :",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                )),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0
                                ),
                                child: Text(
                                  controller.userInfo.value.userInfo![0].linkedinLink.toString().toString() == "null" ? "" :    controller.userInfo.value.userInfo![0].linkedinLink.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                      overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Twitter :",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff777777),
                                  ),
                                )),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0
                                ),
                                child: Text(
                                  controller.userInfo.value.userInfo![0].twitterLink.toString().toString() == 'null' ? "" :   controller.userInfo.value.userInfo![0].twitterLink.toString().toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showContactDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
          contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: EdgeInsets.symmetric(horizontal: 15),
          titleTextStyle: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16.0,
          ),
          contentTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          title: Container(
            width: 300,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Enter your contact & social info:', style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: widget.screenWidth * 0.035
                ),
                  overflow: TextOverflow.ellipsis,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 28,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  tooltip: "close",
                )
              ],
            ),
          ),
          //EN: Logging out
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue:  controller.userInfo.value.userInfo![0].phoneNo.toString() == 'null' ? "" :   controller.userInfo.value.userInfo![0].phoneNo.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter phone no.',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          )
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.phoneNo.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Get.snackbar(
                        "Status",
                        "Personal email can not be changed",
                        colorText: Colors.white,
                        backgroundColor: Colors.orangeAccent,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color(0xffC4C4C4), width: 2),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: controller.userInfo.value.userInfo![0].email.toString() == 'null' ? "" : controller.userInfo.value.userInfo![0].email.toString().toString() ,
                          keyboardType: TextInputType.phone,
                          enabled: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter personal mail.',
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              )
                          ),
                          maxLines: 1,
                          onChanged: (val){
                            controller.email.value = val.toString();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: controller.userInfo.value.userInfo![0].officeEmail.toString() == 'null' ? "" :   controller.userInfo.value.userInfo![0].officeEmail.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter official mail.',
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: Colors.grey,
                            )
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.officialEmail.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue:   controller.userInfo.value.userInfo![0].facebookLink.toString() == 'null' ? "" :   controller.userInfo.value.userInfo![0].facebookLink.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter facebook id.',
                            prefixIcon: Icon(
                              Icons.facebook,
                              color: Colors.grey,
                            )
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.facebook.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue:   controller.userInfo.value.userInfo![0].linkedinLink.toString() == 'null' ? "" :    controller.userInfo.value.userInfo![0].linkedinLink.toString() ,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter linkedin id',
                            prefixIcon: Icon(
                              CupertinoIcons.link_circle,
                              color: Colors.grey,
                            )
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.linkedin.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue:   controller.userInfo.value.userInfo![0].twitterLink.toString() == 'null' ? "" :   controller.userInfo.value.userInfo![0].twitterLink.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Twitter id',
                            prefixIcon: Icon(
                              Icons.link,
                              color: Colors.grey,
                            )
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.twitter.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () async {

                var result = await controller.updateSocialInfo();
                if(result == true){
                  Navigator.of(context).pop();
                }
                else {
                  Get.snackbar(
                    "Status",
                    "Could not Updated Bio",
                    colorText: Colors.white,
                    backgroundColor: Colors.orangeAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  Navigator.of(context).pop();
                }

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff00602B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {

                Navigator.of(context).pop();

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class profileItems_Professional_info extends StatefulWidget {
   profileItems_Professional_info({
    Key? key,
    required this.screenWidth,
    required this.longText,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double screenWidth;
  late String longText;
  final String title;
  final IconData icon;

  @override
  State<profileItems_Professional_info> createState() => _profileItems_Professional_infoState();
}

class _profileItems_Professional_infoState extends State<profileItems_Professional_info> {

  UserProfileController controller = Get.put(UserProfileController());

  bool value = false;


  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 10.0
            ),
            child: Icon(
              widget.icon,
              size: widget.screenWidth * 0.080,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xff0FA958),
                    width: 4,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff777777),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _showProfessionalInfoDialog(context,screenHeigth,screenWidth,1,'add');
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                   Obx(() => ListView.builder(
                       shrinkWrap: true,
                       itemCount: controller.userInfo.value.userInfo![0].professionalInfo!.length,
                       itemBuilder: (context,index){
                         return
                           Obx(() =>  Column(
                             children: [
                               Row(
                                 children: [
                                   Text("Company :",
                                       style: GoogleFonts.poppins(
                                         textStyle: TextStyle(
                                           fontSize: 13,
                                           color: Color(0xff777777),
                                         ),
                                       )),
                                   Expanded(
                                     child: Padding(
                                       padding: EdgeInsets.only(
                                           left: 10.0
                                       ),
                                       child: Text(
                                         controller.userInfo.value.userInfo![0].professionalInfo![index].nameOfCompany.toString() == 'null' ?
                                         "" :  controller.userInfo.value.userInfo![0].professionalInfo![index].nameOfCompany.toString(),
                                         maxLines: 1,
                                         overflow: TextOverflow.ellipsis,
                                         style: GoogleFonts.poppins(
                                           textStyle: TextStyle(
                                             fontSize: 13,
                                             color: Color(0xff777777),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                   GestureDetector(
                                     onTap: (){
                                       _showProfessionalInfoDialog(context,screenHeigth,screenWidth,index,'edit');
                                     },
                                     child: Icon(
                                         Icons.edit_note
                                     ),
                                   )
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text("Address :",
                                       style: GoogleFonts.poppins(
                                         textStyle: TextStyle(
                                           fontSize: 13,
                                           color: Color(0xff777777),
                                         ),
                                       )),
                                   Expanded(
                                     child: Padding(
                                       padding: EdgeInsets.only(
                                           left: 10.0
                                       ),
                                       child: Text(
                                         controller.userInfo.value.userInfo![0].professionalInfo![index].officeAddress.toString() == 'null' ?
                                         "" :  controller.userInfo.value.userInfo![0].professionalInfo![index].officeAddress.toString(),
                                         maxLines: 1,
                                         overflow: TextOverflow.ellipsis,
                                         style: GoogleFonts.poppins(
                                           textStyle: TextStyle(
                                               fontSize: 13,
                                               color: Color(0xff777777),
                                               overflow: TextOverflow.ellipsis
                                           ),
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text("Designation :",
                                       style: GoogleFonts.poppins(
                                         textStyle: TextStyle(
                                           fontSize: 13,
                                           color: Color(0xff777777),
                                         ),
                                       )),
                                   Expanded(
                                     child: Padding(
                                       padding: EdgeInsets.only(
                                           left: 10.0
                                       ),
                                       child: Text(
                                         controller.userInfo.value.userInfo![0].professionalInfo![index].designation.toString() == 'null' ?
                                         "" :  controller.userInfo.value.userInfo![0].professionalInfo![index].designation.toString(),
                                         maxLines: 1,
                                         overflow: TextOverflow.ellipsis,
                                         style: GoogleFonts.poppins(
                                           textStyle: TextStyle(
                                             fontSize: 13,
                                             color: Color(0xff777777),
                                           ),
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text("year :",
                                       style: GoogleFonts.poppins(
                                         textStyle: TextStyle(
                                           fontSize: 13,
                                           color: Color(0xff777777),
                                         ),
                                       )),
                                   Expanded(
                                     child: Padding(
                                       padding: EdgeInsets.only(
                                           left: 10.0
                                       ),
                                       child: Text(
                                         controller.userInfo.value.userInfo![0].professionalInfo![index].year.toString() == 'null' ?
                                         "" :  controller.userInfo.value.userInfo![0].professionalInfo![index].year.toString(),
                                         maxLines: 1,
                                         overflow: TextOverflow.ellipsis,
                                         style: GoogleFonts.poppins(
                                           textStyle: TextStyle(
                                             fontSize: 13,
                                             color: Color(0xff777777),
                                           ),
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                               SizedBox(height: screenHeigth * 0.010,)

                             ],
                           ),);
                       }),)
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showProfessionalInfoDialog(BuildContext context,double screenHeigth,double screenWidth,int index,String type) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
          contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: EdgeInsets.symmetric(horizontal: 15),

          contentTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          title: Container(
            width: 300,
            child: Text('Enter your Professional Info',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: widget.screenWidth * 0.035
              ),),
          ),
          //EN: Logging out
          content: SingleChildScrollView(
            child: Obx(() =>   ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0
                  ),
                  child: Text('Company',
                    style: GoogleFonts.poppins(
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: type == 'add' ? "" :
                        controller.userInfo.value.userInfo![0].professionalInfo![index].nameOfCompany.toString() == 'null' ?
                        "" : controller.userInfo.value.userInfo![0].professionalInfo![index].nameOfCompany.toString(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.company.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0
                  ),
                  child: Text('Address',
                    style: GoogleFonts.poppins(
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: type == 'add' ? "" :
                        controller.userInfo.value.userInfo![0].professionalInfo![index].officeAddress.toString() == 'null' ?
                        "" : controller.userInfo.value.userInfo![0].professionalInfo![index].officeAddress.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.address.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0
                  ),
                  child: Text('Designation',
                    style: GoogleFonts.poppins(
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: type == 'add' ? "" :
                        controller.userInfo.value.userInfo![0].professionalInfo![index].designation.toString() == 'null' ?
                        "" : controller.userInfo.value.userInfo![0].professionalInfo![index].designation.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          controller.designation.value = val.toString();
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Text('Joining Date',style: GoogleFonts.poppins(
                              color: Colors.black
                          ),),
                        ),
                        Container(
                            height: screenHeigth * 0.070,
                            width: screenWidth * 0.350,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xffC4C4C4),
                                  width: 2),
                            ),
                            child:
                            Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.chooseJoiningDate();
                                    controller.updateJoiningDate[index] = controller.joiningDate.value.toString();
                                    print('joinlist 22222'+controller.updateJoiningDate.value.toString());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 08.0
                                    ),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 08.0
                                  ),
                                  child: Text(type == 'add' ? controller.joiningDate.toString() :
                                      controller.updateJoiningDate[index]
                                 ),
                                )

                              ],
                            ))
                        ),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Text('End Date',style: GoogleFonts.poppins(
                              color: Colors.black
                          ),),
                        ),
                        Container(
                            height: screenHeigth * 0.070,
                            width: screenWidth * 0.350,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xffC4C4C4),
                                  width: 2),
                            ),
                            child:
                            Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.chooseEndgDate();
                                    controller.updateEndDate[index]=controller.endDate.value.toString();
                                    print('endlist 22222'+controller.updateEndDate.value.toString());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 08.0
                                    ),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 08.0
                                  ),
                                  child: Text(type == 'add' ? controller.endDate.toString() :
                                   controller.updateEndDate[index],
                                ),
                                )

                              ],
                            ))
                        ),
                      ],
                    ),

                  ],
                ),
                Visibility(
                  visible: type == 'add' ? true : false,
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() =>    Checkbox(
                            value: controller.checkValue.value,
                            onChanged: (value) {
                              controller.checkValue.value = value!;
                              if(value == true ){
                                controller.endDate.value = 'present';
                              }
                            },
                          ),),
                          Text(
                            'I am currently working here',
                            style: GoogleFonts.poppins(

                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                    visible: false,
                    child: Text(controller.year.value.toString()))

              ],
            ),)
          
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                controller.year.value = controller.joiningDate.value.toString() + controller.endDate.value.toString();
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff00602B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.longText = "";
                Navigator.of(context).pop();

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class profileItems_Educational_info extends StatefulWidget {
  profileItems_Educational_info({
    Key? key,
    required this.screenWidth,
    required this.longText,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double screenWidth;
  late String longText;
  final String title;
  final IconData icon;

  @override
  State<profileItems_Educational_info> createState() => _profileItems_Educational_infoState();
}

class _profileItems_Educational_infoState extends State<profileItems_Educational_info> {

  UserProfileController controller = Get.put(UserProfileController());

  bool value = false;
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 10.0
            ),
            child: Icon(
              widget.icon,
              size: widget.screenWidth * 0.080,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Color(0xff0FA958),
                    width: 4,
                  ),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xff777777),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        ],
                      ),
                      Obx(() =>  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  ssc field

                          Row(
                            children: [
                              Text("Secondary School Certificate",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0
                                ),),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  _showEducationalInfoDialog(context,screenHeigth,screenWidth,'ssc');
                                },
                                child: Icon(
                                    Icons.edit_note
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Institution name:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                   controller.userInfo.value.userInfo![0].educationalInfo!.sscInstitution.toString() == 'null' ? "" :
                                   controller.userInfo.value.userInfo![0].educationalInfo!.sscInstitution.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Passing year:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                      controller.userInfo.value.userInfo![0].educationalInfo!.sscPassingYear.toString() == 'null' ? "" :
                                      controller.userInfo.value.userInfo![0].educationalInfo!.sscPassingYear.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Grade :",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.sscGrade.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.sscGrade.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          // hsc field

                          Row(
                            children: [
                              Text("Higher Secondary School Certificate",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0
                                ),),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  _showEducationalInfoDialog(context,screenHeigth,screenWidth,'hsc');
                                },
                                child: Icon(
                                    Icons.edit_note
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Institution name:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                      controller.userInfo.value.userInfo![0].educationalInfo!.hscInstitution.toString() == 'null' ? "" :
                                      controller.userInfo.value.userInfo![0].educationalInfo!.hscInstitution.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Passing year:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.hscPassingYear.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.hscPassingYear.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Grade :",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.hscGrade.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.hscGrade.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          // bsc field

                          Row(
                            children: [
                              Text("Bachelor of Science Certificate",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0
                                ),),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  _showEducationalInfoDialog(context,screenHeigth,screenWidth,'bsc');
                                },
                                child: Icon(
                                    Icons.edit_note
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Institution name:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.bscInstitution.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.bscInstitution.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Passing year:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.bscPassingYear.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.bscPassingYear.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Grade :",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.bscGrade.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.bscGrade.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          // msc field

                          Row(
                            children: [
                              Text("Master of Science Certificate",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0
                                ),),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  _showEducationalInfoDialog(context,screenHeigth,screenWidth,'msc');
                                },
                                child: Icon(
                                    Icons.edit_note
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Institution name:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.mscInstitution.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.mscInstitution.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Passing year:",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.mscPassingYear.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.mscPassingYear.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Grade :",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff777777),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0
                                  ),
                                  child: Text(
                                    controller.userInfo.value.userInfo![0].educationalInfo!.mscGrade.toString() == 'null' ? "" :
                                    controller.userInfo.value.userInfo![0].educationalInfo!.mscGrade.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff777777),
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),)
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showEducationalInfoDialog(BuildContext context,double screenHeigth,double screenWidth,
      String type) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
          contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: EdgeInsets.symmetric(horizontal: 15),

          contentTextStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
          title: Container(
            width: 300,
            child: Text('Enter your Educational Info',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: widget.screenWidth * 0.035
              ),),
          ),
          //EN: Logging out
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0
                  ),
                  child: Text('Institution Name',
                    style: GoogleFonts.poppins(
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: type == 'ssc' ?
                        controller.userInfo.value.userInfo![0].educationalInfo!.sscInstitution.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.sscInstitution.toString() : type == 'hsc' ?
                        controller.userInfo.value.userInfo![0].educationalInfo!.hscInstitution.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.hscInstitution.toString() : type == 'bsc' ?
                        controller.userInfo.value.userInfo![0].educationalInfo!.bscInstitution.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.bscInstitution.toString() : controller.userInfo.value.userInfo![0].educationalInfo!.mscInstitution.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.mscInstitution.toString(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          type == 'ssc' ? controller.sscInstitution.value = val.toString() :
                              type == 'hsc' ? controller.hscInstitution.value = val.toString() :
                                  type == 'bsc' ? controller.bscInstitution.value = val.toString() :
                                      controller.mscInstitution.toString() ;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0
                  ),
                  child: Text('Passing year',
                    style: GoogleFonts.poppins(
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue:  type == 'ssc' ?
                        controller.userInfo.value.userInfo![0].educationalInfo!.sscPassingYear.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.sscPassingYear.toString() : type == 'hsc' ?
                       controller.userInfo.value.userInfo![0].educationalInfo!.hscPassingYear.toString() == 'null' ? "":
                       controller.userInfo.value.userInfo![0].educationalInfo!.hscPassingYear.toString() : type == 'bsc' ?
                       controller.userInfo.value.userInfo![0].educationalInfo!.bscPassingYear.toString() == 'null' ? "":
                       controller.userInfo.value.userInfo![0].educationalInfo!.bscPassingYear.toString() : controller.userInfo.value.userInfo![0].educationalInfo!.mscPassingYear.toString() == 'null' ? "": controller.userInfo.value.userInfo![0].educationalInfo!.mscPassingYear.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          type == 'ssc' ? controller.sscPassYear.value = val.toString() :
                          type == 'hsc' ? controller.hscPassYear.value = val.toString() :
                          type == 'bsc' ? controller.bscPassYear.value = val.toString() :
                          controller.mscPassYear.toString() ;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0
                  ),
                  child: Text('Grade',
                    style: GoogleFonts.poppins(
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 25,
                      top: 10.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue:  type == 'ssc' ?
                        controller.userInfo.value.userInfo![0].educationalInfo!.sscGrade.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.sscGrade.toString() : type == 'hsc' ?
                        controller.userInfo.value.userInfo![0].educationalInfo!.hscGrade.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.hscGrade.toString() : type == 'bsc' ?
                        controller.userInfo.value.userInfo![0].educationalInfo!.bscGrade.toString() == 'null' ? "":
                        controller.userInfo.value.userInfo![0].educationalInfo!.bscGrade.toString() : controller.userInfo.value.userInfo![0].educationalInfo!.mscGrade.toString() == 'null' ? "": controller.userInfo.value.userInfo![0].educationalInfo!.mscGrade.toString(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                        onChanged: (val){
                          type == 'ssc' ? controller.sscGrade.value = val.toString() :
                          type == 'hsc' ? controller.hscGrade.value = val.toString() :
                          type == 'bsc' ? controller.bscGrade.value = val.toString() :
                          controller.mscGrade.toString() ;
                        },
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () async {
                var result = await controller.updateEducationInfo();
                if(result == true){
                  Navigator.of(context).pop();
                }
                else {
                  Get.snackbar(
                    "Status",
                    "Could not Updated Education Info",
                    colorText: Colors.white,
                    backgroundColor: Colors.orangeAccent,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff00602B),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.longText = "";
                Navigator.of(context).pop();

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


