import 'package:finkin_credential/pages/agent_screen/agent.dart';
import 'package:finkin_credential/pages/otp/otp_page.dart';
import 'package:finkin_credential/pages/welcom_carousel.dart/page1.dart';
import 'package:finkin_credential/pages/welcom_carousel.dart/page2.dart';
import 'package:finkin_credential/pages/welcom_carousel.dart/page3.dart';
import 'package:finkin_credential/pages/welcom_carousel.dart/welcome.dart';
import 'package:flutter/material.dart';
import '../pages/otp/gen_OTP.dart';

class MyRoutes {
  static String genotpRoute = "/genotp";
  static String OtpPageRoute = "/OtpPage";
  static String page1 = "/page1";
   static String page2 = "/page2";
    static String page3 = "/page3";
     static String agent= "/agent";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/genotp':
        return MaterialPageRoute(builder: (context) => const Genotp());
        case '/page1':
        return MaterialPageRoute(builder: (context) => const Page1());
      
      case '/OtpPage':
       return MaterialPageRoute(builder: (context) => const OtpPage());
                
  case '/page2':
       return MaterialPageRoute(builder: (context) =>  const Page2());
       
       case '/page3':
       return MaterialPageRoute(builder: (context) => const Page3());
        case '/agent':
        return MaterialPageRoute(builder: (context) => const AgentPage());
      default:
        return MaterialPageRoute(builder: (context) =>  WelcomePage());
    }
  }
}
