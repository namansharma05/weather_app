import 'package:flutter/material.dart';
import 'package:weather_app/api.dart';
import 'package:weather_app/models/weatherApiModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchedLocation = TextEditingController();

  void getWeatherReport(String location) async {
    WeatherModel response = await WeatherApi().getCurrentWeather(location);
    // print(response.runtimeType);
    final data = response.toJson();

    print(data['location']['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 66, 66),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 66, 66),
      body: Column(
        children: [
          Container(
            width: 353,
            height: 50,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: const Color.fromARGB(255, 255, 139, 139),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(63, 0, 0, 0),
                    blurRadius: 10,
                    spreadRadius: 6,
                    offset: Offset(0, 10),
                  ),
                ]),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: searchedLocation,
                      onSubmitted: (value) {
                        getWeatherReport(searchedLocation.text);
                      },
                      autocorrect: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Location...',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  margin: const EdgeInsets.only(right: 10),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Search Location to see Weather Report',
          ),
        ],
      ),
    );
  }
}
