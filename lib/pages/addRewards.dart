import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:web_app/db/save.dart';


class addReward extends StatefulWidget {
  const addReward({Key? key}) : super(key: key);

  @override
  State<addReward> createState() => _addRewardState();
}

class _addRewardState extends State<addReward> {
  String _distance = '';
  String _name = '';
  String _position = '';
  String _ip = '';
  var _date = null;
  bool isButtonEnabled = false;

  final _name_controller = TextEditingController();
  final _position_controller = TextEditingController();

  void save_and_stay() {
    save_reward();
    clear_controllers();
    disable_button();
  }
  void save_and_go() {
    save_reward();
    noSave_amd_go();
  }
  void noSave_amd_go() => Navigator.pushNamed(context, '/');

  void save_reward() {
    Save.reward(
      name: _name,
      position: _position,
      date: (_date == null)
          ? DateFormat.yMMMMEEEEd().format(DateTime.now())
          : DateFormat.yMMMMEEEEd().format(_date),
      type: "reward",
    );
  }

  void enable_button() => setState(() => isButtonEnabled = true);
  void disable_button() => setState(() => isButtonEnabled = false);

  void clear_controllers() {
    setState(() => _name_controller.clear());
    setState(() => _position_controller.clear());
  }

    void checkButton({name, distance, position}) {
      if (name != '') {
        if (distance != '') {
          if (position != '') {
            enable_button();
          }
          else {
            disable_button();
          }
        }
        else {
          disable_button();
        }
      }
      else {
        disable_button();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('competitions'),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("chose a date"),
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2027)
                  ).then((value) {
                    setState(() {
                      _date = value;
                    });
                  });
                },
              ),

              Text(
                (_date == null)
                    ? DateFormat.yMMMMEEEEd().format(DateTime.now())
                    : DateFormat.yMMMMEEEEd().format(_date),
                style: TextStyle(height: 2, fontSize: 20),
              ),

              TextField(
                decoration: InputDecoration(labelText: "distance"),
                onChanged: (text) => _distance = text,
                onSubmitted: (text) => checkButton(
                    name: _name, distance: text, position: _position,
                ),
              ),

              TextField(
                decoration: InputDecoration(labelText: "surname/name"),
                controller: _name_controller,
                onChanged: (text) => _name = text,
                onSubmitted: (text) => checkButton(
                    name: text, distance: _distance, position: _position,
                ),
              ),

              TextField(
                  decoration: InputDecoration(labelText: "position"),
                  controller: _position_controller,
                  onChanged: (text) => _position = text,
                  onSubmitted: (text) => checkButton(
                      name: _name, distance: _distance, position: text,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ]
              ),

              ElevatedButton(
                onPressed: isButtonEnabled ? save_and_stay : null,
                child: Text('save => next student'),
              ),

              ElevatedButton(
                onPressed: isButtonEnabled ? save_and_go : null,
                child: Text('save => exit'),
              ),

              ElevatedButton(
                onPressed: noSave_amd_go,
                child: Text('exit without saving'),
              ),
            ],
          )
        )
      );
    }
  }
