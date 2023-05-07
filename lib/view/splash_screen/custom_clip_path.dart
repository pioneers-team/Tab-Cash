


import 'package:flutter/cupertino.dart';

class myClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
     final path = Path();
    path.moveTo(0, 200);
    path.lineTo(0, h);
   path.lineTo(w, h);
   path.lineTo(w, 0);
    //path.quadraticBezierTo(w / 2, h ,w,h-100);
    path.quadraticBezierTo(size.width,size.height/3,size.width*0.5,size.height*0.42);
    path.close();








    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.2916667,size.height*0.5131429);
    path0.lineTo(size.width*0.2915000,size.height*0.6411429);
    path0.lineTo(size.width*0.5316667,size.height*0.6402857);
    path0.lineTo(size.width*0.5316667,size.height*0.3674286);
    path0.quadraticBezierTo(size.width*0.4705000,size.height*0.4582143,size.width*0.4210000,size.height*0.4945714);
    path0.quadraticBezierTo(size.width*0.3661667,size.height*0.5257857,size.width*0.2916667,size.height*0.5131429);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
