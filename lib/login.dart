import 'package:e_library/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('REG NO :',
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w500,
                      fontSize:15,
                      color: Colors.white,
                                         
                    ),),

                SizedBox(height: 5,),


                Container(
                  padding: EdgeInsets.all(5),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none
                      
                    ),
                  ),
                ),

                SizedBox(height: 25,),


                Text('PASSWORD :',
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w500,
                      fontSize:15,
                      color: Colors.white,                  
                    ),),

                SizedBox(height: 5,),


                Container(
                  padding: EdgeInsets.all(5),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 50),
            

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
              },
              child:Container(
              alignment: Alignment.center,
              height: 35,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Text('LOGIN',
              style: GoogleFonts.poppins(
                fontWeight:FontWeight.w700
              ),
              ),
            ),)
            
          ],
        ),
      ),
    );
  }
}