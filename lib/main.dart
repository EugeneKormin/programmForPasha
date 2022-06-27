import 'package:flutter/material.dart';
import 'package:web_app/pages/home.dart';
import 'package:web_app/pages/addKm.dart';
import 'package:web_app/pages/addRewards.dart';


void main() => runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.indigoAccent
    ),
    initialRoute: '/',
    routes: {
        '/': (context) => HomePage(),
        'addKm': (context) => addKm(),
        'addReward': (context) => addReward()
    }
));
