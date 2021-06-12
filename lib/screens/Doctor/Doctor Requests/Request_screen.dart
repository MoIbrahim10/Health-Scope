import 'package:flutter/material.dart';
import 'package:healthscope/components/Doctor_bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';
import 'package:healthscope/size_config.dart';

class Request extends StatelessWidget {
  static String routeName = "/Request";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf7f7f7),
      appBar: AppBar(
        title: Text(
          "Request",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          DoctorBottomNavBar(selectedMenu: MenuState.DoctorRequest),
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
                'Consultation Requests',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFFEB1555),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                backgroundImage:
                                    AssetImage('assets/images/download.jpg'),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    color: Color(0xFFF5F6F9),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Bryan Cranston',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Text(
                'Hello Dr.  Brie Larson. \n I would like a consultation in regard of my skin eczema.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Color(0XFFEB1555),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                backgroundImage:
                                    AssetImage('assets/images/lucy-hale.jpg'),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    color: Color(0xFFF5F6F9),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Lucy Hale',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Text(
                'Hello Dr.  Brie Larson. \n I would like a consultation in regard of my skin eczema.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Color(0XFFEB1555),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    'assets/images/Robbie Amell.jpg'),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    color: Color(0xFFF5F6F9),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Robbie Amell',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Text(
                'Hello Dr.  Brie Larson. \n I would like a consultation in regard of my skin eczema.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Color(0XFFEB1555),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    'assets/images/Noah Schnacky.jpg'),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    color: Color(0xFFF5F6F9),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Noah Schnacky',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Text(
                'Hello Dr.  Brie Larson. \n I would like a consultation in regard of my skin eczema.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Color(0XFFEB1555),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                backgroundImage:
                                    AssetImage('assets/images/Chloe-grace.jpg'),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    color: Color(0xFFF5F6F9),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Chloe Grace',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Text(
                'Hello Dr.  Brie Larson. \n I would like a consultation in regard of my skin eczema.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Color(0XFFEB1555),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                backgroundImage:
                                    AssetImage('assets/images/Halsey.jpg'),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 10,
                                child: SizedBox(
                                  height: 5,
                                  width: 5,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    color: Color(0xFFF5F6F9),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text(
                          'Ashley James',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              decoration: BoxDecoration(
                color: Color(0XFFf7f7f7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[],
              ),
              child: Text(
                'Hello Dr.  Brie Larson. \n I would like a consultation in regard of my skin eczema.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Color(0XFFEB1555),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
