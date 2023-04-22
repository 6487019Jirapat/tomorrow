import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/weather_item.dart';
import 'package:weather_app/constants.dart';

class Forcast_Page extends StatefulWidget {
  final dailyForecastWeather;

  const Forcast_Page({Key? key, this.dailyForecastWeather}) : super(key: key);

  @override
  State<Forcast_Page> createState() => _Forcast_PageState();
}

class _Forcast_PageState extends State<Forcast_Page> {
  final Constants _constants = Constants();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var weatherData = widget.dailyForecastWeather;

    //function to get weather
    Map getForecastWeather(int index) {
      int maxWindSpeed = weatherData[index]["day"]["maxwind_kph"].toInt();
      int avgHumidity = weatherData[index]["day"]["avghumidity"].toInt();
      int chanceOfRain =
          weatherData[index]["day"]["daily_chance_of_rain"].toInt();

      var parsedDate = DateTime.parse(weatherData[index]["date"]);
      var forecastDate = DateFormat('EEEE, d MMMM').format(parsedDate);

      String weatherName = weatherData[index]["day"]["condition"]["text"];
      String weatherIcon =
          weatherName.replaceAll(' ', '').toLowerCase() + ".png";

      int minTemperature = weatherData[index]["day"]["mintemp_c"].toInt();
      int maxTemperature = weatherData[index]["day"]["maxtemp_c"].toInt();

      var forecastData = {
        'maxWindSpeed': maxWindSpeed,
        'avgHumidity': avgHumidity,
        'chanceOfRain': chanceOfRain,
        'forecastDate': forecastDate,
        'weatherName': weatherName,
        'weatherIcon': weatherIcon,
        'minTemperature': minTemperature,
        'maxTemperature': maxTemperature
      };
      return forecastData;
    }

    return Scaffold(
      backgroundColor: _constants.primaryColor,
      appBar: AppBar(
        title: const Text('Forecasts'),
        centerTitle: true,
        backgroundColor: _constants.primaryColor,
        elevation: 0.0,
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            for (var i = 0; i < 7; i++) ...[
              Card(
                elevation: 3.0,
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            getForecastWeather(i)["forecastDate"],
                            style: const TextStyle(
                              color: Color(0xff6696f5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    getForecastWeather(i)["minTemperature"]
                                        .toString(),
                                    style: TextStyle(
                                      color: _constants.greyColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '°',
                                    style: TextStyle(
                                        color: _constants.greyColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        fontFeatures: const [
                                          FontFeature.enable('sups'),
                                        ]),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    getForecastWeather(i)["maxTemperature"]
                                        .toString(),
                                    style: TextStyle(
                                      color: _constants.blackColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '°',
                                    style: TextStyle(
                                        color: _constants.blackColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        fontFeatures: const [
                                          FontFeature.enable('sups'),
                                        ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/' +
                                    getForecastWeather(i)["weatherIcon"],
                                width: 30,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                getForecastWeather(i)["weatherName"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                getForecastWeather(i)["chanceOfRain"]
                                        .toString() +
                                    "%",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'assets/lightrain.png',
                                width: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
