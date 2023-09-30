import 'package:flutter/material.dart';

class CustomPaintForLogin extends StatelessWidget {
  const CustomPaintForLogin({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
      painter: CurvePainter(),
      child: Container(
        height: MediaQuery.of(context).size.height*0.2,
      ),
    );
  }
}
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =  Paint()..color = Colors.white;
    // create a path
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.300,
        size.width * 0.5, size.height * 0.760);
    path.quadraticBezierTo(size.width * 0.75, size.height * 1.3, size.width * 1,
        size.height * 0.940);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}