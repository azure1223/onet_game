import 'package:flutter/material.dart';
import 'package:onet_mon/classes/class_game.dart';
import 'package:onet_mon/screen/scrn_main.dart';
import 'package:provider/provider.dart';
import 'package:flame/flame.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameSettings(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainSreen(),
    );
  }
}
