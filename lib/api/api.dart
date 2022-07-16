import 'package:http/http.dart' as http;


class API {
  API.Save({DB_NAME, NAME, DISTANCE, POSITION, date}) {
    String api_request = "http://92.63.105.252:5000/save/?"
        "db_name=training&"
        "name=$NAME&"
        "distance=$DISTANCE&"
        "date=$date";
    if (DB_NAME == 'training') {
      http.get(api_request).then((response) {
        print(response.statusCode);
        print(response.body);
      }).catchError((error){
        print("print: $error");
      });
    }
    else if (DB_NAME == "reward") {
      String api_request = "http://92.63.105.252:5000/save/?"
          "db_name=reward&"
          "name=$NAME&"
          "position=$POSITION&"
          "date=$date";
      http.get(api_request).then((response){
        print(response.statusCode);
        print(response.body);
      }).catchError((error){
        print("print: $error");
      });
    }
  }
}
