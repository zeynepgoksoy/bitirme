import 'package:bitirme2/Screens/WelcomeDoctorUser/baby_doctor_values.dart';
import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/customTextField.dart';
import 'package:bitirme2/components/inputBox.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DoctorQueryScreen extends StatefulWidget {
  const DoctorQueryScreen({Key? key}) : super(key: key);

  @override
  State<DoctorQueryScreen> createState() => _DoctorQueryScreenState();
}

class _DoctorQueryScreenState extends State<DoctorQueryScreen> {
  String user='Şeyma';
  final TextEditingController _tcNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildUserWelcomeText(),
                buildDoctorQueryText(),
                buildTcNumberInputBox(),
                buildCheckButton(),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildCheckButton() {
    return Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: [
                    RoundedButton(
                        text: 'Kontrol Et',
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DoctorValues()),
                        );
                      },
                    ),
                  ],
                ),
              );
  }

  Padding buildTcNumberInputBox() {
    return Padding(
      padding: EdgeInsets.only(left: 5.w,top: 2.h,right: 22),
      child: TextField(
                  controller: _tcNumberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: '',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value){

                  },
                ),
    );
  }

  Widget buildDoctorQueryText() {
    return Padding(
                padding: EdgeInsets.only(left: 7.w,top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Bakmak İstediğiniz Hastanın\n TC Kimlik Numarası:',
                          style:TextStyle(
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                          color:Colors.white,

                        ),
                    ),
                  ],
                ),
              );
  }

  Padding buildUserWelcomeText() {
    return Padding(
                padding: const EdgeInsets.only(left: 20,top:130),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Hoş Geldin\nDoktor $user',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              );
  }
}
