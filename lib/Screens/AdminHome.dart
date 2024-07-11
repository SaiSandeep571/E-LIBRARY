import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_library/Screens/AddBookScreen.dart';
import 'package:e_library/Screens/adminBooklist.dart';
import 'package:e_library/login.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List rentedList = [];

  fetchUserBook() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    rentedList.clear();
    db.collection("rented_list").get().then((value) {
      for (var data in value.docs) {
        rentedList.add(data);
      }
      setState(() {});
    });
  }

  int stringTo5DigitId(String input) {
    // Convert the input string to a list of bytes
    var bytes = utf8.encode(input);

    // Compute the SHA-256 hash of the input string
    var hash = sha256.convert(bytes);

    // Convert the hash to a hex string
    var hexString = hash.toString();

    // Take the first 5 digits of the hex string and convert them to an integer
    var idString = hexString.substring(0, 5);

    // Convert the hex string to an integer
    var id = int.parse(idString, radix: 16);

    // Ensure the ID is a 5-digit number by taking modulo 100000
    return id % 100000;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'E-LIBRARY',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Get.off(() => Loginscreen());
              },
              child: Icon(Icons.logout)),
          SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => AddBookScreen(), transition: Transition.rightToLeft);
        },
        child: CircleAvatar(
          child: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Department()),
              // );
              Get.to(() => adminBookList(), transition: Transition.rightToLeft);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(.8),
                        blurRadius: 0.3,
                        spreadRadius: 0.2,
                        offset: Offset(2, 1.5))
                  ]),
              child: Text(
                'VIEW BOOKS',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                for (var model in rentedList)
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    height: 125,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (false)
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 90,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  model.get("book_image"),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'BOOKNAME: ',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      model.get("book_name"),
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'BOOK ID : ',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    stringTo5DigitId(model.id).toString(),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ISSUE DATE:',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("yyyy MMM dd").format(
                                        DateTime.parse(
                                            model.get("issue_date"))),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'DUE DATE: ',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    model.get("due_date"),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            FirebaseFirestore db = FirebaseFirestore.instance;

                            db
                                .collection("booklist")
                                .doc(model.get("book_id"))
                                .update({"status": "IN"});
                            db.collection("rented_list").doc(model.id).delete();
                            fetchUserBook();
                          },
                          child: Container(
                            width: 80,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.amber),
                            child: Text("Return"),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
