import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Color color = Color(0xff130130).withOpacity(1);
    Color color1 = Color(0xff391F5B).withOpacity(0.5);
    Color color2 = Color(0xff292987).withOpacity(0.5);
    Color color3 = Color(0xffF89200).withOpacity(0.5);
    Color color4 = Color(0xff361365).withOpacity(0.5);
    Paint paint = Paint()..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint..color = color);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.00005167682, size.height * 0.2562278);
    path_1.lineTo(size.width * 0.00005167682, size.height * 0.4048043);
    path_1.lineTo(size.width * 0.3947858, size.height * 0.4526690);
    path_1.lineTo(size.width * 0.1465669, size.height * 0.3080071);
    path_1.lineTo(size.width * 0.1584925, size.height * 0.3272242);
    path_1.lineTo(size.width * 0.00005167682, size.height * 0.2562278);
    path_1.close();
    path_1.moveTo(size.width * 0.9996386, size.height * 0.5814057);
    path_1.lineTo(size.width * 0.9996386, size.height * 0.4260676);
    path_1.lineTo(size.width * 0.5277233, size.height * 0.4783808);
    path_1.lineTo(size.width * 0.8293237, size.height * 0.5657473);
    path_1.lineTo(size.width * 0.8137326, size.height * 0.5487544);
    path_1.lineTo(size.width * 0.9996386, size.height * 0.5814057);
    path_1.close();
    canvas.drawPath(path_1, paint..color = color1);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.4038203, size.height * 0.5823843);
    path_2.lineTo(size.width * 0.00005167682, size.height * 0.7562278);
    path_2.lineTo(size.width * 0.00005167682, size.height);
    path_2.lineTo(size.width * 0.2319566, size.height * 0.7363879);
    path_2.lineTo(size.width * 0.2088281, size.height * 0.7363879);
    path_2.lineTo(size.width * 0.4038203, size.height * 0.5823843);
    path_2.close();
    path_2.moveTo(size.width * 0.4269489, size.height * 0.3852313);
    path_2.lineTo(size.width * 0.09813733, size.height * 0.001857429);
    path_2.lineTo(size.width * 0.005268405, size.height * 0.001857429);
    path_2.cubicTo(size.width * 0.003460630, size.height * 0.001857429, size.width * 0.001704491, size.height * 0.001207331, 0, 0);
    path_2.cubicTo(size.width * 0.00005165101, size.height * 0.0006501014, size.width * 0.00005165101, size.height * 0.001300205, size.width * 0.00005165101, size.height * 0.001950302);
    path_2.lineTo(size.width * 0.00005165101, size.height * 0.1446940);
    path_2.lineTo(size.width * 0.2320170, size.height * 0.2545614);
    path_2.lineTo(size.width * 0.2141461, size.height * 0.2216842);
    path_2.lineTo(size.width * 0.4269489, size.height * 0.3852313);
    path_2.close();
    path_2.moveTo(size.width * 0.9996386, size.height * 0.8543594);
    path_2.lineTo(size.width * 0.7612803, size.height * 0.7369217);
    path_2.lineTo(size.width * 0.7800207, size.height * 0.7699288);
    path_2.lineTo(size.width * 0.5599897, size.height * 0.6003559);
    path_2.lineTo(size.width * 0.9045947, size.height * 0.9939502);
    path_2.lineTo(size.width * 0.9996386, size.height * 0.9939502);
    path_2.lineTo(size.width * 0.9996386, size.height * 0.8543594);
    path_2.close();
    path_2.moveTo(size.width * 0.9996386, size.height * 0.2277580);
    path_2.lineTo(size.width * 0.9996386, 0);
    path_2.lineTo(size.width * 0.7806918, size.height * 0.2468861);
    path_2.lineTo(size.width * 0.8023748, size.height * 0.2468861);
    path_2.lineTo(size.width * 0.6196180, size.height * 0.3901246);
    path_2.lineTo(size.width * 0.9996386, size.height * 0.2277580);
    path_2.close();
    canvas.drawPath(path_2, paint..color = color2);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.3175013, 0);
    path_3.lineTo(size.width * 0.4563758, size.height * 0.3665480);
    path_3.lineTo(size.width * 0.3591585, 0);
    path_3.lineTo(size.width * 0.3175013, 0);
    path_3.close();
    path_3.moveTo(size.width * 0.9996386, size.height * 0.6498221);
    path_3.lineTo(size.width * 0.6382550, size.height * 0.5795374);
    path_3.lineTo(size.width * 0.9996386, size.height * 0.7363879);
    path_3.lineTo(size.width * 0.9996386, size.height * 0.6498221);
    path_3.close();
    path_3.moveTo(size.width * 0.3201342, size.height * 0.9939502);
    path_3.lineTo(size.width * 0.4229737, size.height * 0.6678826);
    path_3.lineTo(size.width * 0.2754259, size.height * 0.9939502);
    path_3.lineTo(size.width * 0.3201342, size.height * 0.9939502);
    path_3.close();
    canvas.drawPath(path_3, paint..color = color3);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.6614300, 0);
    path_4.lineTo(size.width * 0.5054208, size.height * 0.3896797);
    path_4.lineTo(size.width * 0.7170883, 0);
    path_4.lineTo(size.width * 0.6614300, 0);
    path_4.close();
    path_4.moveTo(size.width * 0.5553949, size.height * 0.9939502);
    path_4.lineTo(size.width * 0.5170367, size.height * 0.6004448);
    path_4.lineTo(size.width * 0.5215798, size.height * 0.9939502);
    path_4.lineTo(size.width * 0.5553949, size.height * 0.9939502);
    path_4.close();
    path_4.moveTo(size.width * 0.00005167682, size.height * 0.6255338);
    path_4.lineTo(size.width * 0.3800723, size.height * 0.5297153);
    path_4.lineTo(size.width * 0.01264848, size.height * 0.5285587);
    path_4.lineTo(size.width * 0.00005167682, size.height * 0.5799822);
    path_4.lineTo(size.width * 0.00005167682, size.height * 0.6255338);
    path_4.close();
    canvas.drawPath(path_4, paint..color = color4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
