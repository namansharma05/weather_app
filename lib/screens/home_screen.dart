import 'package:flutter/material.dart';
import 'package:weather_app/api.dart';
import 'package:weather_app/models/weatherApiModel.dart';
import 'package:weather_app/screens/details_screen.dart';
import 'package:weather_app/screens/error_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchedLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool processStart = false;
    void _getWeatherReport(String location) async {
      try {
        WeatherModel response = await WeatherApi().getCurrentWeather(location);
        final data = response.toJson();

        if (Navigator.of(context).canPop()) {
          Navigator.pop(context);
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              finalResponse: data,
              getWeatherReport: (location) => _getWeatherReport(location),
            ),
          ),
        );
      } catch (e) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ErrorScreen(),
          ),
        );
      }

      searchedLocation.clear();
    }

    @override
    void dispose() {
      searchedLocation.dispose();
      super.dispose();
    }

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
            // margin: const EdgeInsets.only(left: 20),
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
                        _getWeatherReport(searchedLocation.text);
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
                InkWell(
                  onTap: () => _getWeatherReport(searchedLocation.text),
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 100,
            ),
            child: RichText(
              text: TextSpan(
                  text: 'Search Location to See ',
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Weather Report',
                      style: TextStyle(
                          fontSize: 44,
                          color: Colors.white54,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
