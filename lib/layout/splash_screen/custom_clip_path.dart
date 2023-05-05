
import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path>{

    @override
    Path getClip(Size size) {
      Path path = Path();
      final double _xScaling = size.width / 1186;
      final double _yScaling = size.height / 1097;
      path.lineTo(-212.5 * _xScaling,-825.5 * _yScaling);
      path.cubicTo(-212.5 * _xScaling,-525.093 * _yScaling,-475.943 * _xScaling,-281.5 * _yScaling,-801 * _xScaling,-281.5 * _yScaling,);
      path.cubicTo(-1126.057 * _xScaling,-281.5 * _yScaling,-1389.5 * _xScaling,-525.093 * _yScaling,-1389.5 * _xScaling,-825.5 * _yScaling,);
      path.cubicTo(-1389.5 * _xScaling,-1125.907 * _yScaling,-1126.057 * _xScaling,-1369.5 * _yScaling,-801 * _xScaling,-1369.5 * _yScaling,);
      path.cubicTo(-475.943 * _xScaling,-1369.5 * _yScaling,-212.5 * _xScaling,-1125.907 * _yScaling,-212.5 * _xScaling,-825.5 * _yScaling,);
      return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}