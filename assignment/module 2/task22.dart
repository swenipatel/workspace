import 'package:flutter/material.dart';

void main() {
  runApp(ThreeScreenApp());
}

class ThreeScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Screen App', debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  final String message = "Hello from Home Screen!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Details screen and pass data
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: message,
                );
              },
              child: Text('Go to Details Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Settings screen
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Go to Settings Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

// Details Screen
class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Receive the data passed from HomeScreen
    final String message = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// Settings Screen
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
      ),
      body: Center(
        child: Text(
          'Settings go here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
