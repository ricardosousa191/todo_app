import 'package:flutter/material.dart';
import 'task.dart';
import 'tasktile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 183, 58, 85),
        ),
      ),
      home: const MyHomePage(title: 'TODO APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<Task> tasks = [];
  TextEditingController controller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 229, 252, 252),
        padding: EdgeInsets.all(60.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 30.0,
            children: <Widget>[
              Text(
                'TODO APP',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              Row(
                spacing: 20.0,
                children: [
                  SizedBox(
                    width: 180,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter the task',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tasks.add(Task(controller.text,false));
                      });
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 151, 220, 237), // Background color
                      foregroundColor: const Color.fromARGB(255, 49, 47, 47), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ), // Button padding
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ), // Text style
                    ),
                    child: Text('Add'),
                  ),
                ],
              ),
              Expanded(child: 
              ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => Tasktile(tasks[index]),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}