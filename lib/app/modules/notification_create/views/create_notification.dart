import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNotification extends StatefulWidget {
  CreateNotification({super.key});

  @override
  State<CreateNotification> createState() => _CreateNotificationState();
}

class _CreateNotificationState extends State<CreateNotification> {
  // RxBool value = false.obs;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        toolbarHeight: screenHeigth * 0.100,
        flexibleSpace: Container(
          // height: screenHeigth * 0.120,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff00602B),
                Color(0xff0FA958),
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Create Notification",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Notifications",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                      ),
                      Text(
                        "Title",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            )),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Body",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                      Container(
                        height: screenHeigth * 0.150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            )),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeigth * 0.020,
              ),
              Container(
                // width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Date",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenWidth * 0.030,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xff777777),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_month,
                                      color: Color(0xff777777),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeigth * 0.010,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Time",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenWidth * 0.030,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff777777),
                                ),
                              ),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeigth * 0.010,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Priority",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenWidth * 0.030,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff777777),
                                ),
                              ),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.arrow_downward),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeigth * 0.010,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Validation",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenWidth * 0.030,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff777777),
                                ),
                              ),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.030,
                          ),
                          Text("Days"),
                        ],
                      ),
                      // first checkbox............................ First Checkbox............//
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("Both")
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("Push")
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("Mail")
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      // 2nd Checkbox.............................//// 2nd checkbox...............
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("For all")
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("For Alumni")
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("For Admin")
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // 3rd .............checkbox................3rd checkbox............//
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("For Moderators")
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value,
                                        onChanged: (value) => setState(() {
                                              this.value = value!;
                                            })),
                                    Text("For Stuff"),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Drafted");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                border: Border.all(
                                    width: 1, color: Color(0xff0FA958)),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Save as Draft",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("publish");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff0FA958),
                                border: Border.all(
                                    width: 1, color: Color(0xff0FA958)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Publish Now",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
