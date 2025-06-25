import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cnt = 0;
  final List<String> emotionScale = [
    '😢', // very sad
    '😟', // worried
    '😐', // neutral
    '🙂', // slightly smiling
    '😊', // smiling
    '😄', // grinning
    '😁', // beaming
    '😅', // awkward smile with sweat
    '😨', // fearful
    '😰', // anxious
    '😱', // screaming

    '💥', // explosion
  ];
  final List<Color> emotionColors = [
    Colors.blue.shade700, // 😢
    Colors.blue.shade200, // 😟
    Colors.grey, // 😐
    Colors.lightGreen.shade300, // 🙂
    Colors.green, // 😊
    Colors.greenAccent, // 😄
    Colors.yellow, // 😁
    Colors.orangeAccent, // 😅
    Colors.deepOrange, // 😨
    Colors.red.shade400, // 😰
    Colors.red, // 😱
    Colors.black, // 💥
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text(
          'Counter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 8,
        shadowColor: Colors.black.withAlpha((0.8 * 255).toInt()),
        backgroundColor: const Color(0xFF6A67FF),
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            cnt = (cnt + 1) % emotionScale.length;
          });
        },
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: emotionColors[cnt],
                  borderRadius: BorderRadius.circular(16 + cnt.toDouble() * 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.3 * 255).toInt()),
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Text(
                  emotionScale[cnt],
                  style: TextStyle(fontSize: 40 + cnt * 5),
                ),
              ),
              SizedBox(height: 12),
              Text(
                cnt.toString(),
                style: TextStyle(fontSize: 36, color: Color(0xFF6A67FF)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
