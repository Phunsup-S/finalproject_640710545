import 'package:finalproject_640710545/model.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  //const WeatherPage({super.key});
  final WeatherData weatherData;

  WeatherPage({required this.weatherData});

  IconData getWeatherIcon(int condition) {
    if (condition >= 200 && condition <= 232) {
      return Icons.flash_on;
    } else if (condition >= 300 && condition <= 321) {
      return Icons.grain;
    } else if (condition >= 500 && condition <= 531) {
      return Icons.beach_access;
    } else if (condition >= 600 && condition <= 622) {
      return Icons.ac_unit;
    } else if (condition >= 701 && condition <= 781) {
      return Icons.cloud;
    } else if (condition == 800) {
      return Icons.wb_sunny;
    } else if (condition >= 801 && condition <= 804) {
      return Icons.cloud_queue;
    } else {
      return Icons.cloud_off; // มีเมฆ
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/darkBG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.end, // ชิดขวา
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 100),
                  Icon(getWeatherIcon(weatherData.weather[0].id),
                      size: 100),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      weatherData.main.temp.toString() + " °C",
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ), // ชิดขวา
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      weatherData.name,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ), // ชิดขวา
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
