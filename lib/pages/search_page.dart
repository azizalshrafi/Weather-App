import 'package:flutter/material.dart';
import 'package:weather_app_api/models/weather_model.dart';
import 'package:weather_app_api/providers/weather_provider.dart';
import 'package:weather_app_api/services/weather_service.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);

              // weatherData = weather;
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              // updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('Search'),
              suffixIcon: IconButton(
                onPressed: () async {
                  WeatherService service = WeatherService();
                  WeatherModel weather =
                      await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                icon: Icon(Icons.search),
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}

// WeatherModel? weatherData;
