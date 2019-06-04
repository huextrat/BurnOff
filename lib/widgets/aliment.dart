import 'package:burn_off/model/aliment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlimentWidget extends StatelessWidget {
  final LinearGradient theme;
  final Aliment aliment;
  final VoidCallback increment;
  final VoidCallback decrement;

  AlimentWidget({
    @required this.aliment,
    @required this.theme,
    this.increment,
    this.decrement
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SvgPicture.asset(
          aliment.image,
          width: 70.0,
          height: 70.0,
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text(aliment.name,
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Qwigley')),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text("• " + aliment.subtitle + " •",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'Dosis',
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: theme.colors[0]
              ),
              width: 70,
              height: 1.0,
            ),
            Container(
              child: OutlineButton(
                borderSide: BorderSide(color: theme.colors[0]),
                onPressed: () => null,
                shape: StadiumBorder(),
                child: SizedBox(
                  width: 60.0,
                  height: 45.0,
                  child: Center(
                      child: Text('${aliment.totalCalories.toInt()}' + "cal",
                          style: TextStyle(
                              color: theme.colors[0],
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.center)),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: theme.colors[0]
              ),
              width: 70,
              height: 1.0,
            ),
          ],
        ),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/running.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('${aliment.runTime.toInt()}' + " min"),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/bicycle.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('${aliment.bikeTime.toInt()}' + " min"),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/swim.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('${aliment.swimTime.toInt()}' + " min"),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/images/workout.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('${aliment.workoutTime.toInt()}' + " min"),
                    ),
                  ],
                ),
              ],
            )
        ),
      ],
    );
  }
}