import 'package:e_library/Screens/home.dart';
import 'package:flutter/material.dart';

class Loginscreen
 extends StatelessWidget {
  const Loginscreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/background.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EMAIL/MOBILE NO'),
        
                  SizedBox(height: 5,),
        
        
                  SizedBox(
                    height: 30,
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
        
                  SizedBox(height: 10,),
        
        
                  Text('PASSWORD'),
        
                  SizedBox(height: 5,),
        
        
                  SizedBox(
                    height: 30,
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                ],
              ),
        
        
              SizedBox(height: 25,),
              
        
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => home()),);
                },
                child:Container(
                alignment: Alignment.center,
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyan
                ),
                child: Text('LOGIN'),
              ),)
              
            ],
          ),
        ),
      ),
    );
  }
}