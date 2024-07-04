import 'package:weather_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherApiModel.dart';

class WeatherApi {
  Future<WeatherModel> getCurrentWeather(String location) async {
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // print(response.body);
        return weatherModelFromJson(response.body.toString());
      } else {
        throw Exception("Failed to load Weather data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
