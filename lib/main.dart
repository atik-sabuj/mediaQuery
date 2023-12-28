// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:task6/course/course_page.dart';
// import 'package:task6/mediaquery/box_page.dart';
// import 'package:task6/mediaquery/home_page.dart';
// import 'package:task6/mediaquery/practice_page.dart';
// import 'package:task6/seip/seip_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//         splitScreenMode: true,
//       // Use builder only if you need to use library outside ScreenUtilInit context
//       builder: (_ , child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'First Method',
//           // You can use the library anywhere in the app even in theme
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           home: child,
//         );
//       },
//       //child: const HomePage(),
//       child: CoursePage(),
//     );
//   }
// }







import 'package:flutter/material.dart';
// import 'package:screen_design/pages/aamar_pay_page.dart';
// import 'package:screen_design/pages/about_us_page.dart';
// import 'package:screen_design/pages/apply_course.dart';
// import 'package:screen_design/pages/blog_list_page.dart';
// import 'package:screen_design/pages/bottom_nav_page.dart';
// import 'package:screen_design/pages/career_details_page.dart';
// import 'package:screen_design/pages/career_page.dart';
// import 'package:screen_design/pages/category_detail_page.dart';
// import 'package:screen_design/pages/checkout_page.dart';
// import 'package:screen_design/pages/code_verification_page.dart';
// import 'package:screen_design/pages/contact_page.dart';
// import 'package:screen_design/pages/course_module_page.dart';
// import 'package:screen_design/pages/create_new_password_page.dart';
// import 'package:screen_design/pages/dashboard_page.dart';
// import 'package:screen_design/pages/edit_profile_page.dart';
// import 'package:screen_design/pages/event_details_page.dart';
// import 'package:screen_design/pages/event_page.dart';
// import 'package:screen_design/pages/faq_page.dart';
// import 'package:screen_design/pages/favorite_page.dart';
// import 'package:screen_design/pages/forgot_password_page.dart';
// import 'package:screen_design/pages/home_page.dart';
// import 'package:screen_design/pages/industrial_attachment.dart';
// import 'package:screen_design/pages/landing_page.dart';
// import 'package:screen_design/pages/login_page.dart';
// import 'package:screen_design/pages/course_page.dart';
// import 'package:screen_design/pages/mission_vision_page.dart';
// import 'package:screen_design/pages/my_course_page.dart';
// import 'package:screen_design/pages/blog_page.dart';
// import 'package:screen_design/pages/nagat_page.dart';
// import 'package:screen_design/pages/notification_controller.dart';
// import 'package:screen_design/pages/notification_page.dart';
// import 'package:screen_design/pages/privacy_policy_page.dart';
// import 'package:screen_design/pages/profile_page.dart';
// import 'package:screen_design/pages/review_page.dart';
// import 'package:screen_design/pages/rpl_page.dart';
// import 'package:screen_design/pages/terms_condition_page.dart';
// import 'package:screen_design/pages/read_blog_page.dart';
// import 'package:screen_design/pages/registration_page.dart';
// import 'package:screen_design/pages/splash_page.dart';
// import 'package:screen_design/pages/trainer_details_page.dart';
// import 'package:screen_design/pages/trainer_page.dart';
// import 'package:screen_design/provider/area_provider.dart';
// import 'package:screen_design/provider/blog_provider.dart';
// import 'package:screen_design/provider/career_provider.dart';
// import 'package:screen_design/provider/course_module_provider.dart';
// import 'package:screen_design/provider/event_provider.dart';
// import 'package:screen_design/provider/faq_provider.dart';
// import 'package:screen_design/provider/notification_provider.dart';
// import 'package:screen_design/provider/trainer_provider.dart';
// import 'package:screen_design/provider/course_provider.dart';
import 'package:provider/provider.dart';
//import 'package:screen_design/provider/user_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import 'course/course_module_page.dart';
import 'course/course_module_provider.dart';
import 'course/course_page.dart';
import 'course/course_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MultiProvider(providers: [
     ChangeNotifierProvider(create: (_) => CourseProvider()),
    // ChangeNotifierProvider(create: (_) => TrainerProvider()..getTrainerServiceData()),
     ChangeNotifierProvider(create: (_) => CourseModuleProvider()),
    // ChangeNotifierProvider(create: (_) => BlogProvider()),
    // ChangeNotifierProvider(create: (_) => UserProvider()),
    // ChangeNotifierProvider(create: (_) => EventProvider()),
    // ChangeNotifierProvider(create: (_) => CareerProvider()),
    // ChangeNotifierProvider(create: (_) => FaqProvider()),
    // ChangeNotifierProvider(create: (_) => AreaProvider()),
    // ChangeNotifierProvider(create: (_) => NotificationProvider()),
  ], child: MyApp()));
}

@pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
//   await Firebase.initializeApp();
//   print('Background ${message.notification!.title.toString()}');
//   print('Data ${message.data.toString()}');
// }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Pencilbox Training',
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          thickness: MaterialStateProperty.all(4),
          thumbColor: MaterialStateProperty.all(Colors.red),
          radius: const Radius.circular(10),
        ),
        primarySwatch: Colors.amber,
      ),
      home: CoursePage(),
      //initialRoute: '/',
      routes: {
        // '/': (_) => LandingPage(),
        // 'home_page': (_) => HomePage(),
        // 'splash_page': (_) => SplashPage(),
        // 'login_screen': (_) => LoginPage(),
        // 'registration_screen': (_) => RegistrationPage(),
        // 'bottom_nav_screen': (_) => BottomNavigationPage(),
        // 'category_detail_screen': (_) => CategoryDetailPage(),
        // 'course_module-page': (_) => CourseModulePage(),
        // 'read_blog_page': (_) => ReadBlogPage(),
        // 'blog_list_page': (_) => BlogListPage(),
        // 'edit_profile_page': (_) => EditProfilePage(),
        // 'new_blog_page': (_) => BlogPage(),
        // 'forgot_password_page': (_) => ForgotPasswordPage(),
        // 'code_verification_page': (_) => CodeVerificationPage(),
        // 'create_new_password_page': (_) => CreateNewPasswordPage(),
        // 'trainer_page': (_) => TrainerPage(),
        // 'contact_page': (_) => ContactPage(),
        // 'terms_condition_page': (_) => TermsConditionPage(),
        // 'privacy_policy_page': (_) => PrivacyPolicyPage(),
        // 'notification_page': (_) => NotificationPage(),
        // 'notification_controller': (_) => NotificationController(),
        // 'review_page': (_) => ReviewPage(),
         //'course_page': (_) => CoursePage(),
        // 'my_course_page': (_) => MyCoursePage(),
        // 'profile_page': (_) => ProfilePage(),
        // 'course_module_page': (_) => CourseModulePage(),
        // 'dashboard_page': (_) => DashboardPage(),
        // 'rpl_page': (_) => RPLPage(),
        // 'about_us_page': (_) => AboutUsPage(),
        // 'Trainer_details_page': (_) => TrainerDetailsPage(),
        // 'event_page': (_) => EventPage(),
        // 'event_details_page': (_) => EventDetailsPage(),
        // 'career_page': (_) => CareerPage(),
        // 'career_details_page': (_) => CareerDetailsPage(),
        // 'mission_vision_page': (_) => MissionVisionPage(),
        // 'faq_page': (_) => FaqPage(),
        // 'industrial_attachment_page': (_) => IndustrialAttachmentPage(),
        // 'apply_course_page': (_) => ApplyCoursePage(),
        // 'checkout_page': (_) => CheckoutPage(),
        // 'aamar_pay_page': (_) => AamarPayPage(),
        // 'favorite_page': (_) => FavoritePage(),
        // NagadPage.routeName: (_) => NagadPage(),
      },
    );
  }
}


