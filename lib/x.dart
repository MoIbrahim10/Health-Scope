// import 'package:flutter/material.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class XX extends StatefulWidget {
//   final FirebaseApp app;
//   XX({Key key, this.app}) : super(key: key);
//
//   @override
//   _XXState createState() => _XXState();
// }
//
// class _XXState extends State<XX> {
//   final databaseReference = FirebaseDatabase.instance.reference();
//   var spo2;
//   DatabaseReference _counterRef;
//   @override
//   void initState() {
//     final FirebaseDatabase database = FirebaseDatabase();
//     // databaseReference.child('spo2').once().then((DataSnapshot snapshot) {
//     //   spo2 = snapshot.value['degree'];
//     //   // print(snapshot.value['degree']);
//     // });
//     _counterRef = database.reference().child('spo2');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: 120,
//           height: 300,
//           child: Column(children: [
//             Flexible(
//               child: FirebaseAnimatedList(
//                   shrinkWrap: true,
//                   query: _counterRef,
//                   itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                       Animation<dynamic> animation, dynamic index) {
//                     var i = snapshot.key;
//                     var m = snapshot.value.toString();
//                     return ListTile(
//                       title: Text(
//                         i,
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Color(0x8C6E341A),
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         m,
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: Color(0x8CDD4D0B),
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     );
//                   }),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:trialapp/screens/location_screen.dart';
import '../../drawer.dart';
import 'background_his.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:async';

class CustomDatabase extends StatefulWidget {
  static const routeName = '/firebase';
  CustomDatabase({this.app});
  final FirebaseApp app;

  @override
  _CustomDatabaseState createState() => _CustomDatabaseState();
}

class _CustomDatabaseState extends State<CustomDatabase> {
  final referenceDatabase = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ref = referenceDatabase.reference();
    var temp;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart helmet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontFamily: 'Signatra',
          ),
        ),
      ),
      drawer: DrawerS(),
      body: BackgroundHis(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      Flexible(
                        child: new FirebaseAnimatedList(
                          shrinkWrap: true,
                          query: ref,
                          itemBuilder: (BuildContext context,
                              DataSnapshot snapshot,
                              Animation<double> animation,
                              int index) {
                            var temperature =
                                snapshot.value['Temperature']['val'];

                            temp = temperature + 7;
                            bool _isthreat;
                            temp > 37 || temp < 32
                                ? _isthreat = true
                                : _isthreat = false;
                            _isthreat ? playaudio() : puseaudio();
                            bool _iswearinghelmet =
                                !snapshot.value['iswearinghelmet']['val'];
                            !_iswearinghelmet ? playaudio() : puseaudio();
                            var latitude = snapshot.value['latitude']['val'];
                            var longitude = snapshot.value['longitude']['val'];

                            return Stack(children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.yellowAccent[100],
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _iswearinghelmet
                                                ? ' worker temperature : $temp ˚C'
                                                : "worker isn't wearing helmet",
                                            style: TextStyle(
                                              fontSize: 21,
                                              color:
                                                  _isthreat || !_iswearinghelmet
                                                      ? Colors.red[800]
                                                      : null,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          LocationScreen(
                                                            lat: latitude,
                                                            long: longitude,
                                                          )));
                                            },
                                            child: Icon(
                                              Icons.location_on,
                                              color:
                                                  _isthreat || !_iswearinghelmet
                                                      ? Colors.red[800]
                                                      : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'latitude:$latitude ,longitude:$longitude',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  _isthreat || !_iswearinghelmet
                                                      ? Colors.red[800]
                                                      : Colors.grey[700],
                                            ),
                                          ),
                                          _iswearinghelmet
                                              ? Image.asset(
                                                  'assets/images/nothelmet.png',
                                                  height: 35,
                                                  width: 35,
                                                )
                                              : Image.asset(
                                                  'assets/images/helmet.png',
                                                  height: 40,
                                                  width: 40,
                                                  color: Colors.red[800],
                                                ),
                                          !_iswearinghelmet || _isthreat
                                              ? GestureDetector(
                                                  onTap: () {
                                                    snooze();
                                                  },
                                                  child: Icon(
                                                    Icons.snooze,
                                                    color: !_iswearinghelmet ||
                                                            _isthreat
                                                        ? Colors.red[800]
                                                        : null,
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      )
                                    ]),
                              ),
                            ]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void snooze() async {
    assetsAudioPlayer.stop();
    Timer(Duration(minutes: 2), () {
      assetsAudioPlayer.play();
    });
  }
}

// Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// Text(
// 'Hello, Casey',
// style: TextStyle(
// fontFamily: 'Muli',
// fontSize: 40.0,
// fontWeight: FontWeight.bold,
// color: Color(0XFFEB1555),
// ),
// ),
// SizedBox(height: getProportionateScreenHeight(2)),
// Expanded(
// child: Row(
// children: [
// Expanded(
// child: ReusableCard(
// colour: Colors.white,
// cardChild: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Expanded(
// child: Center(
// child: Image.asset(
// 'assets/images/electrocardiogram.png',
// color: Color(0XFFEB1555),
// ),
// ),
// ),
// Text(
// 'Heart Rate',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 20,
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: [
// Text(
// '100',
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w900,
// color: Color(0XFFEB1555)),
// ),
// Text(
// 'BPM',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 15,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: ReusableCard(
// colour: Colors.white,
// cardChild: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Expanded(
// child: Center(
// child: Image.asset(
// 'assets/images/celsius.png',
// color: Color(0XFFEB1555),
// ),
// ),
// ),
// Text(
// 'Temperature',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 20,
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: [
// Text(
// '37',
// // '$temperature',
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w900,
// color: Color(0XFFEB1555)),
// ),
// Text(
// 'C',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 15,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// Expanded(
// child: Row(
// children: [
// Expanded(
// child: ReusableCard(
// colour: Colors.white,
// cardChild: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Expanded(
// child: Center(
// child: Image.asset(
// 'assets/images/blood-pressure.png',
// color: Color(0XFFEB1555),
// ),
// ),
// ),
// Text(
// 'Blood Presure',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 20,
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: [
// Text(
// '120/80',
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w900,
// color: Color(0XFFEB1555)),
// ),
// Text(
// 'mmHG',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 15,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: ReusableCard(
// colour: Colors.white,
// cardChild: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Expanded(
// child: Center(
// child: Image.asset(
// 'assets/images/pulse-oximeter.png',
// color: Color(0XFFEB1555),
// ),
// ),
// ),
// Text(
// 'SpO2',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 20,
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: [
// Text(
// '99',
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w900,
// color: Color(0XFFEB1555)),
// ),
// Text(
// '%',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 15,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// Expanded(
// child: Row(
// children: [
// Expanded(
// child: ReusableCard(
// colour: Colors.white,
// cardChild: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Expanded(
// child: Center(
// child: Image.asset(
// 'assets/images/glucose-meter (1).png',
// color: Color(0XFFEB1555),
// ),
// ),
// ),
// Text(
// 'Blood Glucose',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 20,
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: [
// Text(
// '120',
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w900,
// color: Color(0XFFEB1555)),
// ),
// Text(
// 'mg/dL',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 15,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: ReusableCard(
// colour: Colors.white,
// cardChild: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Expanded(
// child: Center(
// child: Image.asset(
// 'assets/images/weight-scale.png',
// color: Color(0XFFEB1555),
// ),
// ),
// ),
// Text(
// 'Weight',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 20,
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: [
// Text(
// '79',
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w900,
// color: Color(0XFFEB1555)),
// ),
// Text(
// 'Kg',
// style: TextStyle(
// color: Color(0XFFEB1555),
// fontSize: 15,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// );
