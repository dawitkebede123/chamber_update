// import 'package:flutter/material.dart';

// class MySlider extends StatefulWidget {
//   @override
//   _MySliderState createState() => _MySliderState();
// }

// class _MySliderState extends State<MySlider> with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation<double> _animation1;
//   Animation<double> _animation2;
//   Animation<double> _animation3;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
//     _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//     _animation2 = Tween<double>(begin: 0.5, end: 0.0).animate(_controller);
//     _animation3 = Tween<double>(begin: 1.0, end: 0.5).animate(_controller);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Slider(
//       value: _controller.value,
//       onChanged: (value) => _controller.value = value,
//       child: Stack(
//         children: [
//           AnimatedBuilder(
//             animation: _animation1,
//             builder: (context, child) => Opacity(opacity: _animation1.value, child: child),
//             child: Container(color: Colors.red),
//           ),
//           AnimatedBuilder(
//             animation: _animation2,
//             builder: (context, child) => Opacity(opacity: _animation2.value, child: child),
//             child: Container(color: Colors.green),
//           ),
//           AnimatedBuilder(
//             animation: _animation3,
//             builder: (context, child) => Opacity(opacity: _animation3.value, child: child),
//             child: Container(color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
// }
