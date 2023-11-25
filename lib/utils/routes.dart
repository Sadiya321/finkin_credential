import 'package:finkin_credential/pages/agent_screen/agent.dart';
import 'package:finkin_credential/pages/agent_screen/agent_form.dart';
import 'package:finkin_credential/pages/home_screen/bottom_nav.dart';
import 'package:finkin_credential/pages/home_screen/home_screen.dart';
import 'package:finkin_credential/pages/home_screen/loan_screen.dart';
import 'package:finkin_credential/pages/loan_information/companyworker_form.dart';
import 'package:finkin_credential/pages/loan_information/infodisplay.dart';
import 'package:finkin_credential/pages/loan_information/loan_form.dart';
import 'package:finkin_credential/pages/loan_information/selfemployeed_form.dart';
import 'package:finkin_credential/pages/verification_screen/verification_screen.dart';
import 'package:finkin_credential/splash/splash_screen.dart';
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
  static String loanscreen = "/LoanScreen";
  static String splashscreen = "/splashscreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/LoanScreen':
        return MaterialPageRoute(
            builder: (context) => const LoanScreen(
                  title: '',
                ));
      case '/selfworker':
        return MaterialPageRoute(builder: (context) => const SelfWorker());
      case '/splashscreen':
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case '/OtpPage':
        return MaterialPageRoute(builder: (context) => VerificationScreen());
      case '/welcomepage':
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case '/agent':
        return MaterialPageRoute(builder: (context) => const AgentPage());
      case '/agentform':
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => AgentForm(agentId: args));
        } else {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }

      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case '/navBAr':
        return MaterialPageRoute(builder: (context) => const BottomNavBar());
      case '/infodisplay':
        return MaterialPageRoute(builder: (context) => const InfoDisplay());
      case '/loanform':
        return MaterialPageRoute(
            builder: (context) => const LoanForm(
                  title: '',
                ));
      case '/companyworker':
        return MaterialPageRoute(builder: (context) => const Companyworker());
      default:
        return MaterialPageRoute(builder: (context) =>   VerificationScreen());
    }
  }
}
