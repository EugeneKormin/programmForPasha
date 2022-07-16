import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:skii_app/api/api.dart';


class AddReward extends StatefulWidget {
  const AddReward({Key? key}) : super(key: key);

  @override
  State<AddReward> createState() => _addRewardState();
}

class _addRewardState extends State<AddReward> {
  String _DISTANCE = '';
  String _NAME = '';
  String _POSITION = '';
  var _date = null;
  bool isButtonEnabled = false;

  final _name_controller = TextEditingController();
  final _position_controller = TextEditingController();

  void save_and_stay() {
    save_reward();
    save_km();
    clear_controllers();
    disable_button();
  }
  void save_and_go() {
    save_reward();
    save_km();
    noSave_amd_go();
  }
  void save_km() {
    API.Save(
      DB_NAME: "training",
      NAME: _NAME,
      DISTANCE: _DISTANCE,
      date: (_date == null)
          ? DateFormat.yMd().format(DateTime.now())
          : DateFormat.yMd().format(_date),
    );
  }

  void save_reward() {
    API.Save(
      DB_NAME: "reward",
      NAME: _NAME,
      POSITION: _POSITION,
      date: (_date == null)
          ? DateFormat.yMd().format(DateTime.now())
          : DateFormat.yMd().format(_date),
    );
  }

  void noSave_amd_go() => Navigator.pushNamed(context, '/');
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
              onChanged: (text) => _DISTANCE = text,
              onSubmitted: (text) => checkButton(
                  name: _NAME, distance: text, position: _POSITION,
              ),
            ),

            TextField(
              decoration: InputDecoration(labelText: "surname/name"),
              controller: _name_controller,
              onChanged: (text) => _NAME = text,
              onSubmitted: (text) => checkButton(
                  name: text, distance: _DISTANCE, position: _POSITION,
              ),
            ),

            TextField(
                decoration: InputDecoration(labelText: "position"),
                controller: _position_controller,
                onChanged: (text) => _POSITION = text,
                onSubmitted: (text) => checkButton(
                    name: _NAME, distance: _DISTANCE, position: text,
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
