import 'package:flutter/material.dart';

import 'package:skii_app/pages/home.dart';
import 'package:skii_app/pages/addKm.dart';
import 'package:skii_app/pages/addRewards.dart';
import 'package:skii_app/pages/showData.dart';


void main() => runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.indigoAccent
    ),
    initialRoute: '/',
    routes: {
        '/': (context) => HomePage(),
        'addKm': (context) => AddKm(),
        'addReward': (context) => AddReward(),
        'showData': (context) => ShowData(),
    }
));
