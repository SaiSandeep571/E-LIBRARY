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
                         _bookdetail(context,'assets/leo.png','EGANA THINNAM','CHRISTY LEO','YES'),
                         _bookdetail(context,'assets/leo.png','EGANA THINNAM','CHRISTY LEO','YES'),
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

 _bookdetail(BuildContext context,String image,text1,text2,text3) {
  return InkWell(
    onTap: () {
              _dialogbox(context, image, text1, text2, text3);
              },
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      height: 225,
      width: 165,
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
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'BOOKNAME:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  text1,
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
                'AUTHOR:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  text2,
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
                'BOOK AVAILABILITY:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                text3,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_dialogbox( BuildContext context,String image,text1,text2,text3) {
  return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Book Details',
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),),
            content: Container(
              height: 250,
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(image, fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'BOOKNAME:',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          text1,
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
                        'AUTHOR:',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          text2,
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
                        'BOOK AVAILABILITY:',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        text3,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),


                ],
              ),
            ),
            actionsAlignment:MainAxisAlignment.center,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:Text(
                      'CLOSE',
                        style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                ),
              ),
            ],
          );
        },
      );
    }
