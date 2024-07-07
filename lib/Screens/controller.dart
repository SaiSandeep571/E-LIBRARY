import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_library/main.dart';
import 'package:get/get.dart';

class homeController extends GetxController {
  List<QueryDocumentSnapshot> rentedList = [];

  fetchUserBook() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    rentedList.clear();
    db
        .collection("rented_list")
        .where("user_id", isEqualTo: email)
        .get()
        .then((value) {
      for (var data in value.docs) {
        rentedList.add(data);
      }
      update();
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
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserBook();
  }
}
