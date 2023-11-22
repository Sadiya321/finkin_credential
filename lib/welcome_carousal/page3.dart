import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:AppColor.secondary,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: AppColor.primary,
           width: 300.0, 
            height: 650.0,
             child: Image.asset(
              'assets/images/loan3.webp',
              fit: BoxFit.fill, 
            ),
            
          ),
        
        ),
      ),
    );
  }
}
