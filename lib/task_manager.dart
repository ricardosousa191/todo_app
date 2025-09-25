import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';

/// ---------------------
/// Task Manager (persistência)
/// ---------------------
class TaskManager {
  static const _key = 'tasks';

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = prefs.getStringList(_key) ?? [];
    return taskStrings.map((str) => Task.fromMap(jsonDecode(str))).toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = tasks.map((t) => jsonEncode(t.toMap())).toList();
    await prefs.setStringList(_key, taskStrings);
  }
}
