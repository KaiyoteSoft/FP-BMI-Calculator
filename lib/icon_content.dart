import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';


class ReusableGenderChild extends StatelessWidget {
  final String gender;
  final IconData cardIcon;

  ReusableGenderChild({@required this.gender, @required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(cardIcon,
            size: 80),
        SizedBox(
          height: 15,
        ),
        Text(gender,
          style: kTextProperties,),
      ],
    );
  }
}