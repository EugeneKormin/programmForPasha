import 'package:flutter/material.dart';
import 'package:web_app/buttons/add.dart';
import 'package:web_app/pages/addRewards.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List listOfChildren = ['Вася', 'Петя', 'Оля'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('Pasha\'s program'),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: SafeArea(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      action: "add_km",
                      button_name: "добавить км"
                  ),
                  Button(
                      action: "add_rewards",
                      button_name: "добавить награды"
                  )
                ]
            ),
        )
    );
  }
}