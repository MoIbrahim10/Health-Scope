import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PatientResultScreen extends StatelessWidget {
  static String routeName = "/Patient Result Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patient results",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0XFFf7f7f7),
      body: PatientScreenBody(),
    );
  }
}

class PatientScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Colors.white,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconContant(
                      //   icon: FontAwesomeIcons.heartbeat,
                      // ),
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/electrocardiogram.png',
                            color: Color(0XFFEB1555),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '100',
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
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/celsius.png',
                            color: Color(0XFFEB1555),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '37',
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
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Colors.white,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/blood-pressure.png',
                            color: Color(0XFFEB1555),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '120/80',
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
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/pulse-oximeter.png',
                            color: Color(0XFFEB1555),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '99',
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
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Colors.white,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/glucose-meter (1).png',
                            color: Color(0XFFEB1555),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '120',
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
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'assets/images/weight-scale.png',
                            color: Color(0XFFEB1555),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '79',
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
        ),
      ],
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
