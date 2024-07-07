import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_library/Screens/controller.dart';
import 'package:e_library/main.dart';
import 'package:e_library/utils/inputField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookOvewViewPage extends StatefulWidget {
  QueryDocumentSnapshot model;
  BookOvewViewPage({super.key, required this.model});

  @override
  State<BookOvewViewPage> createState() => _BookOvewViewPageState();
}

class _BookOvewViewPageState extends State<BookOvewViewPage> {
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

  TextEditingController DateText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(widget.model.get("image"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'BOOK ID: ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              stringTo5DigitId(widget.model.id).toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
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
                              widget.model.get("name"),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'AUTHOR: ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.model.get("author"),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'TYPE: ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.model.get("type"),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'BOOK AVAILABILITY: ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            widget.model.get("status"),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
                InkWell(
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 7)));
        
                      DateText.text =
                          DateFormat("yyyy MMM dd").format(DateTime.now());
        
                      setState(() {});
                    },
                    child: InputTextField(
                        title: "Date of Return",
                        enable: false,
                        controller: DateText)),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    homeController ctrl = Get.put(homeController());
                    if (widget.model.get("status") == "IN") {
                      Fluttertoast.showToast(msg: "book rending processing");
        
                      FirebaseFirestore db = FirebaseFirestore.instance;
        
                      db.collection("rented_list").add({
                        "user_id": email,
                        "book_id": widget.model.id,
                        "book_name": widget.model.get("name"),
                        "book_image": widget.model.get("image"),
                        "issue_date": DateTime.now().toString(),
                        "due_date": DateText.text
                      });
        
                      db
                          .collection("booklist")
                          .doc(widget.model.id)
                          .update({"status": "OUT"});
                      Fluttertoast.showToast(msg: "book rended");
                      ctrl.fetchUserBook();
        
                      Get.back();
                    } else {
                      Fluttertoast.showToast(msg: "Book currently no avalible");
                    }
                  },
                  child: Container(
                    width: 350,
                    height: 55,
                    decoration: BoxDecoration(
                        color:  Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text('BORROW',
                          style: GoogleFonts.lexend(
                            fontSize:25,
                            fontWeight: FontWeight.w600
                          ),
                          )
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
