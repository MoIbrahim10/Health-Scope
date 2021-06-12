import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final IconData icon;
  final String title;
  final String subtitle;

  Tile(
      {this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.icon,
      this.title,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 175.0,
      decoration: BoxDecoration(
        border: Border.all(
            color: this.borderColor, style: BorderStyle.solid, width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
        color: this.backgroundColor,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Opacity(
                opacity: this.icon != null ? 1.0 : 0.0,
                child: Hero(
                  tag: this.subtitle,
                  child: Icon(
                    this.icon,
                    color: this.textColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w400,
                  color: this.textColor,
                ),
              ),
              Text(
                this.subtitle,
                style: TextStyle(
                  fontSize: 20.0,
                  color: this.textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

const kTileDefaultBackgroundColor = Colors.white;
const kTileDefaultTextColor = Color(0xFF0A2F47);
const kTileDefaultBorderColor = Color(0xFFE8EAEE);

const kSwatchBlueColor = Color(0xFF52BEFF);
const kSwatchPinkColor = Color(0xFFFE385E);

const KBottomContainerColor = Color(0XFFEB1555);

const KBottomContainerHeight = 80.0;
const KActiveCardColor = Color(0xFF1D1E33);
const KInactiveCardColor = Color(0xFF111328);

const KLabelTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 10,
);

const KNumberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const KCALCButtonStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const KResultStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

const KresulttextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const KBMItextstyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

const KBodytextstyle = TextStyle(
  fontSize: 20,
);
