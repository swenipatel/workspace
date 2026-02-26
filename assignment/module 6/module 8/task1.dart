import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = "";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadName();
  }

  loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("username") ?? "";
    });
  }

  saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", controller.text);
    loadName();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Shared Pref Example")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: "Enter Name"),
              ),
              ElevatedButton(
                onPressed: saveName,
                child: Text("Save"),
              ),
              SizedBox(height: 20),
              Text("Saved Name: $name"),
            ],
          ),
        ),
      ),
    );
  }
}