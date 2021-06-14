import 'package:flutter/material.dart';
import 'package:healthscope/components/Doctor_bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthscope/size_config.dart';
import 'package:healthscope/constants.dart';
import 'package:animations/animations.dart';
import 'package:healthscope/screens/Doctor/DoctorCurrentPatients/PatientResust_dscreen.dart';
import 'dart:math' as math;
import 'package:healthscope/screens/sign_in/sign_in_screen.dart';

class DoctorScreen extends StatelessWidget {
  static String routeName = "/Doctor Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () =>
                Navigator.pushNamed(context, SignInScreen.routeName),
            child: SvgPicture.asset(
              "assets/icons/Log out.svg",
              color: Colors.white,
              width: 22,
            ),
          ),
        ],
        title: Text(
          "Patients",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          DoctorBottomNavBar(selectedMenu: MenuState.DoctorCurrentPatiet),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Patients(),
            PatientCarousel(),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
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
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search patient",
            prefixIcon: Icon(Icons.search)),
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
        GestureDetector(
          onTap: press,
          child: Text(
            "all patients",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}

class Patients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Patients", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [],
          ),
        )
      ],
    );
  }
}

class PatientCarousel extends StatefulWidget {
  @override
  _PatientCarouselState createState() => _PatientCarouselState();
}

class _PatientCarouselState extends State<PatientCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: patients.length, // we have 3 demo movies
          itemBuilder: (context, index) => buildPatientSlider(index),
        ),
      ),
    );
  }

  Widget buildPatientSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page;
            // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
            // we use clamp so that our value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: PatientCard(patient: patients[index]),
            ),
          );
        },
      );
}

class Patient {
  final int id, age, height, phoneNumber;
  final List<String> medicalHistory;
  final String bloodType, patientName, patientPic, backdrop;

  Patient({
    this.patientPic,
    this.backdrop,
    this.patientName,
    this.id,
    this.age,
    this.height,
    this.phoneNumber,
    this.medicalHistory,
    this.bloodType,
  });
}

// our demo data movie data
List<Patient> patients = [
  Patient(
    id: 1,
    patientName: "Pam Beesly",
    age: 60,
    bloodType: 'O-',
    patientPic: "assets/images/patient1.jpg",
    backdrop: "assets/images/patient1.jpg",
    height: 170,
    phoneNumber: 12025550162,
    medicalHistory: ["Diabetes", "heart disease"],
  ),
  Patient(
    id: 2,
    patientName: "Cole Smith",
    age: 20,
    bloodType: 'A+',
    patientPic: "assets/images/cole.jpg",
    backdrop: "assets/images/cole.jpg",
    height: 177,
    phoneNumber: 12025550162,
    medicalHistory: ["high blood pressure", "asthma"],
  ),
  Patient(
    id: 3,
    patientName: "Casey Williams",
    age: 22,
    bloodType: 'AB',
    patientPic: "assets/images/Casey_Gardnerx.png",
    backdrop: "assets/images/Casey_Gardnerx.png",
    height: 174,
    phoneNumber: 12025550162,
    medicalHistory: ["asthma", "Pneumonia"],
  ),
];

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({Key key, this.patient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildPatientCard(context),
        openBuilder: (context, action) => DetailsScreen(patientt: patient),
      ),
    );
  }

  Column buildPatientCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black26,
                )
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(patient.patientPic),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20 / 2),
          child: Text(
            patient.patientName,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SvgPicture.asset(
            //   "assets/icons/Camera Icon.svg",
            //   height: 20,
            // ),
            SizedBox(width: 20 / 2),
          ],
        )
      ],
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Patient patientt;

  const DetailsScreen({Key key, this.patientt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patient Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Bodyyy(pPatient: patientt),
    );
  }
}

class Bodyyy extends StatelessWidget {
  final Patient pPatient;

  const Bodyyy({Key key, this.pPatient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Backdrop(size: size, patieent: pPatient),
            PatentInfo(Patientname: pPatient),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Medical History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            MedicalHistoryy(history: pPatient),
            SizedBox(height: getProportionateScreenHeight(100)),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientResultScreen())),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFEB1555),
                    border: Border.all(color: Color(0XFFEB1555)),
                  ),
                  child: Center(
                    child: Text(
                      'Patient Results',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: getProportionateScreenHeight(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Backdrop extends StatelessWidget {
  const Backdrop({
    Key key,
    @required this.size,
    @required this.patieent,
  }) : super(key: key);

  final Size size;
  final Patient patieent;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 40% of our total height
      height: size.height * 0.4,
      child: Container(
        height: size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(patieent.backdrop),
          ),
        ),
      ),
    );
  }
}

class PatentInfo extends StatelessWidget {
  const PatentInfo({
    Key key,
    @required this.Patientname,
  }) : super(key: key);

  final Patient Patientname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    Patientname.patientName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0XFFEB1555),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    'Age: ${Patientname.age}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Phone Number: +${Patientname.phoneNumber}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Height: ${Patientname.height}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Blood Type: ${Patientname.bloodType}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MedicalHistoryy extends StatelessWidget {
  const MedicalHistoryy({
    Key key,
    @required this.history,
  }) : super(key: key);

  final Patient history;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: history.medicalHistory.length,
          itemBuilder: (context, index) => MedicalHistoryCard(
            medicalHistoryy: history.medicalHistory[index],
          ),
        ),
      ),
    );
  }
}

class MedicalHistoryCard extends StatelessWidget {
  final String medicalHistoryy;

  const MedicalHistoryCard({Key key, this.medicalHistoryy}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 25),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFFEB1555)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        medicalHistoryy,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.svgSrc,
    this.numOfitem = 0,
    @required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
