import 'package:bitirme2/components/backIconButton.dart';
import 'package:bitirme2/components/background.dart';
import 'package:flutter/material.dart';

class BabyValues extends StatefulWidget {
  const BabyValues({Key? key}) : super(key: key);

  @override
  State<BabyValues> createState() => _BabyValuesState();
}

class _BabyValuesState extends State<BabyValues> {
  String userName_Surname= 'Yasemin Göksoy';
  String topukKani='Topuk kanı değerleri sdljslkjlkdsjkfkldfsklsdfjlkdfsj';
  String kalcaCikigi='Kalça çıkığı değerleri:';
  String duymaTesti='Duyma testi sonuçları:';
  String anneSutu =' Veri çekilecek';
  String dogustanGelenHastalik='Doğuştan Gelen Hastalık:';
  String cinsiyet='Cinsiyet:';
  String dogumCesidi='Doğum Çeşidi:';
  String dogumTarihi='Doğum Tarihi:';
  String dogumYeri='Doğum Yeri:';
  String gebelikteSorun='Gebelikte Sorun:';
  String kronikHastalik='Anne Babada Kronik Hastalık:';
  String dogumSayisi='Annenin Doğum Sayısı:';
  String basOlcu='Baş Ölçüsü:';
  String kilo='Kilo:';
  String boy='Boy:';
  String yapilanAsilari='Yapılan Aşıları:';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:70.0),
              child: Column(
                children: [
                  buildBabyNameText(),
                  buildTestValues(context),
                  buildBirthValuesText(),
                  buildBirthValues(context),
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
      ),
    );
  }

  Padding buildTestValues(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          buildDogustanGelenHastalik(),
          buildCinsiyetValue(),
          buildDogumCesidi(),
          buildDogumTarihi(),
          buildDogumYeri(),
          buildGebelikteSorun(),
          buildKronikHastalik(),
          buildDogumSayisi(),
          buildTopukKaniValue(context),
          buildKalcaCikigiValue(),
          buildDuymaTestiValue(),
          buildAnneSutuValue(),


        ],
      ),
    );
  }
  Padding buildBirthValues(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          buildDogumBasOlcu(),
          buildKilo(),
          buildBoy(),
          buildYapilanAsilari(),

        ],
      ),
    );


  }

  Column buildAnneSutuValue() {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Bebek Anne Sütünü Kaç Ay Aldı?',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,

            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              anneSutu,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],

    );
  }

  Column buildDuymaTestiValue() {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Duyma Testi Sonuçları:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,

            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              duymaTesti,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],

    );
  }

  Widget buildCinsiyetValue() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Cinsiyet:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              cinsiyet,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildGebelikteSorun() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Gebelikte Sorun:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              gebelikteSorun,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildKronikHastalik() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Anne Babada Kronik Hastalık :',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              kronikHastalik,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildDogumYeri() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Doğum Yeri:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              dogumYeri,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildDogumTarihi() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Doğum Tarihi:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              dogumTarihi,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildDogumCesidi() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Doğum Çeşidi:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              dogumCesidi,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildDogumSayisi() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Annenin Doğum Sayısı:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              dogumSayisi,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildDogumBasOlcu() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Baş Ölçüsü:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              basOlcu,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildKilo() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Kilo:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              kilo,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildYapilanAsilari() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Yapılan Aşıları:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              yapilanAsilari,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildTopukKani() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Topuk Kanında Beklenmeyen Bir Sonuç Var Mı? :',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              topukKani,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildBoy() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Boy:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              boy,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildKalcaCikigiValue() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Kalça Çıkığı Değerleri:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              kalcaCikigi,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
  Widget buildDogustanGelenHastalik() {
    return Column(
      children: [

        Row(
          children: const [
            Text(
              'Doğuştan Gelen Hastalık:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              dogustanGelenHastalik,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTopukKaniValue(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Bebeğin Topuk Kanında Belirlenen Hastalıkları:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Container(
          width: 200,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              topukKani,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ],
    );
  }

  Text buildBabyNameText() {
    return  Text(
      ' $userName_Surname Bebeğin Değerleri;',
      style:const TextStyle(
        fontSize: 25,
        fontFamily: 'Montserrat',
        color: Colors.white,
      ),
      textAlign: TextAlign.start,
    );
  }
  Text buildBirthValuesText() {
    return  const Text(
      'Doğumdaki:',
      style:TextStyle(
        fontSize: 25,
        fontFamily: 'Montserrat',
        color: Colors.white,
      ),
      textAlign: TextAlign.start,
    );
  }
}




