import 'package:flutter/material.dart';

class CustomClipShape extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final Path path  = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstBegPoint = Offset(size.width * 0.20, size.height - 55.0);

    path.quadraticBezierTo(
        firstBegPoint.dx,
        firstBegPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy
    );

    var secondEndPoint = Offset(size.width, size.height - 50);
    var secondBegPoint = Offset(size.width * .75, size.height - 10);

    path.quadraticBezierTo(
        secondBegPoint.dx,
        secondBegPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy
    );

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}