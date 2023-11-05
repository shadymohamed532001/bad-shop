import 'package:flutter/material.dart';

class Container1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3075571, size.height * -0.0018083);
    path_0.quadraticBezierTo(size.width * 0.4024000, size.height * 0.0089667,
        size.width * 0.4506143, size.height * 0.0557833);
    path_0.cubicTo(
        size.width * 0.4740714,
        size.height * 0.0791667,
        size.width * 0.5155286,
        size.height * 0.1401417,
        size.width * 0.5266286,
        size.height * 0.1835000);
    path_0.quadraticBezierTo(size.width * 0.5393571, size.height * 0.2236250,
        size.width * 0.5513429, size.height * 0.3307500);
    path_0.quadraticBezierTo(size.width * 0.5548143, size.height * 0.4177333,
        size.width * 0.5600857, size.height * 0.5211750);
    path_0.cubicTo(
        size.width * 0.5615000,
        size.height * 0.5532750,
        size.width * 0.5810000,
        size.height * 0.6130167,
        size.width * 0.6732000,
        size.height * 0.6345000);
    path_0.quadraticBezierTo(size.width * 0.7704286, size.height * 0.6469833,
        size.width * 0.9389857, size.height * 0.5567750);
    path_0.lineTo(size.width * 1.0381714, size.height * 0.4891417);
    path_0.lineTo(size.width * 1.0001286, size.height * -0.0004833);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

class Container2Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0013000, size.height * -0.0006929);
    path_0.lineTo(size.width * 0.0002143, size.height * 0.3218357);
    path_0.quadraticBezierTo(size.width * 0.1090143, size.height * 0.2864000,
        size.width * 0.1649286, size.height * 0.2755357);
    path_0.cubicTo(
        size.width * 0.2989286,
        size.height * 0.2473571,
        size.width * 0.3283286,
        size.height * 0.2459071,
        size.width * 0.4287571,
        size.height * 0.2515071);
    path_0.cubicTo(
        size.width * 0.5050571,
        size.height * 0.2553500,
        size.width * 0.5831286,
        size.height * 0.2811214,
        size.width * 0.7663143,
        size.height * 0.3055643);
    path_0.quadraticBezierTo(size.width * 0.8980143, size.height * 0.3191357,
        size.width * 0.9986143, size.height * 0.3198429);
    path_0.lineTo(size.width * 1.0007714, size.height * -0.0011143);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

class Container3Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.0008286, size.height * -0.0013429);
    path_0.lineTo(size.width, size.height * 0.3921429);
    path_0.quadraticBezierTo(size.width * 0.8989857, size.height * 0.3813429,
        size.width * 0.8571429, size.height * 0.3571429);
    path_0.cubicTo(
        size.width * 0.7842714,
        size.height * 0.3224214,
        size.width * 0.7050000,
        size.height * 0.2505357,
        size.width * 0.6542857,
        size.height * 0.2150000);
    path_0.cubicTo(
        size.width * 0.5881286,
        size.height * 0.1736143,
        size.width * 0.5338571,
        size.height * 0.1663929,
        size.width * 0.4662429,
        size.height * 0.1682929);
    path_0.cubicTo(
        size.width * 0.3833000,
        size.height * 0.1688643,
        size.width * 0.3267286,
        size.height * 0.2118000,
        size.width * 0.2871429,
        size.height * 0.2442857);
    path_0.quadraticBezierTo(size.width * 0.2488714, size.height * 0.2775643,
        size.width * 0.2013000, size.height * 0.3674786);
    path_0.quadraticBezierTo(size.width * 0.1414143, size.height * 0.4802714,
        size.width * 0.1227857, size.height * 0.4933571);
    path_0.quadraticBezierTo(size.width * 0.0925857, size.height * 0.5254143,
        size.width * 0.0009714, size.height * 0.5342143);
    path_0.lineTo(size.width * -0.0047143, size.height * -0.0002214);
    path_0.lineTo(size.width * -0.0052143, size.height * -0.0010786);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

class ContainerHomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0141857, size.height * -0.0059857);
    path_0.lineTo(size.width * 0.0002143, size.height * 0.5359214);
    path_0.quadraticBezierTo(size.width * 0.0225571, size.height * 0.5014714,
        size.width * 0.0749429, size.height * 0.4995643);
    path_0.quadraticBezierTo(size.width * 0.1895000, size.height * 0.4991429,
        size.width * 0.5007000, size.height * 0.4997714);
    path_0.quadraticBezierTo(size.width * 0.8541571, size.height * 0.4989357,
        size.width * 0.9292286, size.height * 0.5007857);
    path_0.quadraticBezierTo(size.width * 0.9812857, size.height * 0.5039643,
        size.width * 1.0007143, size.height * 0.5363714);
    path_0.lineTo(size.width * 1.0025857, size.height * -0.0008286);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
