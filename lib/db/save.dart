import 'package:web_app/pages/addRewards.dart';
import 'package:web_app/api/RESTFull.dart';


class Save {
  //Save to training DB
  Save.training({name, distance, date, type,}) {
    //Send request to save data in training DB
    API_request.send_api_request(
      name: name,
      date: date,
      distance: distance,
      type: type,
    );
  }

  //Save to reward DB
  Save.reward({name, date, position, type,}){
    //Send request to save data in training DB
    API_request.send_api_request(
      name: name,
      date: date,
      position: position,
      type: type,
    );
    //Send request to save data in reward DB
    API_request.send_api_request(
      name: name,
      date: date,
      type: type,
    );
  }
}
