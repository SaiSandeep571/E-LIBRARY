import 'package:e_library/Screens/book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Department extends StatelessWidget {
  const Department({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                         color: Colors.white,),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                ),
          
              SizedBox(height: 10),
          
                Text('DEPARTMENT :',
                 style: GoogleFonts.poppins(
                            fontWeight:FontWeight.w700,
                            fontSize:20,  
                            color: Colors.white,                 
                          ),
                          ),
          
                          SizedBox(height: 10),
                
          
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _options(context,'COMPUTER SCIENCE ENGINEERING'),
                    _options(context,'MECHANICAL ENGINEERING'),
                  ],
                ),
          
                 Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _options(context,'CIVIL ENGINEERING'),
                    _options(context,'ELECTRICAL & ELECTRONICS ENGINEERING'),
                  ],
                ),
          
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _options(context,'ELECTRONICS & COMMUNICATION ENGINEERING'),
                  ],
                ),
          
                SizedBox(height: 10),
          
                Text('OTHERS :',
                 style: GoogleFonts.poppins(
                            fontWeight:FontWeight.w700,
                            fontSize:20,  
                            color: Colors.white,                 
                          ),
                          ),
          
                          SizedBox(height: 10),
                
          
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _options(context,'FICTION'),
                    _options(context,'NON-FICTION'),
                  ],
                ),
          
                 Row(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _options(context,'NOVELS'),
                    _options(context,'REFERENCE WORKS'),
                  ],
                ),
          
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

_options(BuildContext context , String text) {
    return GestureDetector(
       onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Book()),);
              },


      child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                            fontWeight:FontWeight.w600,
                            fontSize:15,                  
                          ),),
              ),
    );
  }