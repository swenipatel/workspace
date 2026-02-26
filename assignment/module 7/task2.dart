import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewsScreen(),
  ));
}

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List articles = [];
  bool isLoading = true;

  Future<void> fetchNews() async {
    const apiKey = "YOUR_API_KEY";
    final url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        articles = data['articles'];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Feed App")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: article['urlToImage'] != null
                        ? Image.network(
                            article['urlToImage'],
                            width: 60,
                            fit: BoxFit.cover,
                          )
                        : null,
                    title: Text(article['title'] ?? "No Title"),
                    subtitle: Text(article['description'] ?? "No Description"),
                  ),
                );
              },
            ),
    );
  }
}