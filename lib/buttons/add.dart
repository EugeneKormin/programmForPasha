import 'package:flutter/material.dart';
import 'package:web_app/pages/addKm.dart';
import 'package:web_app/pages/addRewards.dart';


class Button extends StatelessWidget {
    final String action;
    final String button_name;

  const Button({
    Key? key,
    required this.action,
    required this.button_name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
        child: ElevatedButton(

        onPressed: () {
          print(Text('action: $action'));
          if (action == 'add_km') {
            print(Text('AddKm start'));
            AddKm();
          }
          else if (action == ' add_rewards') {
            print(Text('AddRewards start'));
            AddRewards();
          }
        },
        child: Text(button_name))
    );
  }
}
