

class SQL {
  String __get_cursor(){
    var cursor = null;
    return cursor;
  }

  SQL.Save({DB_NAME, NAME, DISTANCE, POSITION, date}){
    if (DB_NAME == 'training') {
      print("db_name: $DB_NAME, name: $NAME, distance: $DISTANCE, date: $date");
    }
    else if (DB_NAME == "reward") {
      print("db_name: $DB_NAME, name: $NAME, position: $POSITION, date: $date");
    }
  }
}
