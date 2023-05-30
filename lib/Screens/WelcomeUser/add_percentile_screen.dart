import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/dropDownButton.dart';
import 'package:bitirme2/components/iconButton.dart';
import 'package:bitirme2/components/inputBox.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddPercentilScreen extends StatefulWidget {
  const AddPercentilScreen({Key? key}) : super(key: key);

  @override
  State<AddPercentilScreen> createState() => _AddPercentilScreenState();
}

class _AddPercentilScreenState extends State<AddPercentilScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _headController = TextEditingController();
 // final TextEditingController _ = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /*buildNewPercentilText(),
                    buildMonthText(),
                    buildMonthButton(),
                    MyButtonGroup(text1: 'Kız', text2: 'Erkek'),
                    buildHeightInputbox(),
                    buildWeighttInputBox(),
                    buildHeadInputbox(), */
                    buildTopArea(),
                    buildToAddButton(),


                  ],
                ),
              ),
            ),
          ),
    );
  }

  Padding buildToAddButton() {
    return Padding(
                    padding:  EdgeInsets.only(left: 4.w,top: 9.h ),
                    child: RoundedButton(
                        text: 'Ekle',
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        onPressed: (){print('Button clicked!');}
                    ),
                  );
  }

  Widget buildHeadInputbox() {
    return TextWithInputbox(
                      label: 'Baş Çevresi(cm) :',
                      hintText: '',
                      keyboardType: TextInputType.text,
                      controller: _headController,
                  );
  }
  Padding buildTopArea() {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNewPercentilText(),
          buildMonthText(),
          buildMonthButton(),
          MyButtonGroup(text1: 'Kız', text2: 'Erkek'),
          buildHeightInputbox(),
          buildWeighttInputBox(),
          buildHeadInputbox(),


        ],
      ),
    );
  }


  TextWithInputbox buildWeighttInputBox() {
    return TextWithInputbox(
                      label: 'Kilo (kg) :',
                      hintText: '',
                      keyboardType: TextInputType.text,
                      controller: _weightController,
                  );
  }

  TextWithInputbox buildHeightInputbox() {
    return TextWithInputbox(
                      label: 'Boy (cm) :',
                      hintText: '',
                      keyboardType:TextInputType.text,
                      controller: _heightController,
                  );
  }


  DropDownButton buildMonthButton() => DropDownButton();

  Widget buildMonthText() {
    return Padding(
                    padding: EdgeInsets.only(left: 10.w,top: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Ay:',
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

  Widget buildNewPercentilText() {
    return Padding(
                    padding: EdgeInsets.only(left: 10.w,top: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                        'Yeni Persentil:',
                            style:TextStyle(
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              color:Colors.white,
                            )
                        ),
                      ],
                    ),
                  );
  }





}
