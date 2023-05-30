import 'package:bitirme2/components/dropDownButton.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:bitirme2/components/iconButton.dart';
import 'package:bitirme2/components/inputBox.dart';
import 'package:bitirme2/components/textButtonUnderline.dart';
import 'package:bitirme2/components/textButton.dart';
import 'package:bitirme2/components/textFieldContainer.dart';
import 'package:bitirme2/constants.dart';
import 'package:flutter/material.dart';




class Body extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override

  Widget build(BuildContext context) {


    Size size= MediaQuery.of(context).size;

    return Stack(



      children: [
        /*Text('Select a month:'),
        MyDropdownButton(),*/
        Container(
          height: size.height,
          width: double.infinity,

        ),
        //CustomText(text: 'Hoş Geldiniz'),
        /*Align(
          alignment: Alignment.center,
          child: MyButtonGroup(text1: 'Evet',text2: 'Hayır',),
        ),*/
        TextWithInputbox(
          label: "Adınız:",
          hintText: " ",
          keyboardType: TextInputType.text,
          controller: controller,
          onChanged: (text) {
            // Metin kutusu değiştirildiğinde çalışacak kodlar buraya yazılır.
            // text, metin kutusunda girilen metni içerir.
          },
        ),


        /*


        Align(
          alignment: Alignment.bottomCenter,
          child: MyButtonGroup(text1: 'Normal',text2: 'Sezeryan'),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CustomTextButton(text:'1)Yasemin Bebek', onPressed: () {  },),
        ),*/

        //DropDownButton(),


       /* Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 120.0),
            child: RoundedButton(
              text: 'Giriş',
              color: Colors.deepPurple,
              textColor: Colors.white,
              onPressed: () {
                print('Button clicked!');
              },
            ),

          ),
        ),
*/

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),

            child: MyTextButton(

              color: Colors.deepPurple,
              text: 'Kayıt Ol',
              onPressed: () {  },
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.black,
                alignment: Alignment.centerLeft,


            ),



          ),



        ),
        ),


      ],
    );
  }
}

