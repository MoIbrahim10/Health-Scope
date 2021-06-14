import 'package:flutter/material.dart';
import 'package:healthscope/components/Patient%20_bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthscope/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class PatientScreen extends StatelessWidget {
  static String routeName = "/Patient Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My results",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0XFFf7f7f7),
      body: PatientScreenBody(),
      bottomNavigationBar:
          PatientBottomNavBar(PselectedMenu: MenuState.PatientResults),
    );
  }
}

class PatientScreenBody extends StatefulWidget {
  final String title;
  final FirebaseApp app;
  PatientScreenBody({Key key, this.title, this.app}) : super(key: key);

  @override
  _PatientScreenBodyState createState() => _PatientScreenBodyState();
}

class _PatientScreenBodyState extends State<PatientScreenBody> {
  final databaseReference = FirebaseDatabase.instance;
  var spo2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ref = databaseReference.reference();

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Column(children: [
              Flexible(
                child: FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: ref,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      var spo2 = snapshot.value['spo2']['val'];
                      var bg = snapshot.value['Bloodglucose']['val'];
                      var bp = snapshot.value['Bloodpressure']['val'];
                      var hr = snapshot.value['Heartrate']['val'];
                      var temperature = snapshot.value['Temperature']['val'];
                      var weight = snapshot.value['Weight']['val'];

                      print(snapshot.value);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Hello, Casey',
                            style: TextStyle(
                              fontFamily: 'Muli',
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFEB1555),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(2)),
                          Row(
                            children: [
                              Expanded(
                                child: ReusableCard(
                                  colour: Colors.white,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/electrocardiogram.png',
                                          color: Color(0XFFEB1555),
                                          height: 45,
                                        ),
                                      ),
                                      Text(
                                        'Heart Rate',
                                        style: TextStyle(
                                          color: Color(0XFFEB1555),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            // '60',
                                            '$hr',
                                            // '100',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0XFFEB1555)),
                                          ),
                                          Text(
                                            'BPM',
                                            style: TextStyle(
                                              color: Color(0XFFEB1555),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ReusableCard(
                                  colour: Colors.white,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/celsius.png',
                                          color: Color(0XFFEB1555),
                                          height: 40,
                                        ),
                                      ),
                                      Text(
                                        'Temperature',
                                        style: TextStyle(
                                          color: Color(0XFFEB1555),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            '37',
                                            // '$temperature',
                                            // '$temperature',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0XFFEB1555)),
                                          ),
                                          Text(
                                            'C',
                                            style: TextStyle(
                                              color: Color(0XFFEB1555),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReusableCard(
                                  colour: Colors.white,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/blood-pressure.png',
                                          color: Color(0XFFEB1555),
                                          height: 40,
                                        ),
                                      ),
                                      Text(
                                        'Blood Presure',
                                        style: TextStyle(
                                          color: Color(0XFFEB1555),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            // '120/80',
                                            '$bp',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0XFFEB1555)),
                                          ),
                                          Text(
                                            'mmHG',
                                            style: TextStyle(
                                              color: Color(0XFFEB1555),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ReusableCard(
                                  colour: Colors.white,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/pulse-oximeter.png',
                                          color: Color(0XFFEB1555),
                                          height: 40,
                                        ),
                                      ),
                                      Text(
                                        'SpO2',
                                        style: TextStyle(
                                          color: Color(0XFFEB1555),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            '$spo2',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0XFFEB1555)),
                                          ),
                                          Text(
                                            '%',
                                            style: TextStyle(
                                              color: Color(0XFFEB1555),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReusableCard(
                                  colour: Colors.white,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/glucose-meter (1).png',
                                          color: Color(0XFFEB1555),
                                          height: 40,
                                        ),
                                      ),
                                      Text(
                                        'Blood Glucose',
                                        style: TextStyle(
                                          color: Color(0XFFEB1555),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            // '120',
                                            '$bg',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0XFFEB1555)),
                                          ),
                                          Text(
                                            'mg/dL',
                                            style: TextStyle(
                                              color: Color(0XFFEB1555),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ReusableCard(
                                  colour: Colors.white,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/weight-scale.png',
                                          color: Color(0XFFEB1555),
                                          height: 40,
                                        ),
                                      ),
                                      Text(
                                        'Weight',
                                        style: TextStyle(
                                          color: Color(0XFFEB1555),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            // '80',
                                            '$weight',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0XFFEB1555)),
                                          ),
                                          Text(
                                            'Kg',
                                            style: TextStyle(
                                              color: Color(0XFFEB1555),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(50),
      height: getProportionateScreenHeight(150),
      child: cardChild,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: Color(0xffb8bfce).withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: Color(0xffb8bfce).withOpacity(.1),
          )
        ],
      ),
    );
  }
}
