import 'package:bitirme2/Screens/SignUp/signup_screen.dart';
import 'package:bitirme2/Screens/WelcomeDoctorUser/doctor_login_screen.dart';
import 'package:bitirme2/Screens/WelcomeUser/user_screen.dart';
import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/customTextField.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:bitirme2/components/textButtonUnderline.dart';
import 'package:bitirme2/components/textFieldContainer.dart';
import 'package:bitirme2/constants.dart';
import 'package:bitirme2/services/auth.dart';
import 'package:flutter/material.dart';
//Giriş yapı sola daya
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Auth _auth = Auth();
  final bool _isLogin = false;
   //String userName = 'Selin as';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      String username = _emailController.text;
      String password = _passwordController.text;

      // perform login operation
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // bool isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTopArea(),
                buildWelcome(context),
                buildLoginForm(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          buildLoginTitle(size),
          buildEmailFormField(),
          buildPasswordFormField(),
          buildSignUp(size),
          buildLoginButton(),
        ],
      ),
    );
  }

  Row buildTopArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: buildDoctorLogin()),
        Expanded(child: buildLogo()),
      ],
    );
  }

  Image buildLogo() => Image.asset('assets/images/Mother.png');

  Widget buildLoginButton() {
    return RoundedButton(
      text: 'Giriş',
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () {
        _auth.signInWithEmailAndPassword(_emailController.text , _passwordController.text).then((value){
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserScreen()),
        );
        }
        );

      },
    );
  }

  Widget buildSignUp(Size size) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: const Text(
            'Hesabınız yok mu?',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat-Extraligth',
              color: kPrimaryColor,
            ),
          ),
        ),
        MyTextButton(
          color: Colors.deepPurple,
          text: 'Kayıt Ol',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp_Screen()),
            );
          },
          child: Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.centerLeft,
          ),
        ),
      ],
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

  Widget buildDoctorLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 0.0),
      child: MyTextButton(
        color: Colors.deepPurple,
        text: 'Doktor Girişi',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoctorLoginScreen()),
          );
        },
        child: Container(),
      ),
    );
  }

  Widget buildLoginTitle(Size size) {
    return const Text(
      'Giriş Yap',
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Montserrat-Extraligth',
        color: kPrimaryColor,

        //textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildWelcome(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  const [
          CustomText(
            text: 'Hoş\nGeldiniz ',
            textAlign: TextAlign.start,
            // textStyle: Theme.of(context).textTheme.bodyText1!,
          ),
        ],
      ),
    );
  }
}
