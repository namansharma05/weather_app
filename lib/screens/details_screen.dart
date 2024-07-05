import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.finalResponse,
    required this.getWeatherReport,
  });
  final Map<String, dynamic> finalResponse;
  final void Function(String location) getWeatherReport;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String cityName = '';
  String currTemp = '';
  String weatherCond = '';
  String humidity = '';
  String windSpeed = '';
  String imageUrl = '';
  String region = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cityName = widget.finalResponse['location']['name'];
    currTemp = widget.finalResponse['current']['temp_c'].toString();
    weatherCond = widget.finalResponse['current']['condition']['text'];
    humidity = widget.finalResponse['current']['humidity'].toString();
    windSpeed = widget.finalResponse['current']['wind_kph'].toString();
    imageUrl = 'https:' + widget.finalResponse['current']['condition']['icon'];
    region = widget.finalResponse['location']['region'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 66, 66),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 66, 66),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                cityName,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 200,
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Text(
                weatherCond,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                currTemp + ' °C',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        'Humidity',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        humidity + '%',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      child: Text('Wind Speed',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        windSpeed + ' kmph',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                widget.getWeatherReport('$cityName $region');
              },
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
