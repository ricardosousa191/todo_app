import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';
import 'task_manager.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TodoApp()));
}



class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TaskManager manager = TaskManager();
  List<Task> tasks = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final loaded = await manager.loadTasks();
    setState(() => tasks = loaded);
  }

  Future<void> _addTask(String title) async {
    if (title.trim().isEmpty) return;
    setState(() => tasks.add(Task(DateTime.now().toString(), title: title)));
    await manager.saveTasks(tasks);
    _controller.clear();
  }

  Future<void> _toggleTask(int index) async {
    setState(() => tasks[index].isDone = !tasks[index].isDone);
    await manager.saveTasks(tasks);
  }

  Future<void> _deleteTask(int index) async {
    setState(() => tasks.removeAt(index));
    await manager.saveTasks(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App - Class 6')),
      body: Column(
        children: [
          // Input + botão
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Add a task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addTask(_controller.text),
                ),
              ],
            ),
          ),
          // Lista de tarefas
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => ListTile(
                leading: Checkbox(
                  value: tasks[index].isDone,
                  onChanged: (_) => _toggleTask(index),
                ),
                title: Text(
                  tasks[index].title,
                  style: TextStyle(
                    decoration: tasks[index].isDone
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteTask(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
