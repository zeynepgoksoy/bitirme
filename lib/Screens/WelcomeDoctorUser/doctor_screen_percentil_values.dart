import 'package:bitirme2/Screens/WelcomeUser/get_baby_values.dart';
import 'package:bitirme2/components/backIconButton.dart';
import 'package:bitirme2/components/background.dart';
import 'package:flutter/material.dart';

class DoctorPercentilValues extends StatefulWidget {
  const DoctorPercentilValues({Key? key}) : super(key: key);

  @override
  State<DoctorPercentilValues> createState() => _DoctorPercentilValuesState();
}

class _DoctorPercentilValuesState extends State<DoctorPercentilValues> {
  Map<String,String> mapData = {
    '1. Ay':'123',
    '2. Ay':'234',
    '3. Ay':'345'
  };
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
                  buildPercentileList(context),
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
