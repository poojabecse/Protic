import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelloScreen(),
    );
  }
}

class HelloScreen extends StatefulWidget {
  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  String message = "Press the button";

  Future<void> fetchMessage() async {
    final url = Uri.parse('http://localhost:3000/send-name');



    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        message = data['message'];
      });
    } else {
      setState(() {
        message = "Failed to fetch";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Backend Hello")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchMessage,
              child: Text("Get Hello from Backend"),
            ),
          ],
        ),
      ),
    );
  }
}
