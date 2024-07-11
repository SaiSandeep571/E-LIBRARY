import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/Screens/bookOverViewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';

class chatcontroller extends GetxController {
  String apiKey = "sk-proj-4tgkVMlLMSyRejB84supT3BlbkFJzqdlvgJCc0DGeELwwa7M";
  TextEditingController inputController = TextEditingController();

  List<Widget> Messages = [];
  promteBook({required String bookName}) async {
    Messages.add(messageCard(bookName, true));
    inputController.clear();
    update();
    final Response = await post(
        Uri.parse("https://api.openai.com/v1/completions"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey"
        },
        body: json.encode({
          "model": "gpt-3.5-turbo-instruct",
          "prompt":
              "Generate a paragraph of about the book name startes with  ${bookName} , the book details include short content of the book , full name  of the book , author of the book and year of publish ",
          "max_tokens": 1000,
          "temperature": .7
        }));
    print(Response.body);
    if (Response.statusCode == 200) {
      var data = json.decode(Response.body);

      Messages.add(messageCard(data["choices"][0]["text"], false));
      update();
      findBook(bookName);
    }
  }

  findBook(String bookname) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseFirestore.instance
        .collection('booklist')
        .where('name', isGreaterThanOrEqualTo: bookname.toUpperCase())
        .where('name', isLessThan: bookname.toUpperCase() + '\uf8ff')
        .get()
        .then((value) {
      print(value.docs);
      if (value.docs.length > 0) {
        Messages.add(messageCard("We have some releated books here ", false));
        Messages.add(Wrap(
          children: [
            for (var data in value.docs)
              InkWell(
                onTap: () {
                  Get.to(() => BookOvewViewPage(model: data));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(),
                      color: Colors.amberAccent.withOpacity(.2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.get("name"),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data.get("author"),
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              )
          ],
        ));
      } else {
        Messages.add(messageCard(
            "we have no book named $bookname in our library : |", false));
      }
      Messages.add(messageCard(
          "Enter the name of next book to know the detailes", false));
      update();
    });

    update();
  }

  Widget messageCard(String message, bool isleft) {
    return FadeInRight(
      child: Container(
        alignment: (isleft!) ? Alignment.centerRight : Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // margin: EdgeInsets.only(left: 100.h),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white54),
          constraints: BoxConstraints(maxWidth: 300, maxHeight: 500),
          child: Text(
            message!,
            textAlign: (isleft) ? TextAlign.right : TextAlign.left,
            style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(.6),
                fontWeight: FontWeight.w500),
          ),
          // child: TypeWriter.text(
          //   data,
          //   alignment: Alignment.centerRight,
          //   textAlign: TextAlign.right,
          //   duration: Duration(milliseconds: 50),
          // ),
        ),
      ),
    );
  }
}
