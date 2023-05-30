import 'package:bitirme2/Screens/WelcomeUser/user_screen.dart';
import 'package:bitirme2/components/backIconButton.dart';
import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/customTextField.dart';
import 'package:bitirme2/components/inputBox.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:bitirme2/model/AnneUser.dart';
import 'package:bitirme2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Auth _auth = Auth();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child: Background(
          child:SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 buildSignupText(),
                 buildSignupForm(),
                 buildSignupButton(),

                BackIconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget buildSignupButton() {
    return Padding(
      padding: const EdgeInsets.only(top:80.0),
      child: RoundedButton(
                    text: 'Kayıt Ol',
                    color: Colors.deepPurple,
                    textColor: Colors.white,
        onPressed: () async {
          String name = _nameController.text;
          String surname = _surnameController.text;
          String email = _emailController.text;
          String password = _passwordController.text;

          final anne = AnneUser(
            isim: name,
            soyisim: surname,
            mail: email,
            sifre: password,
          );
          final docRef = db
              .collection("anneler")
              .withConverter(
            fromFirestore: AnneUser.fromFirestore,
            toFirestore: (AnneUser anne, options) => anne.toFirestore(),
          )
              .doc(email);
          await docRef.set(anne);

          _auth.registerWithEmailAndPassword(_emailController.text , _passwordController.text).then((value){
            return Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserScreen()),
            );
          }
          );

        },
                ),
    );
  }

  Widget buildSignupForm() {
    return Padding(
      padding: const EdgeInsets.only(top:60.0),
      child: Column(
                  children: [
                    buildNameInputBox(),
                    buildSurnameInputBox(),
                    buildMailInputbox(),
                    buildPasswordInputBox(),
                  ],
                ),
    );
  }

  TextWithInputbox buildPasswordInputBox() {
    return TextWithInputbox(
                  label: 'Şifre:',
                  hintText: '',
                  keyboardType:TextInputType.text ,
                  controller: _passwordController
              );
  }

  TextWithInputbox buildMailInputbox() {
    return TextWithInputbox(
                  label: 'Mail:',
                  hintText: '',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController

              );
  }

  TextWithInputbox buildSurnameInputBox() {
    return TextWithInputbox(
                  label: 'Soyisim:',
                  hintText: '',
                  keyboardType: TextInputType.text,
                  controller: _surnameController
              );
  }

  TextWithInputbox buildNameInputBox() {
    return TextWithInputbox(
                  label: 'İsim:',
                  hintText: '',
                  keyboardType: TextInputType.text,
                  controller: _nameController
              );
  }

  Widget buildSignupText() {
    return Padding(
                padding: EdgeInsets.only(left: 40.0, top: 110.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  const [
                    CustomText(
                      text: 'Kayıt Ol ',
                      textAlign: TextAlign.start,
                      // textStyle: Theme.of(context).textTheme.bodyText1!,
                    ),
                  ],
                ),
    );
  }
}
