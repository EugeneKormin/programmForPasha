import 'package:flutter/material.dart';
import 'package:web_app/buttons/navigation.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('Добавление'),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: SafeArea(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationButton(
                      route: 'addKm',
                      margin_from_top: 50,
                      button_name: "тренировка"
                  ),
                  NavigationButton(
                      route: 'addReward',
                      margin_from_top: 50,
                      button_name: "соревнования"
                  )
                ]
            ),
        )
    );
  }
}