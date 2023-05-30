import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../components/backIconButton.dart';

class BabyValue extends StatefulWidget {
  const BabyValue({Key? key}) : super(key: key);

  @override
  State<BabyValue> createState() => _BabyValueState();
}

class _BabyValueState extends State<BabyValue> {
  @override
  String userbaby = 'Yasemin';
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                BackIconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w,top: 20.h),
                  child:  Text(
                    '$userbaby Bebeğin;',
                    style:TextStyle(
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
            )
                  ),
                ),


                buildValueButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildValueButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 90.0),
      child: Column(
        children: [
          buildValueButton(),
          SizedBox(height: 16.0), // 16 birimlik bir boşluk ekleyelim
          buildAddPercentilButton(),
          SizedBox(height: 16.0), // 16 birimlik bir boşluk daha ekleyelim
          buildVaccineButton(),
        ],
      ),
    );
  }


  RoundedButton buildVaccineButton() {
    return RoundedButton(
                  text:  'Aşı Takvimi',
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: (){}
              );
  }

  RoundedButton buildAddPercentilButton() {
    return RoundedButton(
                  text:  'Percentil Ekle',
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: (){}
              );
  }

  RoundedButton buildValueButton() {
    return RoundedButton(
                  text:  'Değerleri',
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: (){}
              );
  }


}
