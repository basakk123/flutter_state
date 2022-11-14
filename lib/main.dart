import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num = 1;

  void increase() {
    setState(() {
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double screenSize = size * 0.8;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: AComponent(num)),
          Expanded(child: BComponent(increase)),
        ],
      ),
    );
  }
}

// 컨슈머 (소비자)
class AComponent extends StatelessWidget {
  final int num;
  const AComponent(this.num, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          Text("AComponent"),
          Expanded(
            child: Align(
              child: Text(
                "${num}",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// 서플라이어 (공급자)
class BComponent extends StatelessWidget {
  final Function increase;
  const BComponent(this.increase, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text("BComponent"),
          Expanded(
            child: Align(
              child: ElevatedButton(
                  onPressed: () {
                    increase();
                  },
                  child: Text(
                    "숫자증가",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
