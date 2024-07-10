import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/Screens/chat/ChatScreen.dart';
import 'package:e_library/Screens/controller.dart';
import 'package:e_library/Screens/department.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  Home({super.key});
  homeController ctrl = Get.put(homeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(() => ChatScreen(), transition: Transition.rightToLeft);
          },
          child: CircleAvatar(
            child: IconButton(onPressed: null, icon: Icon(Icons.abc)),
          ),
        ),
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
        ),
        body: GetBuilder<homeController>(builder: (_) {
          return Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Department()),
                    );
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
                      'EXPLORE BOOKS',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Text(
                  'My Books',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          for (var data in _.rentedList)
                            _detailbox(model: data),
                          // _detailbox('assets/os.png', 'EGANA THINNAM',
                          //     'CHRISTY LEO', '09/09/2009', '19/09/2009'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////

_detailbox({required QueryDocumentSnapshot model}) {
  homeController ctrl = Get.put(homeController());
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(10),
    height: 125,
    width: 400,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
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
                    ctrl.stringTo5DigitId(model.id).toString(),
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
                    DateFormat("yyyy MMM dd")
                        .format(DateTime.parse(model.get("issue_date"))),
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
              )
            ],
          ),
        ),
      ],
    ),
  );
}
