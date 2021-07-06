import 'package:flutter/material.dart';
import 'package:healthscope/size_config.dart';
import 'package:healthscope/screens/Patient/Appoinment_screen/Doctor detail.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Container(
              // margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Your Next Appointment',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Muli',
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF522349),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    color: Color(0xffb8bfce).withOpacity(.5),
                  ),
                  BoxShadow(
                    offset: Offset(-3, 0),
                    blurRadius: 15,
                    color: Color(0xffb8bfce).withOpacity(.1),
                  )
                ],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFFD9D9D9),
                          backgroundImage:
                              AssetImage("assets/images/Dr Bruce Banner.jpg"),
                          radius: 36.0,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Dr Bruce Banner',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\nSunday,May 6th at 5:00 PM',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\nJoseph Tito St, Huckstep,  \nEl Nozha, Cairo Governorate',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      height: 3,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _iconBuilder(LineAwesomeIcons.check_circle, 'Check-in'),
                        _iconBuilder(LineAwesomeIcons.times_circle, 'Cancel'),
                        _iconBuilder(
                            LineAwesomeIcons.calendar_times_o, 'Calender'),
                        _iconBuilder(LineAwesomeIcons.compass, 'Directions'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(160),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0XFFEB1555),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    color: Color(0XFFEB1555).withOpacity(.4),
                  ),
                  BoxShadow(
                    offset: Offset(-3, 0),
                    blurRadius: 15,
                    color: Color(0xffb8bfce).withOpacity(.5),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Do you have symptoms\nof Covid 19?",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          RaisedButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Color(0xFFF3F3F3),
                            elevation: 2.0,
                            child: SizedBox(
                              width: 150.0,
                              height: 50.0,
                              child: Center(
                                child: Text(
                                  "Contact a doctor",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color(0XFFEB1555),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/doctor11.png",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 15.0),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              // margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Muli',
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF522349),
                    ),
                  ),
                ],
              ),
            ),
            Categories(),
            Doctors(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: SearchField()),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeConfig.screenWidth * 0.89,
        decoration: BoxDecoration(
          color: Color(0xFF979797).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) => print(value),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25),
                  vertical: getProportionateScreenWidth(9)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search Doctor",
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DoctorCartegoriesCard(
                image:
                    "assets/images/General-Practitioner-GP-Online-Mandatory-Training-Package.jpg",
                category: "General practitioner",
                numOfDoctors: 7,
                press: () {},
              ),
              DoctorCartegoriesCard(
                image: "assets/images/considering-pediatrics-1109x675.jpg",
                category: "Pediatricians",
                numOfDoctors: 24,
                press: () {},
              ),
              DoctorCartegoriesCard(
                image: "assets/images/Dermatologist.jpg",
                category: "Dermatologists",
                numOfDoctors: 24,
                press: () {},
              ),
              DoctorCartegoriesCard(
                image: "assets/images/obgyn consult teaser.jpg",
                category: "Gyneocologist",
                numOfDoctors: 20,
                press: () {},
              ),
              DoctorCartegoriesCard(
                image: "assets/images/cardiologist-india.jpg",
                category: "Heart Specialist",
                numOfDoctors: 25,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class DoctorCartegoriesCard extends StatelessWidget {
  const DoctorCartegoriesCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfDoctors,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfDoctors;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(165),
          height: getProportionateScreenWidth(110),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfDoctors Doctors")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class Doctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _areaSpecialistsText(),
                ListView.builder(
                  itemCount: doctorList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var doctor = doctorList[index];

                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDetail(
                                doctor: doctor,
                              ),
                            ),
                          );
                        },
                        child: DoctorCard(doctor: doctor));
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget _areaSpecialistsText() {
  return Container(
    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Doctors',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Muli',
          ),
        ),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF522349),
          ),
        ),
      ],
    ),
  );
}

extension OnPressed on Widget {
  Widget ripple(Function onPressed,
          {BorderRadiusGeometry borderRadius =
              const BorderRadius.all(Radius.circular(5))}) =>
      Stack(
        children: <Widget>[
          this,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  }
                },
                child: Container()),
          )
        ],
      );
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  DoctorCard({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: randomColor(),
              ),
              child: Image.asset(
                doctor.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(doctor.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          subtitle: Text(
            doctor.specialist,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            // color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(() {
        // Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

Column _iconBuilder(icon, title) {
  return Column(
    children: <Widget>[
      Icon(
        icon,
        size: 28,
        color: Colors.black,
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    ],
  );
}
