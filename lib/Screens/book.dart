import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                             color: Colors.white,),
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
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextFormField( 
                          style: GoogleFonts.poppins(
                            fontSize:13,
                            color:Colors.white,
                            fontWeight:FontWeight.w600
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search Book',
                            hintStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 43, 42, 42),
                              fontSize: 12,
                              fontWeight: FontWeight.w500         
                            ),
                            prefixIcon: Icon(Icons.search_rounded),
                            border: InputBorder.none
                          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         _bookdetail(context,'assets/os.png','123','EGANA THINNAM','CHRISTY LEO','TEXTBOOK','2','YES'),
                         _bookdetail(context,'assets/os.png','234','EGANA THINNAM','CHRISTY LEO','TEXTBOOK','3','YES'),
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

 _bookdetail(BuildContext context,String image,text1,text2,text3,text4,text5,text6) {
  return InkWell(
    onTap: () {
              _dialogbox(context, image, text1, text2, text3, text4,text5,text6);
              },
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      height: 230,
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
                'BOOK ID: ',
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
                'BOOKNAME: ',
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
                'AUTHOR: ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  text3,
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
                  text4,
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
                'NO OF BOOKS: ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text(
                  text5,
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
                'BOOK AVAILABILITY: ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                text6,
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

_dialogbox( BuildContext context,String image,text1,text2,text3,text4,text5,text6) {
  return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
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
                'BOOK ID: ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Expanded(
                child: Text(
                  text1,
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
                  text2,
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
                  text3,
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
                  text4,
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
                'NO OF BOOKS: ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Expanded(
                child: Text(
                  text5,
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
                text6,
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
