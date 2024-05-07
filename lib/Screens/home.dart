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
                 _detailbox('assets/leo.png','C PROGRAMMING','SURESH','10/01/2003','17/01/2003'),
                 _detailbox('','EGANA THINNAM','CHRISTY LEO','09/09/2009','19/09/2009'),
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

 _detailbox( String image,text1,text2,text3,text4,) {
    return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [

                 SizedBox(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8) ,
                    child: Image.asset(image,fit: BoxFit.fill,)),
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