import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finalproject_640710545/model.dart';
import 'package:finalproject_640710545/weatherShowpage.dart';
import 'package:flutter/material.dart';

class FristPage extends StatefulWidget {
  const FristPage({super.key});

  @override
  State<FristPage> createState() => _FristPageState();
}

class _FristPageState extends State<FristPage> {
  TextEditingController _searchController = TextEditingController();
  WeatherData? weatherData;
  var Advice = 'ใส่ชื่อเมืองที่ต้องการจะดูอุณหภูมิ';
  Color AdviceColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/lightBG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Climate App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  Advice,
                  style: TextStyle(fontSize: 20, color: AdviceColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'ใส่ชื่อเมือง',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        try {
                          var dio = Dio(
                              BaseOptions(responseType: ResponseType.plain));
                          var response = await dio.get(
                              'https://api.openweathermap.org/data/2.5/weather?appid=6f6ce093ce75806e06c41c165279eefa&units=metric&q=' +
                                  _searchController.text);
                          setState(() {
                            var data = jsonDecode(response.data.toString());
                            weatherData = WeatherData.fromJson(data);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WeatherPage(
                                        weatherData: weatherData!)));
                            Advice = 'ใส่ชื่อเมืองที่ต้องการจะดูอุณหภูมิ';
                            AdviceColor = Colors.black;
                          });
                        } catch (e) {
                          setState(() {
                            Advice = 'ชื่อเมืองไม่ถูกต้อง';
                            AdviceColor = Colors.red;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    var dio =
                        Dio(BaseOptions(responseType: ResponseType.plain));
                    var response = await dio.get(
                        'https://api.openweathermap.org/data/2.5/weather?appid=6f6ce093ce75806e06c41c165279eefa&units=metric&q=' +
                            _searchController.text);
                    setState(() {
                      var data = jsonDecode(response.data.toString());
                      weatherData = WeatherData.fromJson(data);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeatherPage(weatherData: weatherData!)));
                      Advice = 'ใส่ชื่อเมืองที่ต้องการจะดูอุณหภูมิ';
                      AdviceColor = Colors.black;
                    });
                  } catch (e) {
                    setState(() {
                      Advice = 'ชื่อเมืองไม่ถูกต้อง';
                      AdviceColor = Colors.red;
                    });
                  }
                },
                child: Text(
                  'ดูสภาพภูมิอากาศ',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              //Text('sss'),
            ],
          ),
        ),
      ),
    );
  }
}
