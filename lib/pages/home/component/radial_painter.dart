import 'package:flutter/material.dart';

class RadialGrade extends StatefulWidget {
  @override
  _RadialGradeState createState() => _RadialGradeState();
}

class _RadialGradeState extends State<RadialGrade> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: 100,
        height: 150,
      ),
      painter: RadialPainter(),
    );
  }
}


class RadialPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.grey[100]
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0;

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


