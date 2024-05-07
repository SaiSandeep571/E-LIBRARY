import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Department extends StatelessWidget {
  const Department({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('DEPARTMENT',
               style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w700,
                          fontSize:20,                   
                        ),
                        ),

                        SizedBox(height: 10),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _options('COMPUTER SCIENCE ENGINEERING'),
                  _options('MECHANICAL ENGINEERING'),
                ],
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _options('CIVIL ENGINEERING'),
                  _options('ELECTRICAL & ELECTRONICS ENGINEERING'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _options('ELECTRONICS & COMMUNICATION ENGINEERING'),
                  _options('POLY'),
                ],
              ),

              
              
            ],
          ),
        ),
      ),
    );
  }

 
}

_options(String text) {
    return Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w600,
                          fontSize:15,                   
                        ),),
            );
  }