import 'package:finkin_credential/pages/agent_screen/agent.dart';
import 'package:finkin_credential/pages/agent_screen/agent_form.dart';
import 'package:finkin_credential/pages/home_screen/bottom_nav.dart';
import 'package:finkin_credential/pages/home_screen/home_screen.dart';
import 'package:finkin_credential/pages/loan_information/selfemployeed_form.dart';
import 'package:finkin_credential/pages/loan_information/loan_form.dart';
import 'package:finkin_credential/pages/verification_screen/verification_screen.dart';
import 'package:finkin_credential/welcome_carousal/page1.dart';
import 'package:finkin_credential/welcome_carousal/page2.dart';
import 'package:finkin_credential/welcome_carousal/page3.dart';

import 'package:flutter/material.dart';
import '../pages/login_screen/login_screen.dart';

class MyRoutes {
  static String genotpRoute = "/genotp";
  static String otpPageRoute = "/OtpPage";
  static String page1 = "/page1";
  static String page2 = "/page2";
  static String page3 = "/page3";
  static String agent = "/agent";
  static String agentform = "/AgentForm";
  static String navBAr = "/BottomNavBar";
  static String home = "/HomeScreen";
  static String loanform = "/LoanForm";
   static String employmentform = "/EmploymentForm";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/genotp':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
          case '/employmentform':
        return MaterialPageRoute(builder: (context) => const EmploymentForm());
      case '/page1':
        return MaterialPageRoute(builder: (context) => const Page1());

      case '/OtpPage':
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());

      case '/page2':
        return MaterialPageRoute(builder: (context) => const Page2());

      case '/page3':
        return MaterialPageRoute(builder: (context) => const Page3());
      case '/agent':
        return MaterialPageRoute(builder: (context) => const AgentPage());
      case '/agentform':
        return MaterialPageRoute(builder: (context) => const AgentForm());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/navBAr':
        return MaterialPageRoute(builder: (context) => const BottomNavBar());
      case '/loanform':
        return MaterialPageRoute(builder: (context) => const LoanForm());
      default:
        return MaterialPageRoute(builder: (context) => const EmploymentForm());
    }
  }
}
