import 'package:flutter/material.dart';

class IconContant extends StatelessWidget {
  IconContant({@required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
