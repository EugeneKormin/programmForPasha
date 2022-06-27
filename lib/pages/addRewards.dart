import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_app/navigation/buttons.dart';


class addReward extends StatefulWidget {
  const addReward({Key? key}) : super(key: key);

  @override
  State<addReward> createState() => _addRewardState();
}

class _addRewardState extends State<addReward> {

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
                NavigationButton(
                    route: '/',
                    margin_from_top: 0,
                    button_name: "вернуться без сохранения"
                ),
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
                    button_name: "сл. воспитанник"
                ),
                NavigationButton(
                    route: '/',
                    margin_from_top: 0,
                    button_name: "сохранить и выйти"
                )
              ]
        )
    ));
  }
}
