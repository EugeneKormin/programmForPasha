import 'package:flutter/material.dart';


class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  late String _training_data;
  late String _reward_data;

  var cursor = '';

  String __get_cursor() {
    var cursor = '';
    return cursor;
  }

  void update_data() {
    print("show reward chart");
    print("show training chart");
    setState(() {
      _reward_data = "reward";
      _training_data = "training";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
      title: Text('Adding'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: update_data,
                child: Text('show_training_data'),
              ),
            ],
          )
        )
    );
  }
}

