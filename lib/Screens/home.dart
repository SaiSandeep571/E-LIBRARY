import 'package:e_library/Screens/department.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Container(
            alignment: Alignment.center,
            child: Text('E-LIBRARY',
                     style: GoogleFonts.poppins(
                                    fontWeight:FontWeight.w500,
                                    fontSize:24,                   
                                  ),
                    
                    ),
          ),
          leading: Icon(Icons.menu_outlined,),
          actions: [Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(Icons.notifications),
          )],
        ),

        body: 
        Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
          
              InkWell(
                 onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Department()),);
              },


                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.white.withOpacity(.8),blurRadius: 0.3,spreadRadius: 0.2,offset:Offset(2, 1.5))]
                    

                  ),
                  child: Text('EXPLORE BOOKS',
                  style: GoogleFonts.poppins(
                                  fontWeight:FontWeight.w600,
                                  fontSize:24,                   
                                ),
                  ),
                ),
              ),

              SizedBox(height: 8),
          
              Divider(
                color: Colors.white,
                thickness: 2,
                ),
          
          
              Text('My Books',
              style: GoogleFonts.poppins(
                fontWeight:FontWeight.w500,
                fontSize:20,
                color: Colors.white,
              ),
              ),

              SizedBox(height: 8),
              
              


              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                       _detailbox('assets/c.png','FLUTTER','SAB','10/01/2003','17/01/2003'),
                       _detailbox('assets/os.png','EGANA THINNAM','CHRISTY LEO','09/09/2009','19/09/2009'),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
            height: 125,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [

                 Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  width: 90,
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