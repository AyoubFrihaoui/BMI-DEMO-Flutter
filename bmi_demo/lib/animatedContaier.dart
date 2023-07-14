import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerr extends StatefulWidget {
  const AnimatedContainerr({super.key});

  @override
  State<AnimatedContainerr> createState() => _AnimatedContainerrState();
}

class _AnimatedContainerrState extends State<AnimatedContainerr> {
  double width = 20;
  double height = 20;
  Color color = Color.fromARGB(255, 133, 63, 63);
  BorderRadius borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow_rounded),
          onPressed: () {
            setState(() {
              Random random = Random();
              width = random.nextInt(500).toDouble();
              height = random.nextInt(500).toDouble();
              color = Color.fromARGB(random.nextInt(255), random.nextInt(255),
                  random.nextInt(255), 1);
              borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          }),
      appBar: AppBar(title: Text('AnimatedContainer')),
      body: Center(
        child: Stack(children: [
          Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
          ),
          AnimatedAlign(
            alignment: Alignment(1, 0.5),
            duration: Duration(milliseconds: 100),
            child: AnimatedPadding(
              duration: Duration(seconds: 1),
              padding: EdgeInsets.all(height),
              child: AnimatedContainer(
                curve: Curves.easeInCirc,
                duration: const Duration(milliseconds: 1000),
                width: width,
                height: height,
                decoration:
                    BoxDecoration(borderRadius: borderRadius, color: color),
              ),
            ),
          ),
          Logo(),
        ]),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Logo extends StatefulWidget {
  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..repeat();
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation!,
      child: Icon(
        Icons.front_hand,
        color: Colors.white,
        size: 200,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
