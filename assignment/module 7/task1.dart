import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WeatherScreen(),
  ));
}

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = "Rajkot";
  String temperature = "";
  String description = "";

  Future<void> fetchWeather() async {
    const apiKey = "YOUR_API_KEY";
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        temperature = data['main']['temp'].toString();
        description = data['weather'][0]['description'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Weather App")),
      body: Center(
        child: temperature.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(city, style: TextStyle(fontSize: 24)),
                  SizedBox(height: 10),
                  Text("$temperature °C",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(description, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: fetchWeather,
                    child: Text("Refresh"),
                  )
                ],
              ),
      ),
    );
  }
}