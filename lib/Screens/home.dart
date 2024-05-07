import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu_outlined),
          actions: [Icon(Icons.notifications)],
        ),

        body: 
        Column(
          children: [
            Text('My Books',
            style: GoogleFonts.poppins(
              fontWeight:FontWeight.w500,
              fontSize:20
            ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                 _detailbox('C PROGRAMMING','SURESH','10/01/2003','17/01/2003')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

//////////////////////////////////////////////////////////////////////////////////////////////

 _detailbox( String text1,text2,text3,text4) {
    return Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [

                 Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),)
                  ),
                ),

                SizedBox(width: 10),
                

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    children: [
                      Text('BOOKNAME:',
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w600,
                                fontSize:15,                   
                              ),),
                      Text(text1,
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w500,
                                fontSize:15,                   
                              ),)
                    ],
                  ),
                  Row(
                    children: [
                      Text('AUTHOR:',
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w600,
                                fontSize:15,                   
                              ),),
                      Text(text2,
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w500,
                                fontSize:15,                   
                              ),)
                    ],
                  ),

                   Row(
                    children: [
                      Text('ISSUE DATE:',
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w600,
                                fontSize:15,                   
                              ),),
                      Text(text3,
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w500,
                                fontSize:15,                   
                              ),)
                    ],
                  ),

                   Row(
                    children: [
                      Text('DUE DATE:',
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w600,
                                fontSize:15,                   
                              ),),
                      Text(text4,
                      style: GoogleFonts.poppins(
                                fontWeight:FontWeight.w500,
                                fontSize:15,                   
                              ),)
                    ],
                  )
                  
                    ],
                  ),
                ),

               
                
              ],
            ),
           );
  }