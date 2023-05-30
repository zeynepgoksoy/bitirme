
import 'package:bitirme2/Screens/WelcomeUser/user_screen.dart';
import 'package:bitirme2/components/background.dart';
import 'package:bitirme2/components/customTextField.dart';
import 'package:bitirme2/components/fotoIslem.dart';
import 'package:bitirme2/components/iconButton.dart';
import 'package:bitirme2/components/inputBox.dart';
import 'package:bitirme2/components/roundedButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/backIconButton.dart';
import '../../model/AnneUser.dart';


class AddBabyScreen extends StatefulWidget {
  const AddBabyScreen({Key? key}) : super(key: key);

  @override
  State<AddBabyScreen> createState() => _AddBabyScreenState();
}

class _AddBabyScreenState extends State<AddBabyScreen> {
  final TextEditingController _nameSurname=TextEditingController();
  final TextEditingController _tcNumber=TextEditingController();
  final TextEditingController _sickness=TextEditingController();
  final TextEditingController _birthDate=TextEditingController();
  final TextEditingController _birthPlace=TextEditingController();
  final TextEditingController _pregnancyProblem=TextEditingController();
  final TextEditingController _chronicDisease=TextEditingController();
  final TextEditingController _birthNumber=TextEditingController();
  final TextEditingController _basOlcusu=TextEditingController();
  final TextEditingController _kilo=TextEditingController();
  final TextEditingController _boy=TextEditingController();
  final TextEditingController _yapilanAsi=TextEditingController();
  String fotoString ="";
  String? gender;
  FirebaseFirestore db = FirebaseFirestore.instance;

  void bebekEkle(String anne_mail) async {
    final Bebek yeniBebek = Bebek(
      foto: fotoString,
      ad_soyad: _nameSurname.text,
      tc_kimlik: _tcNumber.text,
      dogustan_gelen_hastalik: _sickness.text,
      dogum_tarihi: _birthDate.text,
      dogum_yeri: _birthPlace.text,
      gebelikte_sorun_oldu_mu: _pregnancyProblem.text,
      kronik_hastalik_var_mi: _chronicDisease.text,
      yapilan_asilar: _yapilanAsi.text,
    );

    final DocumentReference anneDocRef =
    FirebaseFirestore.instance.collection('anneler').doc(anne_mail);

    final DocumentSnapshot<Map<String, dynamic>> anneSnapshot =
    await anneDocRef.get() as DocumentSnapshot<Map<String, dynamic>>;

    List<Bebek> bebekler = [];

    if (anneSnapshot.exists && anneSnapshot.data() != null) {
      bebekler = (anneSnapshot.data()!['bebekler'] as List<dynamic>)
          .map((bebekData) => Bebek.fromFirestore(bebekData))
          .toList();
    }

    bebekler.add(yeniBebek);

    await anneDocRef.set(
      {'bebekler': bebekler.map((bebek) => bebek.toFirestore()).toList()},
      SetOptions(merge: true),
    );
  }


//bu textWithInputBos widgetı flex ile oranlanarak yapıldı ama diğer textler paddign ile
// yerleştirildi bu kısımlar başka ekran boyutlarında hizalanmasında bozulma olmaması için
// ne yapabiliriz, bunları tekrar bir container ya da sizedbox gibi bir widgeta eklemeli miyiz


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                const FotoIslem(),
                buildBabyText(), // Bebeğin text yazısı
                buildForm1(), //
                buildGirlBoyName(), // kız erkek buton
                buildBirthTypeInput(), //normal sezaryan
                buildAtBirthText(), // Dğumdaki text yazısı
                buildBasOlcusuInput(),
                buildKiloInput(),
                buildBoyInput(),
                buildYapilanAsiInput(),
                buildTopukKaniInput(),
                buildKalcaCikigiInput(),
                buildDuymaTestiInput(),
                buildEkleButton(),
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

  Padding buildEkleButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: RoundedButton(
        text: 'Ekle',
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: () {

          bebekEkle("sevgul@gmail.com");

          Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => UserScreen()),
          );
        },
      ),
    );
  }

  Column buildDuymaTestiInput() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Duyma Testi Yapıldı Mı?',
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Montserrat-Extraligth',
              color:Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                '(Bebek 1-3 aylar arasındayken kontrol edilmeli)',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat-Extraligth',
                  color:Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 65,top: 10),
          child: Row(
            children: [
              MyButtonGroup(text1: 'Evet', text2: 'Hayır'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildKalcaCikigiInput() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Kalça Çıkığı Taraması Yapıldı Mı?',
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Montserrat-Extraligth',
              color:Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                '(Bebek 1-3 aylar arasındayken kontrol edilmeli)',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat-Extraligth',
                  color:Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 65,top: 10),
          child: Row(
            children: [
              MyButtonGroup(text1: 'Evet', text2: 'Hayır'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopukKaniInput() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Topuk Kanında Beklenmeyen Bir\nSonuç Var Mı?',
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Montserrat-Extraligth',
              color:Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                '(Buna doğumda bakılmalı)',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat-Extraligth',
                  color:Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 65,top: 10),
          child: Row(
            children: [
              MyButtonGroup(text1: 'Var', text2: 'Yok'),
            ],
          ),
        ),
      ],
    );
  }

  TextWithInputbox buildYapilanAsiInput() {
    return TextWithInputbox(
      label: 'Yapılan Aşıları:',
      hintText: '',
      keyboardType: TextInputType.text ,
      controller: _yapilanAsi,
    );
  }

  TextWithInputbox buildBoyInput() {
    return TextWithInputbox(
      label: 'Boy:',
      hintText: '',
      keyboardType: TextInputType.text ,
      controller: _boy,
    );
  }

  TextWithInputbox buildKiloInput() {
    return TextWithInputbox(
      label: 'Kilo:',
      hintText: '',
      keyboardType: TextInputType.text ,
      controller: _kilo,
    );
  }

  TextWithInputbox buildBasOlcusuInput() {
    return TextWithInputbox(
      label: 'Baş Ölçüsü: ',
      hintText: '',
      keyboardType: TextInputType.text ,
      controller: _basOlcusu ,
    );
  }

  Column buildForm1() {
    return Column(
      children: [
        buildNameSurnameInput(), // adı soyadı
        buildTcNumberInput(), // tc numara
        buildSicknessInput(), // doğustan gelen hastalık
        buildBirthDateInput(), // doğum tarihi
        buildBirthPlaceInput(), // doğumyeri
        buildPregnancyProblemInput(), // doğumda problem
        buildChronicalDiseaseInput(), // kronik hsatalık
        buildBirthNumberInput(), //kaçıncı doğum
      ],
    );
  }

  Widget buildAtBirthText() {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Text(
        'Doğumdaki:',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'Montserrat-Extraligth',
          color:Colors.white,

          //textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
  MyButtonGroup buildBirthTypeInput() => MyButtonGroup(text1: 'Normal', text2: 'Sezeryan');

  MyButtonGroup buildGirlBoyName() => MyButtonGroup(text1: 'Kız', text2:'Erkek' );


  TextWithInputbox buildBirthNumberInput() {
    return TextWithInputbox(
      label: 'Annenin Kaçıncı Doğumu?',
      hintText: '',
      keyboardType: TextInputType.text ,
      controller: _birthNumber,
    );
  }

  TextWithInputbox buildChronicalDiseaseInput() {
    return TextWithInputbox(
      label: 'Anne Babada Kronik Hastalık Var Mı?',
      hintText: '',
      keyboardType: TextInputType.text ,
      controller: _chronicDisease,
    );
  }

  TextWithInputbox buildPregnancyProblemInput() {
    return TextWithInputbox(
        label: 'Gebelikte Sorun Oldu Mu?',
        hintText: '',
        keyboardType: TextInputType.text ,
        controller: _pregnancyProblem
    );
  }

  TextWithInputbox buildBirthPlaceInput() {
    return TextWithInputbox(
      label: 'Doğum Yeri:',
      hintText: '',
      keyboardType: TextInputType.text,
      controller: _birthPlace,
    );
  }

  TextWithInputbox buildBirthDateInput() {
    return TextWithInputbox(
      label: 'Doğum Tarihi:',
      hintText: '',
      keyboardType: TextInputType.text,
      controller: _birthDate,
    );
  }

  TextWithInputbox buildSicknessInput() {
    return TextWithInputbox(
      label: 'Doğuştan Gelen Hastalık:',
      hintText: '',
      keyboardType:TextInputType.text,
      controller: _sickness,
    );
  }

  TextWithInputbox buildTcNumberInput() {
    return TextWithInputbox(
      label: 'TC Kimlik No:',
      hintText: '',
      keyboardType:TextInputType.text,
      controller:_tcNumber,
    );
  }

  TextWithInputbox buildNameSurnameInput() {
    return TextWithInputbox(
      label: 'Adı Soyadı:',
      hintText: '',
      keyboardType: TextInputType.text,
      controller: _nameSurname,
    );
  }

  Widget buildBabyText() {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Text(
        'Bebeğin;',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'Montserrat-Extraligth',
          color:Colors.white,

          //textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}