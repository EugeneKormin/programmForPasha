import 'package:web_app/settings/settings.dart';


class API_request {
  //Create and send API request to backend
  API_request.send_api_request({name, distance, date, type, position}) {
    // Create request
    String request =
        "92.63.105.252/api/v1/save?"
        "name=$name&distance=$distance&type=$type&position=$position";
    print("request: $request");
  }
}
