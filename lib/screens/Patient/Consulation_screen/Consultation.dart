import 'package:flutter/material.dart';
import 'package:healthscope/components/Patient _bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';
import 'package:healthscope/size_config.dart';

class Consultation extends StatelessWidget {
  static String routeName = "/Consultation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Color(0XFFf7f7f7),
      appBar: AppBar(
        title: Text(
          "Consultation",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          PatientBottomNavBar(PselectedMenu: MenuState.patientConsultation),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              padding: EdgeInsets.all(20),
              child: Text(
                'Ask a doctor!',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFFEB1555),
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),

              decoration: BoxDecoration(
                color: Color(0XFFEB1555),
                borderRadius: BorderRadius.circular(20),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Speciality',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'price',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 70,

              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Stack(
                            fit: StackFit.expand,
                            overflow: Overflow.visible,
                            children: [
                              CircleAvatar(
                                // radius: 15,
                                backgroundImage: AssetImage(
                                    'assets/images/Dr Bruce Banner.jpg'),
                              ),
                              Positioned(
                                right: 7,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: Icon(
                                    Icons.circle,
                                    size: 15,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Bruce B',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'General practitioner',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      '150',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Center(
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: Stack(
                                fit: StackFit.expand,
                                overflow: Overflow.visible,
                                children: [
                                  CircleAvatar(
                                    // radius: 15,
                                    backgroundImage: AssetImage(
                                        'assets/images/Dr Sarah Clooney.png'),
                                  ),
                                  Positioned(
                                    right: 7,
                                    bottom: 10,
                                    child: SizedBox(
                                      height: 5,
                                      width: 5,
                                      child: Icon(
                                        Icons.circle,
                                        size: 15,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(5)),
                            Text(
                              'Sarah C',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Pediatricians',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        '150',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),

              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Stack(
                            fit: StackFit.expand,
                            overflow: Overflow.visible,
                            children: [
                              CircleAvatar(
                                // radius: 15,
                                backgroundImage: AssetImage(
                                    'assets/images/Dr Mark Ruffalo.jpg'),
                              ),
                              Positioned(
                                right: 7,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: Icon(
                                    Icons.circle,
                                    size: 15,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Mark R',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'Gyneocologist',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      '150',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Stack(
                            fit: StackFit.expand,
                            overflow: Overflow.visible,
                            children: [
                              CircleAvatar(
                                // radius: 15,
                                backgroundImage: AssetImage(
                                    'assets/images/Dr Brie Larson.jpg'),
                              ),
                              Positioned(
                                right: 7,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: Icon(
                                    Icons.circle,
                                    size: 15,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Brie L',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'Dermatologists',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      '150',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              // margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Stack(
                            fit: StackFit.expand,
                            overflow: Overflow.visible,
                            children: [
                              CircleAvatar(
                                // radius: 15,
                                backgroundImage: AssetImage(
                                    'assets/images/DrNatalieAdamsHeaderPic.jpg'),
                              ),
                              Positioned(
                                right: 7,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: Icon(
                                    Icons.circle,
                                    size: 15,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Natalie A',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'Heart specialist',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      '150',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
