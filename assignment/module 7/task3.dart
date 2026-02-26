import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MovieSearchScreen(),
  ));
}

class MovieSearchScreen extends StatefulWidget {
  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List movies = [];
  bool isLoading = false;

  Future<void> searchMovie(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    const apiKey = "YOUR_API_KEY";
    final url =
        "https://www.omdbapi.com/?s=$query&apikey=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        movies = data['Search'] ?? [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Search App")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter movie name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => searchMovie(_controller.text),
                  child: Text("Search"),
                ),
              ],
            ),
          ),

          isLoading
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: movie['Poster'] != "N/A"
                              ? Image.network(
                                  movie['Poster'],
                                  width: 50,
                                  fit: BoxFit.cover,
                                )
                              : null,
                          title: Text(movie['Title'] ?? ""),
                          subtitle: Text(movie['Year'] ?? ""),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}