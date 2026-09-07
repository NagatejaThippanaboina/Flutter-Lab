import 'package:flutter/material.dart';

void main() {
  runApp(const MyAnimationApp());
}

class MyAnimationApp extends StatelessWidget {
  const MyAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  bool rotated = false;
  bool enlarged = false;
  bool hidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: rotated ? 0.25 : 0,
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    rotated = !rotated;
                  });
                },
                child: box('ROTATE', Colors.indigo),
              ),
            ),
            const SizedBox(height: 30),
            AnimatedScale(
              scale: enlarged ? 1.4 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    enlarged = !enlarged;
                  });
                },
                child: box('SCALE', Colors.green),
              ),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: hidden ? 0.2 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    hidden = !hidden;
                  });
                },
                child: box('FADE', Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget box(String title, Color color) {
    return Container(
      width: 140,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
