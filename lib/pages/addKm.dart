import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:skii_app/db/sql.dart';


class AddKm extends StatefulWidget {
  const AddKm({Key? key}) : super(key: key);

  @override
  State<AddKm> createState() => _addKmState();
}

class _addKmState extends State<AddKm> {
  String _DISTANCE = '';
  String _NAME = '';
  var _date = null;
  bool isButtonEnabled = false;

  final _name_controller = TextEditingController();

  void save_and_stay() {
    save_km();
    clear_controller();
    disable_button();
  }
  void save_and_go() {
    save_km();
    noSave_amd_go();
  }
  void save_km() {
    SQL.Save(
      DB_NAME: "training",
      NAME: _NAME,
      DISTANCE: _DISTANCE,
      date: (_date == null)
          ? DateFormat.yMMMMEEEEd().format(DateTime.now())
          : DateFormat.yMMMMEEEEd().format(_date),
    );
  }

  void noSave_amd_go() => Navigator.pushNamed(context, '/');
  void enable_button() => setState(() => isButtonEnabled = true);
  void disable_button() => setState(() => isButtonEnabled = false);
  void clear_controller() => setState(() => _name_controller.clear());
  void checkButton({name, distance, position}) {
    if (name != '') {
      if (distance != '') {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('training'),
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
                      name: _NAME, distance: text,
                  ),
                ),

                TextField(
                  decoration: InputDecoration(labelText: "surname/name"),
                  controller: _name_controller,
                  onChanged: (text) => _NAME = text,
                  onSubmitted: (text) => checkButton(
                      name: text, distance: _DISTANCE,
                  ),
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
        ),
      );
  }
}
