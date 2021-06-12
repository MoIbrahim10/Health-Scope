import 'package:flutter/material.dart';
// import 'package:healthscopeapplication/components/Patient _bottom_nav_bar.dart';
// import 'package:healthscopeapplication/enums.dart';
import 'package:healthscope/screens/Patient/Appoinment_screen/body.dart';

class DoctorDetail extends StatelessWidget {
  // static String routeName = "/DoctorDetail";
  final Doctor doctor;
  DoctorDetail({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(doctor.headerImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xFFA9A8A8),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${doctor.name}\n",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: doctor.specialist,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFFA9A8A8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      ButtonAction(
                        color: Color(0xFFFFB755),
                        icon: Icons.mail,
                      ),
                      SizedBox(width: 14.0),
                      ButtonAction(
                        color: Color(0xFF58c697),
                        icon: Icons.phone,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Divider(color: Color(0xFFA9A8A8)),
                  SizedBox(height: 20.0),
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    doctor.about,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFFA9A8A8),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Working hours",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        doctor.workingHours,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFA9A8A8),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Stats",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Stats(name: "Patients", total: doctor.patients),
                        Spacer(),
                        StatsExperience(
                            name: "Experience", total: doctor.experience),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                width: double.infinity,
                height: 55.0,
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 0.0,
                  color: Color(0XFFEB1555),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(
                    child: Text(
                      "Make an appointment",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class StatsExperience extends StatelessWidget {
  final String total;
  final String name;
  StatsExperience({this.total, this.name});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "$total",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: " years\n",
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFFA9A8A8),
          ).copyWith(fontSize: 12.0),
        ),
        TextSpan(
          text: "$name",
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFFA9A8A8),
          ).copyWith(fontSize: 14.0),
        ),
      ]),
    );
  }
}

class Stats extends StatelessWidget {
  final String total;
  final String name;
  Stats({this.total, this.name});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "$total\n",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: "$name",
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFFA9A8A8),
          ).copyWith(fontSize: 14.0),
        ),
      ]),
    );
  }
}

class ButtonAction extends StatelessWidget {
  final Color color;
  final IconData icon;
  ButtonAction({this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: color,
      ),
      child: Icon(
        icon,
        size: 25.0,
        color: Colors.white,
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialist;
  final String about;
  final String workingHours;
  final String patients;
  final String experience;
  final String image;
  final String headerImage;
  Doctor({
    this.about,
    this.experience,
    this.headerImage,
    this.image,
    this.name,
    this.patients,
    this.specialist,
    this.workingHours,
  });
}

List<Doctor> doctorList = [
  Doctor(
    name: "Dr Bruce Banner",
    specialist: "General Practitioner",
    workingHours: "Mon - Fri 08:00 - 16:00",
    experience: "16",
    patients: "112",
    image: "assets/images/Dr Bruce Banner.jpg",
    headerImage: "assets/images/Dr Bruce BannerHeaderpic.jpg",
    about:
        "A doctor can be found in several settings, including public health organization, group practices and  hospitals They have some of the most diverse and challenging careears available and part of a universally well-respected profession",
  ),
  Doctor(
    name: "Dr Sarah Clooney",
    specialist: "Pediatricians",
    workingHours: "Sat - Fri 08:00 - 19:00",
    experience: "3",
    patients: "79",
    image: "assets/images/Dr Sarah Clooney.png",
    headerImage: "assets/images/Dr Sarah Clooney.png",
    about:
        "Responsible physician with 3 years of experience maximizing patient wellness and facility profitability.",
  ),
  Doctor(
    name: "Dr Mark Ruffalo",
    specialist: "Gyneocologist",
    workingHours: "Mon - Fri 08:00 - 16:00",
    experience: "9",
    patients: "99",
    image: "assets/images/Dr Mark Ruffalo.jpg",
    headerImage: "assets/images/Dr Mark Ruffalo.jpg",
    about:
        "Responsible physician with 9 years of experience maximizing patient wellness and facility profitability.",
  ),
  Doctor(
    name: "Dr Brie Larson",
    specialist: "Dermatologists",
    workingHours: "Mon - Fri 08:00 - 16:00",
    experience: "4",
    patients: "92",
    image: "assets/images/Dr Brie Larson.jpg",
    headerImage: "assets/images/Dr Brie Larson.jpg",
    about:
        "Responsible physician with 4 years of experience maximizing patient wellness and facility profitability.",
  ),
  Doctor(
    name: "Dr Natalie Adams",
    specialist: "Heart specialist",
    workingHours: "Mon - Fri 08:00 - 16:00",
    experience: "7",
    patients: "392",
    image: "assets/images/DrNatalieAdams.jpg",
    headerImage: "assets/images/DrNatalieAdamsHeaderPic.jpg",
    about:
        "Responsible physician with 7 years of experience maximizing patient wellness and facility profitability.",
  ),
];
