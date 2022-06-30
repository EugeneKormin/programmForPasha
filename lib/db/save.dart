import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';


class Save {
  late String distance;
  late String name;
  late String position;
  late String date;

  Future create_connection() async {
    var settings = ConnectionSettings(
        host: '92.63.105.252',
        port: 3306,
        user: 'resolweru',
        db: 'my_db',
        password: 'Qdxk7pdpd_');

    var conn = await MySqlConnection.connect(settings);

    print("connection_type: $conn.runtimeType");
  }

  void connection_to_db_open () {
    print("connection open try");
    create_connection();
    print("connection open success");
  }

  void connection_to_db_close() {
    print("connection close");
  }

  void save_to_training_db({name, distance, date,}) {
    connection_to_db_open();
    print(Text('Save to training database. '
        'name: $name, distance: $distance, date: $date, type: training, position: n/a'));
    connection_to_db_close();
  }

  void save_to_reward_db({name, distance, date, position}) {
    connection_to_db_open();
    print(Text('Save to reward database. '
        'name: $name, distance: $distance, date: $date, type: reward, position: $position'));
    connection_to_db_close();
  }

  Save.training({name, distance, date,}) {
    save_to_training_db(name: name, distance: distance, date: date,);
  }

  Save.reward({name, distance, date, position,}){
    save_to_training_db(
      name: name,
      distance: distance,
      date: date,
    );
    save_to_reward_db(
      name: name,
      distance: distance,
      position: position,
      date: date,
    );
  }
}
