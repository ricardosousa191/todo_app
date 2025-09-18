import 'package:flutter/material.dart';

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
  int _counter = 0;
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  TextEditingController controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(60.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 30.0,
            children: <Widget>[
              Text(
                'TODO APP',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              Row(
                spacing: 20.0,
                children: [
                  SizedBox(
                    width: 180,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter Something',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      controller.text = items.add();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      foregroundColor: Colors.black, // Text color
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
                itemCount: items.length,
                itemBuilder: (context, index) => Text(items[index]),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
