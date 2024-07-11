import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_library/Screens/bookOverViewPage.dart';
import 'package:e_library/utils/textLabel.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

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

bookdetail(BuildContext context, QueryDocumentSnapshot model,
    {bool isadmin = false}) {
  return InkWell(
    onTap: () {
      //_dialogbox(context, image, text1, text2, text3, text4, text5, text6);

      Get.to(() => BookOvewViewPage(model: model),
          transition: Transition.rightToLeft);
    },
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      height: (isadmin) ? 270 : 230,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            height: 100,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(model.get("image"), fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'BOOK ID: ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  stringTo5DigitId(model.id).toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
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
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  model.get("name"),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
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
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  model.get("author"),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
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
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  model.get("type"),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'AVAILABILITY: ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                model.get("status"),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (isadmin)
            InkWell(
              onTap: () {
                // FirebaseFirestore db = FirebaseFirestore.instance;
                // db.collection("")
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
                child: appText("DELETE BOOk",
                    size: 10, fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
    ),
  );
}
