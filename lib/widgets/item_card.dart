import 'package:burn_off/model/aliment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({this.aliment, this.cardColor, this.increment, this.decrement});

  final LinearGradient cardColor;
  final Aliment aliment;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 25.0,
          child: Container(
            height: MediaQuery.of(context).size.height - 250,
            width: MediaQuery.of(context).size.width - 150,
            child: Container(
              margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Column(
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
                          color: cardColor.colors[0]
                        ),
                        width: 70,
                        height: 1.0,
                      ),
                      Container(
                        child: OutlineButton(
                          borderSide: BorderSide(color: cardColor.colors[0]),
                          onPressed: () => null,
                          shape: StadiumBorder(),
                          child: SizedBox(
                            width: 60.0,
                            height: 45.0,
                            child: Center(
                                child: Text('${aliment.totalCalories.toInt()}' + "cal",
                                    style: TextStyle(
                                        color: cardColor.colors[0],
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w400
                                    ),
                                    textAlign: TextAlign.center)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: cardColor.colors[0]
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}