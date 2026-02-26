import 'package:flutter/material.dart';

void main() {
  runApp(InfiniteListApp());
}

class InfiniteListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scrolling List', debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfiniteListPage(),
    );
  }
}

class InfiniteListPage extends StatefulWidget {
  @override
  _InfiniteListPageState createState() => _InfiniteListPageState();
}

class _InfiniteListPageState extends State<InfiniteListPage> {
  final List<int> _items = List.generate(20, (index) => index); // Initial data
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Listen to scroll events
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading) {
        _loadMoreData();
      }
    });
  }

  Future<void> _loadMoreData() async {
    setState(() => _isLoading = true);

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Add more items
    setState(() {
      final nextItems = List.generate(20, (index) => _items.length + index);
      _items.addAll(nextItems);
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling List'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1, // Extra item for loading indicator
        itemBuilder: (context, index) {
          if (index == _items.length) {
            // Show loading indicator at the bottom
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('No more items'),
              ),
            );
          }

          return ListTile(
            leading: CircleAvatar(child: Text('${_items[index]}')),
            title: Text('Item ${_items[index]}'),
          );
        },
      ),
    );
  }
}
