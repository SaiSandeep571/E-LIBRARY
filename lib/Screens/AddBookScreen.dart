import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/utils/InputDropDown.dart';
import 'package:e_library/utils/inputField.dart';
import 'package:e_library/utils/textLabel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController image = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      appText("Add Book to Library",
                          size: 18, fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextField(
                          title: "Add Book Name", controller: nameController),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextField(
                          title: "Add Author name",
                          controller: authorController),
                      SizedBox(
                        height: 10,
                      ),
                      InputDropDown(
                        title: "Add Department name",
                        items: ["CSE", "CE", "ME", "EEE", "EC"],
                        selectedValue: departmentController.text == ""
                            ? null
                            : departmentController.text,
                        child: (value) => appText("$value"),
                        change: (value) {
                          setState(() {
                            departmentController.text = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextField(
                          title: "Add Type ", controller: typeController),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextField(
                          title: "Add book name",
                          height: 130,
                          controller: descriptionController),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextField(
                          title: "Add Cover Image", controller: image),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  FirebaseFirestore db = FirebaseFirestore.instance;
                  db.collection("booklist").add({
                    "name": nameController.text.toUpperCase(),
                    "Description": descriptionController.text,
                    "author": authorController.text,
                    "department": departmentController.text,
                    "image": image.text == ""
                        ? 'https://media.istockphoto.com/id/1472933890/vector/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-moment-placeholder.jpg'
                        : image.text,
                    "status": "IN",
                    "type": typeController.text
                  });
                  Fluttertoast.showToast(msg: "Book Added Successfully");
                  Get.back();
                },
                child: Container(
                  width: 330,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber),
                  child: appText("Add Book",
                      size: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
