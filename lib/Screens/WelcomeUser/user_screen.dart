import 'package:bitirme2/Screens/WelcomeUser/add_baby.dart';
import 'package:bitirme2/Screens/WelcomeUser/baby_values.dart';
import 'package:bitirme2/Screens/WelcomeUser/get_baby_values.dart';
import 'package:bitirme2/Screens/WelcomeUser/info_about_baby.dart';
import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/customTextField.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:bitirme2/components/textButtonUnderline.dart';
import 'package:bitirme2/components/textButton.dart';
import 'package:bitirme2/constants.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String user='Selin';
  String userbaby = 'Yasemin';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child:Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildUserWelcomeText(),
                buildUserText(),
                //Kaç bebek varsa o kadar sayıda kayıtlı bebeği buton olarak ekleyeceğiz
                buildInfo(),
                buildNewRecord(),
                CustomTextButton(
                    text: '\n1)$userbaby Bebek ',
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BabyValue()),
                      );
                    },

                ),

              ],

            ),
          ),
        ),
      ),

    );
  }

  RoundedButton buildNewRecord() {
    return RoundedButton(
                  text: 'Yeni Kayıt Ekle',
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBabyScreen()),
                    );
                  }
              );
  }

  MyTextButton buildInfo() {
    return MyTextButton(
                  text: 'Bebekler Hakkında Bilgilendirme',
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoScreenAboutBaby()),
                    );
                  },
                  color: Colors.black45,
                  child: Container(),
              );
  }

  Widget buildUserText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
                   'Kayıtlı Çocuklarım:',
                   style:TextStyle(
                   fontSize: 25,
                   fontFamily: 'Montserrat',
                   color: kPrimaryColor,
                   )
          ),
        ],
      ),
    );
  }

  Widget buildUserWelcomeText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top:100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
                      text: 'Hoş Geldin\n$user',
                      textAlign: TextAlign.start,
                    ),
        ],
      ),
    );
  }
}
