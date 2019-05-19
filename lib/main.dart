import 'package:burn_off/model/aliments.dart';
import 'package:burn_off/widgets/aliment.dart';
import 'package:burn_off/widgets/card_item.dart';
import 'package:burn_off/widgets/page.dart';
import 'package:burn_off/widgets/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BurnOff',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MenuPager(
          children: Aliments.aliments
              .map(
                (aliment) => Page(
                      title: "HOW TO BURN OFF",
                      background: aliment.background,
                      icon: aliment.bottomImage,
                      child: CardItem(
                        child: AlimentWidget(
                          aliment: aliment,
                          theme: aliment.background,
                        ),
                      ),
                    ),
              )
              .toList(),
        ),
      ),
    );
  }
}
