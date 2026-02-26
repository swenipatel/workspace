dbhelper....

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  static const String tableName = "tasks";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL
      )
    ''');
  }

  // Insert Task
  Future<int> insertTask(String title) async {
    final db = await database;
    return await db.insert(tableName, {'title': title});
  }

  // Get All Tasks (Latest First)
  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return await db.query(tableName, orderBy: "id DESC");
  }

  // Update Task
  Future<int> updateTask(int id, String title) async {
    final db = await database;
    return await db.update(
      tableName,
      {'title': title},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete One Task
  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete All Tasks
  Future<int> deleteAllTasks() async {
    final db = await database;
    return await db.delete(tableName);
  }

  // Close Database
  Future close() async {
    final db = await database;
    db.close();
  }
}


todolist....

import 'package:flutter/material.dart';
import 'dbhelper.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadTasks() async {
    final data = await DBHelper.instance.getTasks();
    setState(() {
      _tasks = data;
    });
  }

  Future<void> _addTask() async {
    if (_controller.text.trim().isEmpty) return;

    await DBHelper.instance.insertTask(_controller.text.trim());
    _controller.clear();
    _loadTasks();
  }

  Future<void> _updateTask(int id) async {
    if (_controller.text.trim().isEmpty) return;

    await DBHelper.instance.updateTask(id, _controller.text.trim());
    _controller.clear();
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Task"),
        content: const Text("Are you sure you want to delete this task?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await DBHelper.instance.deleteTask(id);
              Navigator.pop(context);
              _loadTasks();
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(int id, String title) {
    _controller.text = title;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Update Task'),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Edit task",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _controller.clear();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _updateTask(id);
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),

          // Task List
          Expanded(
            child: _tasks.isEmpty
                ? const Center(
                    child: Text(
                      "No Tasks Yet!",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: ListTile(
                          title: Text(task['title']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _showEditDialog(
                                  task['id'],
                                  task['title'],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    _deleteTask(task['id']),
                              ),
                            ],
                          ),
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