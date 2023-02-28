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
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 2000)).then((value) => startMain());
    // setState(() {
    //   animate = false;
    // });
    // await Future.delayed(Duration(milliseconds: 500)).then((value) => startMain());
  }

  void startMain() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return MainSreen();
      },
    ), (route) => false);
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
                        duration: Duration(milliseconds: animate ? 2000 : 500),
                        opacity: animate ? 1 : 0,
                        child: SvgPicture.asset('assets/background/bg01.svg'),
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
