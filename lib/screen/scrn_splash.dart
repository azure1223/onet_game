import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onet_mon/painters/painter_background.dart';
import 'package:onet_mon/screen/scrn_main.dart';
import 'package:onet_mon/utils/scale_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();

    startAnimation();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return MainSreen();
        },
      ), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScaleConfig().init(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          size: MediaQuery.of(context).size,
          painter: BackgroundPainter(),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 2000),
                        opacity: animate ? 1 : 0,
                        child: Hero(
                          tag: "DemoTag",
                          child: SvgPicture.asset('assets/background/bg01.svg'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
