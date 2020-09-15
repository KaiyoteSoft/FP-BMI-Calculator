import 'package:flutter/material.dart';
import 'constants.dart';


class NavigationButton extends StatelessWidget {

  final Function onTap;
  final String buttonText;

  NavigationButton({@required this.buttonText, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonText, style: kLargeButtonTextStyle,)),
        color: Color(kBottomBarColor),
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}