import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'task.dart';

extension TaskSharedPreferences on SharedPreferences {
  Future<bool> storeTask(Task task) async {
    final taskString = jsonEncode(task.toMap());
    final taskList = getStringList('tasks') ?? [];
    taskList.add(taskString);
    return await setStringList('tasks', taskList);
  }

  Future<bool> removeTask (Task task) async {
    final taskList = getTasks();
     taskList.removeWhere((t)=> t.id == task.id);
     final taskStringList = taskList.map((t) => jsonEncode(t.toMap())).toList();
     return setStringList('tasks', taskStringList);
      }
  


  List<Task> getTasks() {
    final taskStrings = getStringList('tasks') ?? [];
    return taskStrings
    .map((taskStr) => Task.fromMap(jsonDecode(taskStr))).toList();
  }
}