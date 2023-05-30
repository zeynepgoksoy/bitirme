import 'package:bitirme2/Screens/Login/login_screen.dart';
import 'package:bitirme2/Screens/SignUp/signup_screen.dart';
import 'package:bitirme2/Screens/Welcome/welcome_screen.dart';
import 'package:bitirme2/Screens/WelcomeDoctorUser/doctor_login_screen.dart';
import 'package:bitirme2/Screens/WelcomeDoctorUser/doctor_query_screen.dart';
import 'package:bitirme2/Screens/WelcomeDoctorUser/doctor_screen_baby_values.dart';
import 'package:bitirme2/Screens/WelcomeDoctorUser/doctor_screen_percentil_values.dart';
import 'package:bitirme2/Screens/WelcomeUser/add_baby.dart';
import 'package:bitirme2/Screens/WelcomeUser/add_percentile_screen.dart';
import 'package:bitirme2/Screens/WelcomeDoctorUser/baby_doctor_values.dart';
import 'package:bitirme2/Screens/WelcomeUser/baby_values.dart';
import 'package:bitirme2/Screens/WelcomeUser/get_baby_values.dart';
import 'package:bitirme2/Screens/WelcomeUser/info_about_baby.dart';
import 'package:bitirme2/Screens/WelcomeUser/user_screen.dart';
import 'package:bitirme2/components/fotoIslem.dart';
import 'package:bitirme2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
//görüntünün düzenlenmesi ve ekranın içine biraz daha gelmeleri


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'bitirme2',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryLightColor,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
         // if (snapshot.hasData) {
           // return UserScreen();
          //} else {
            return LoginScreen();
         // }
        },
      ),
      );
      });
    }
  }
