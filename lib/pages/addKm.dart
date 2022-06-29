import 'package:flutter/material.dart';
import 'package:web_app/buttons/navigation.dart';


class addKm extends StatefulWidget {
  const addKm({Key? key}) : super(key: key);

  @override
  State<addKm> createState() => _addKmState();
}

class _addKmState extends State<addKm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('тренировка'),
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
                )
              ]
          ),
        )
    );
  }
}
