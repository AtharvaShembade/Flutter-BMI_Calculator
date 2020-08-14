import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeContainerColour = Color(0xFF1D1E33);
const inactiveContainerColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender {
  male, female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveContainerColour;
  Color femaleCardColour = inactiveContainerColour;

  void updateColour(Gender selectedGender) {
    //male card pressed
    if (selectedGender == Gender.male) {
      if (maleCardColour == inactiveContainerColour) {
        maleCardColour = activeContainerColour;
        femaleCardColour = inactiveContainerColour;
      }
      else{
        maleCardColour = inactiveContainerColour;
      }
    }
    else{
      if (femaleCardColour == inactiveContainerColour) {
        femaleCardColour = activeContainerColour;
        maleCardColour = inactiveContainerColour;
      }
      else{
        femaleCardColour = inactiveContainerColour;
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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.male);
                        //print('');
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          iconText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          iconText: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeContainerColour,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeContainerColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeContainerColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}








