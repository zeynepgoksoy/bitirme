import 'package:bitirme2/Screens/WelcomeDoctorUser/doctor_query_screen.dart';
import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/customTextField.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:bitirme2/components/textFieldContainer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({Key? key}) : super(key: key);

  @override
  State<DoctorLoginScreen> createState() => _DoctorLoginScreenState();

}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTopArea(),
                buildDoctorLoginText(),
                buildEmailFormField(),
                buildPasswordFormField(),
                buildLoginButton()


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return Padding(
      padding:  EdgeInsets.only(left: 4.w,top: 9.h ),
      child: RoundedButton(
                    text: 'Giriş',
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorQueryScreen()),
                    );}
                ),
    );
  }

  Widget buildPasswordFormField() {
    return TextFieldContainer(
                hintText: 'Şifre',
                icon: Icons.lock,
                icon2: Icons.visibility,
                isObsecure: true,
                keyboardType: TextInputType.none,
                controller: _passwordController,
                onChanged: (value) {
                  // E-posta değeri değiştiğinde yapılacak işlemler
                },
              );
  }

  Widget buildEmailFormField() {
    return TextFieldContainer(
                hintText: 'E-posta',
                icon: Icons.email,
                isObsecure: false,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                onChanged: (value) {
                  // E-posta değeri değiştiğinde yapılacak işlemler
                },
              );
  }
  Row buildTopArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         buildWelcome(),
         buildLogo(),


      ],
    );
  }
  Image buildLogo() => Image.asset('assets/images/Medical team.png');

  Widget buildDoctorLoginText() {
    return Padding(
        padding: EdgeInsets.only(left: 10.w,top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
                'Giriş Yap',
                style:TextStyle(
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  color:Colors.white,
                )
            ),
          ],
        ),
      );
  }




  Widget buildWelcome() {
    return Padding(
                padding: EdgeInsets.only(left: 10.w,top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustomText(
                        text: 'Hoş\nGeldiniz ',
                        textAlign: TextAlign.start,

                    ),

                  ],

          ),
              );
  }
}
