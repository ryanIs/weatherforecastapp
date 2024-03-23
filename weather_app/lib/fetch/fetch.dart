/**
 * fetch.dart
 * 
 * Fetches data from the tomorrow.io endpoint. Having this component isolated
 * allows us to expand on it in the future. We may add functions that perform
 * checks and tests on the incoming data and modify it as needed.
 * 
 * View the tomorrow.io free data fields:
 * @link https://docs.tomorrow.io/reference/data-layers-core
 * 
 * Uses pattern matching to convert the JSON:
 * @link https://dart.dev/language/patterns
 */

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../types/tomorrowData/tomorrowData.dart';

/**
 * FetchDataFromAPI
 * 
 * Class responsible for handling fetching of API data.
 */
class FetchDataFromAPI {

  ConfigData myConfigData = ConfigData();

  // fetchData is the primary function used to fetch the data from the API.
  // It builds the query based on our configuration variables.
  // The main weatherData object is created here by fetches the forecast 
  // data one time and building all components based on that data.
  Future<List<TomorrowData>> fetchData(String targetEndpoint) async {

    double lat = ConfigData.MAIN_LAT;
    double lon = ConfigData.MAIN_LON;
    String stateForAPIQuery = ConfigData.MAIN_STATE; 
    late String finalFetchString;

    // By lat-lon
    if(ConfigData.DATA_FETCH_METHOD == 'latlon' || ConfigData.DATA_FETCH_METHOD == 'coordinates') {
      finalFetchString = ('${ConfigData.API_BASE_URL}/${targetEndpoint}?location=${lat},${lon}&apikey=${ConfigData.API_KEY}');
    }

    // If you are rate-limited: (see jsonserver folder) - local:
    else if(ConfigData.DATA_FETCH_METHOD == 'local' || ConfigData.DATA_FETCH_METHOD == 'jsonserver') {
      finalFetchString = ('http://localhost:3000/customendpoint');
    }

    // By state
    else {
      finalFetchString = ('${ConfigData.API_BASE_URL}/${targetEndpoint}?location=${stateForAPIQuery}&apikey=${ConfigData.API_KEY}');
    }

    // Fetch data from tomorrow.io endpoint.
    // Use await keyword to wait until data is returned.
    // Then move forward.
    final response = await http.get(
      Uri.parse(finalFetchString)
    );
    
    // Check code and parse.
    // Return as JSON decoded Dart-ready TomorrowData object.
    if(response.statusCode == 200) {
      Map<String, dynamic> myData = json.decode(response.body);

      List<TomorrowData> myListTomorrowOfData = [];

      // Loop through the available days and generate a list of 
      // TomorrowData from the data.
      for(int myDay = 0; myDay < 6; myDay++) {
        Map<String, dynamic> myTargetDayData = myData['timelines']['daily'][myDay];
        
        // Add the latitude and longitude values on the fly, since they reside
        // in a different (JSON object) location.
        myTargetDayData['lat'] = myData['location']['lat'];
        myTargetDayData['lon'] = myData['location']['lon'];

        myListTomorrowOfData.add(
          TomorrowData.fromJSON(
            myTargetDayData
          )
        );

      }
      
      return myListTomorrowOfData;
    }

    // Failed to fetch data from API. Throw exception.
    else {
      print('Failed to fetch. Be sure that you have created/set your API key.');
      print('To set your API key. Open config.dart and set the API_KEY variable.');
      throw Exception('Failed to load Tomorrow Data.');
    }

  }

}
