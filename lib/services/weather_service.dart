import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_api/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=95ed768fee43478bb11110844221008&q=Jerusalem&days=1&aqi=no&alerts=no');

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    // print(data);

    // String date = data['location']['localtime'];
    // String temp = data['forecast']['forecastday'][0]['day']['avgtemp_c'];

    //we create model to best code here
    //in model file..

    /* var jsonData = data['forecast']['forecastday'][0]['day'];
    WeatherModel weather = WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);

    return weather;
    */
    // we do that in model file this is a cleen code ..
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
