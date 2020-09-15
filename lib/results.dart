import 'package:bmi_calculator/navigation_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final String BMI_status;
  final String BMI;
  final String message;

  ResultPage({this.BMI_status, this.BMI, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleTextStyle, textAlign: TextAlign.center,
          ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(kInactiveCardColor),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(BMI_status, style: kResultTextStyle),
                  Text(BMI, style: kBMITextStyle),
                  Text(message, style: kBodyTextStyle),
                ],
              ),
            ),
            ),
          NavigationButton(buttonText: 'RE-CALCULATE', onTap: () {
            Navigator.pushNamed(context, '/');
          },)
        ],
      ),
    );
  }
}
