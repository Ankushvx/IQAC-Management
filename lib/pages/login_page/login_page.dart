import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'login_Content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget topWidget(double screenWidget) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      //  child: SingleChildScrollView(
      //  physics: BouncingScrollPhysics(),
      child: Container(
        width: 1.2 * screenWidget,
        height: 1.2 * screenWidget,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              Color(0x007CBFCF),
              Color(0xB316BFC4),
            ],
          ),
        ),
        //  ),
      ),
    );
  }

  Widget bottomWidget(double screenWidget) {
    return Container(
      width: 1.5 * screenWidget,
      height: 1.5 * screenWidget,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment(0.6, -1.1),
              end: Alignment(0.7, 0.8),
              colors: [
                Color(0xBD4BE8CC),
                Color(0x005CDBCF),
              ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final screenSizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child: topWidget(screenSize),
          ),
          Positioned(
            bottom: -160,
            left: -40,
            child: bottomWidget(screenSize),
          ),
          CenterWidget(size: screenSizes),
          const LoginContent(),
        ],
      ),
    );
  }
}

class CenterWidget extends StatelessWidget {
  final Size size;
  const CenterWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final width = size.width;
    final height = size.height;
    final path = Path();
    path.moveTo(0, 0.17 * height);
    path.cubicTo(
      0.23 * width,
      0.12 * height,
      0.36 * width,
      0.13 * height,
      0.48 * width,
      0.14 * height,
    );
    path.cubicTo(
      0.6 * width,
      0.15 * height,
      0.91 * width,
      0.23 * height,
      0.94 * width,
      0.34 * height,
    );
    path.cubicTo(
      0.97 * width,
      0.46 * height,
      0.74 * width,
      0.46 * height,
      0.66 * width,
      0.56 * height,
    );
    path.cubicTo(
      0.58 * width,
      0.66 * height,
      0.72 * width,
      0.73 * height,
      0.68 * width,
      0.81 * height,
    );
    path.cubicTo(
      0.63 * width,
      0.89 * height,
      0.45 * width,
      0.97 * height,
      0.3 * width,
      height,
    );
    path.lineTo(0, height);
    path.close;

    return Stack(
      children: [
        CustomPaint(
          painter: CenterWidgetPainter(path: path),
        ),
        ClipPath(
          clipper: CenterWidgetClipper(path: path),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1, -0.6),
                  end: Alignment(-1, 0.8),
                  colors: [
                    Color(0x803DE896),
                    Color(0x4D76E3AE),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CenterWidgetClipper extends CustomClipper<Path> {
  final Path path;
  const CenterWidgetClipper({required this.path});

  @override
  @override
  Path getClip(Size size) {
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CenterWidgetPainter extends CustomPainter {
  final Path path;
  const CenterWidgetPainter({required this.path});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..imageFilter = ImageFilter.blur(sigmaX: 10, sigmaY: 10)
      ..color = Colors.black26;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CenterWidgetPainter oldDelegate) => false;
}
