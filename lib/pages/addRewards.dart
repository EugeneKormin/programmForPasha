import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_app/buttons/navigation.dart';


class addReward extends StatefulWidget {
  const addReward({Key? key}) : super(key: key);

  @override
  State<addReward> createState() => _addRewardState();
}

class _addRewardState extends State<addReward> {
  late double distance;
  late String name;
  late int position;

  void changeDistance(double change_distance_for) {
    setState(() {
      distance = change_distance_for;
    });
  }

  void changeName(String change_name_for) {
    setState(() {
      name = change_name_for;
    });
  }

  void changePosition(int change_position_for) {
    setState(() {
      position = change_position_for;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('соревнования'),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "дистанция"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly]
                  ),
                TextField(
                    decoration: InputDecoration(labelText: "ФИО"),
                    keyboardType: TextInputType.name
                    ),
                TextField(
                    decoration: InputDecoration(labelText: "место"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
                NavigationButton(
                    route: '/',
                    margin_from_top: 0,
                    button_name: "сохранить => сл. воспитанник"
                ),
                NavigationButton(
                    route: '/',
                    margin_from_top: 0,
                    button_name: "сохранить => выйти"
                ),
                NavigationButton(
                    route: '/',
                    margin_from_top: 0,
                    button_name: "выход без сохранения"
                ),
              ]
        )
    ));
  }
}
