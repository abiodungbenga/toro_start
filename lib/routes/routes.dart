import 'package:get/get.dart';
import 'package:toro_start/pages/auth/sign_in_page.dart';
import 'package:toro_start/pages/auth/sign_up_page.dart';
import '../pages/splash/splash_page.dart';

class RouteHelpers {
  static const String initial = "/";

  static String getInitial() => '$initial';

  static const String onBoarding = "/onBoarding";

  static String getOnBoarding() => '$onBoarding';

  static const String signIn = "/sign-in";

  static String getSignIn() => '$signIn';
  static const String signUp = "/sign-up";

  static String getSignUp() => '$signUp';


  // static const String onBoardingPageTwo = "/onBoarding-two";
  //
  // static String getOnBoardingPageTwo() => '$onBoardingPageTwo';
  // static String getCompleteTaskPage(String socialName, String socialPageText,
  //     String socialPageLikeText, String socialUrl) =>
  //     '$completeTaskPage?socialName=$socialName&socialPageText=$socialPageText&socialPageLikeText=$socialPageLikeText&socialUrl=$socialUrl';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const SplashPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: signIn,
      page: () => const SignInPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpPage(),
      transition: Transition.cupertinoDialog,
    ),
    // GetPage(
    //   name: onBoarding,
    //   page: () => const OnboardingPage(),
    //   transition: Transition.cupertinoDialog,
    // ),


    // GetPage(
    //   name: register,
    //   page: () => Register(),
    //   transition: Transition.cupertinoDialog,
    // ),
    // GetPage(
    //   name: verifyMail,
    //   page: () => VerifyOtpPage(),
    //   transition: Transition.cupertinoDialog,
    // ),
    // GetPage(
    //   name: login,
    //   page: () => LoginPage(),
    //   transition: Transition.cupertinoDialog,
    // ),
    // GetPage(
    //   name: forgotEmail,
    //   page: () => ForgotEmail(),
    //   transition: Transition.cupertinoDialog,
    // ),
    // GetPage(
    //   name: onboarding,
    //   page: () => OnboardingPage(),
    //   transition: Transition.cupertinoDialog,
    // ),
    // GetPage(
    //   name: resetPassword,
    //   page: () => CreateNewPasswordPage(),
    //   transition: Transition.cupertinoDialog,
    // ),
    // GetPage(
    //   name: mainPage,
    //   page: () => MainPage(),
    //   transition: Transition.cupertinoDialog,
    // ),
    // GetPage(
    //   name: greenScreen,
    //   page: () => GreenScreen(),
    //   transition: Transition.cupertinoDialog,
    // ),
  ];
}
