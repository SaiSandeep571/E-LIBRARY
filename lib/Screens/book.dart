import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
      
        body: Container(
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
      
      
              
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         _bookdetails('assets/leo.png','EGANA THINNAM','CHRISTY LEO'),
                         _bookdetails('assets/leo.png','EGANA THINNAM','CHRISTY LEO'),
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

_bookdetails( String image,text1,text2) {
    return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            height: 225,
            width: 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [

                 Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8) ,
                    child: Image.asset(image,fit: BoxFit.fill,)),
                 ),

                 SizedBox(height: 10),
                
                Row(
                  children: [
                    Text('BOOKNAME:',
                    style: GoogleFonts.poppins(
                              fontWeight:FontWeight.w600,
                              fontSize:10,                   
                            ),),
                    Text(text1,
                    style: GoogleFonts.poppins(
                              fontWeight:FontWeight.w500,
                              fontSize:10,                   
                            ),)
                  ],
                ),
                Row(
                  children: [
                    Text('AUTHOR:',
                    style: GoogleFonts.poppins(
                              fontWeight:FontWeight.w600,
                              fontSize:10,                   
                            ),),
                    Text(text2,
                    style: GoogleFonts.poppins(
                              fontWeight:FontWeight.w500,
                              fontSize:10,                   
                            ),)
                  ],
                ),
 
              ],
            ),
           );
  }