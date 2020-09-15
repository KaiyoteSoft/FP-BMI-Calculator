import 'package:bmi_calculator/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'navigation_button.dart';
import 'calculator_brain.dart';


enum GenderType {
  male, female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int maleCardColor = kInactiveCardColor;
  int femaleCardColor = kInactiveCardColor;

  int height = 180;
  int weight = 60;
  int age = 21;

  void updateColor(GenderType gender) {
    if (gender == GenderType.male) {
      if (maleCardColor == kInactiveCardColor) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      }
      else {
        maleCardColor = kInactiveCardColor;
      }
    }
    else if (gender == GenderType.female) {
      if (femaleCardColor == kInactiveCardColor) {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      }
      else {
        femaleCardColor = kInactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(onPress: () {
                    setState(() {
                      updateColor(GenderType.male);
                    });
                  }, colour: Color(maleCardColor),
                  cardChild: ReusableGenderChild(gender: 'MALE', 
                    cardIcon: FontAwesomeIcons.mars,)
                    ,),
                ),
                Expanded(
                  child: ReusableCard(onPress: () {
                    setState(() {
                      updateColor(GenderType.female);
                    });
                  },colour: Color(femaleCardColor),
                  cardChild: ReusableGenderChild(gender: 'FEMALE', cardIcon: FontAwesomeIcons.venus,),)
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: Color(kActiveCardColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',
                      style: kTextProperties,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),
                          style: kLargeFontStyle,
                          ),
                          Text('cm', style: kTextProperties,)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          thumbShape:RoundSliderThumbShape(
                            enabledThumbRadius: 15.0
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30
                          ),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),)
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: Color(kActiveCardColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT (kg)', style: kTextProperties),
                      Text(weight.toString(), style: kLargeFontStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                            setState(() {
                              weight = weight - 1;
                            });
                          }),
                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                            setState(() {
                              weight = weight + 1;
                            });
                          }),
                        ],
                      )
                    ],
                  ),)
                ),
                Expanded(
                  child: ReusableCard(colour: Color(kActiveCardColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: kTextProperties),
                      Text(age.toString(), style: kLargeFontStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age = age - 1;
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age = age + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),)
                ),
              ],
            ),
          ),
          NavigationButton(buttonText: 'Calculate', onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ResultPage(
                      BMI: calc.calculateBMI(),
                      BMI_status: calc.determineHealth(),
                      message: calc.giveRecommendation()),
              ), );
          }),
        ],
      ),

    );
  }
}

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;
  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
