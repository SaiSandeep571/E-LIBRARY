import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_library/Screens/bookView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Book extends StatefulWidget {
  String department;
  Book({super.key, required this.department});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  List<QueryDocumentSnapshot> BookList = [];
  TextEditingController tctrl = TextEditingController();

  loadBooks() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    BookList.clear();
    db
        .collection("booklist")
        .where("department", isEqualTo: widget.department)
        .get()
        .then((value) {
      for (var data in value.docs) {
        BookList.add(data);
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
    loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 32,
                      width: 192,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextFormField(
                        controller: tctrl,
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            hintText: 'Search Book',
                            hintStyle: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 43, 42, 42),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(Icons.search_rounded),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Wrap(
                        //    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var data in BookList)
                            if (tctrl.text.isEmpty ||
                                data
                                    .get("name")
                                    .toString()
                                    .toUpperCase()
                                    .contains(tctrl.text.toUpperCase()))
                              bookdetail(context, data),
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


