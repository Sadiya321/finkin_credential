import 'package:finkin_credential/pages/agent_screen/agent.dart';
import 'package:finkin_credential/pages/agent_screen/agent_form.dart';
import 'package:finkin_credential/pages/home_screen/bottom_nav.dart';
import 'package:finkin_credential/pages/home_screen/home_screen.dart';
import 'package:finkin_credential/pages/loan_information/companyworker_form.dart';
import 'package:finkin_credential/pages/loan_information/infodisplay.dart';
import 'package:finkin_credential/pages/loan_information/selfemployeed_form.dart';
import 'package:finkin_credential/pages/loan_information/loan_form.dart';
import 'package:finkin_credential/pages/login_screen/login_screen.dart';
import 'package:finkin_credential/pages/verification_screen/verification_screen.dart';
import 'package:finkin_credential/welcome_carousal/page1.dart';
import 'package:finkin_credential/welcome_carousal/page2.dart';
import 'package:finkin_credential/welcome_carousal/page3.dart';
import 'package:finkin_credential/welcome_carousal/welcome.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static String loginscreen = "/LoginScreen";
  static String verificationscreen = "/VerificationScreen";
  static String page1 = "/page1";
  static String page2 = "/page2";
  static String page3 = "/page3";
  static String agent = "/agent";
  static String agentform = "/AgentForm";
  static String navBAr = "/BottomNavBar";
  static String home = "/HomeScreen";
  static String loanform = "/LoanForm";
  static String selfworker = "/SelfWorker";
  static String companyworker = "/Companyworker";
  static String welcomepage = "/WelcomePage";
  static String infodisplay = "/InfoDisplay";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/LoginScreen':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case '/selfworker':
        return MaterialPageRoute(builder: (context) => const SelfWorker());
      case '/page1':
        return MaterialPageRoute(builder: (context) => const Page1());

      case '/OtpPage':
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());

      case '/page2':
        return MaterialPageRoute(builder: (context) => const Page2());
      case '/welcomepage':
        return MaterialPageRoute(builder: (context) => WelcomePage());

      case '/page3':
        return MaterialPageRoute(builder: (context) => const Page3());
      case '/agent':
        return MaterialPageRoute(builder: (context) => const AgentPage());
      case '/agentform':
        return MaterialPageRoute(builder: (context) => const AgentForm());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/navBAr':
        return MaterialPageRoute(builder: (context) => const BottomNavBar());
      case '/infodisplay':
        return MaterialPageRoute(builder: (context) => const InfoDisplay());
      case '/loanform':
        return MaterialPageRoute(
            builder: (context) =>  const LoanForm(
                  title: '',
                ));
      case '/companyworker':
        return MaterialPageRoute(builder: (context) => const Companyworker());
      default:
        return MaterialPageRoute(builder: (context) => WelcomePage());
    }
  }
}
