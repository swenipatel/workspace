import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final todoProvider =
StateNotifierProvider<TodoNotifier, List<String>>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<String>> {
  TodoNotifier() : super([]);

  void addTask(String task) {
    state = [...state, task];
  }

  void removeTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends ConsumerWidget {
  TodoScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Todo"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref.read(todoProvider.notifier).addTask(controller.text);
                controller.clear();
              }
            },
            child: const Text("Add Task"),import 'package:flutter/material.dart';

    void main() {
    runApp(MaterialApp(home: LoadingScreen()));
    }

    class LoadingScreen extends StatefulWidget {
    @override
    State<LoadingScreen> createState() => _LoadingScreenState();
    }

    class _LoadingScreenState extends State<LoadingScreen> {
    bool isLoading = true;

    @override
    void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
    setState(() {
    isLoading = false;
    });
    });
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Loading Animation")),
    body: Center(
    child: isLoading
    ? CircularProgressIndicator()
        : Text(
    "Data Loaded Successfully!",
    style: TextStyle(fontSize: 20),
    ),
    ),
    );
    }
    }
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(todoProvider.notifier).removeTask(index);
                    },
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