import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteHome(),
    );
  }
}

class QuoteHome extends StatefulWidget {
  @override
  _QuoteHomeState createState() => _QuoteHomeState();
}

class _QuoteHomeState extends State<QuoteHome> {
  final List<Map<String, String>> quotes = [
    {"text": "Believe in yourself", "author": "Unknown"},
    {"text": "Stay positive, work hard", "author": "Unknown"},
    {"text": "Never give up", "author": "Unknown"},
    {"text": "Dream big and dare to fail", "author": "Norman Vaughan"},
    {"text": "Success is not final", "author": "Winston Churchill"},
  ];

  int index = 0;

  void generateQuote() {
    final random = Random();
    setState(() {
      index = random.nextInt(quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote Generator"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"${quotes[index]["text"]}"',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                "- ${quotes[index]["author"]}",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: generateQuote,
                child: Text("New Quote"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
