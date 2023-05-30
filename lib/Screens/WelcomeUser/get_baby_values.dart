import 'package:bitirme2/components/background.dart';
import 'package:flutter/material.dart';

class GetBabyValuesScreen extends StatefulWidget {
  const GetBabyValuesScreen({Key? key}) : super(key: key);

  @override
  State<GetBabyValuesScreen> createState() => _GetBabyValuesScreenState();
}

class _GetBabyValuesScreenState extends State<GetBabyValuesScreen> {

  Map<String,String> mapData = {
    '1. Ay':'123',
    '2. Ay':'234',
    '3. Ay':'345'
  };

  List<String> data = ['item1','item2','item3', 'item4', 'item5']; // Assuming the data is a list of strings
  String topukKani='Topuk kanı değerleri sdljslkjlkdsjkfkldfsklsdfjlkdfsj';
  String kalcaCikigi='Kalça çıkığı değerleri:';
  String duymaTesti='Duyma testi sonuçları:';
  String anneSutu =' Veri çekilecek';

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
                  buildPercentileList(context),
                  buildTestValues(context),
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
                      buildTopukKaniValue(context),
                      buildKalcaCikigiValue(),
                      buildDuymaTestiValue(),
                      buildAnneSutuValue(),
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

  Widget buildPercentileList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              Text(
                  'Percentil',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mapData.length,  //data.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(
                    mapData.keys.toList()[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    width: 170,
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
                    child: Text(
                      mapData.values.toList()[index],
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

Text buildBabyNameText() {
  return const Text(
      'Yasemin Bebeğin Değerleri;',
      style:TextStyle(
        fontSize: 25,
        fontFamily: 'Montserrat',
        color: Colors.white,
      ),
    textAlign: TextAlign.start,
  );
}

