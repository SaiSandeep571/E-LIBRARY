import 'package:e_library/Screens/chat/chatController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  chatcontroller ctrl = Get.put(chatcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Know Book',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    // color: Colors.white,
                  ),
                ),
              ],
            ),
            GetBuilder<chatcontroller>(builder: (_) {
              return Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 20,
                    ),
                    ctrl.messageCard("Welcome dear reader , : )", false),
                    ctrl.messageCard("Which book do you want to know?", false),
                    for (var data in ctrl.Messages) data,
                 
                  ],
                ),
              ));
            }),
            Container(
              width: 350,
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: ctrl.inputController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter book name ",
                                isDense: true,
                                isCollapsed: false),
                          ))),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (ctrl.inputController.text.isNotEmpty)
                        ctrl.promteBook(bookName: ctrl.inputController.text);
                      ctrl.inputController.text = "";
                      ctrl.update();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.send),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      )),
    );
  }
}
