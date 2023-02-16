import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onet_mon/menu/stand_menu.dart';
import 'package:onet_mon/utils/scale_config.dart';

class MenuWidget extends StatefulWidget {
  Function playBtnFuc;
  MenuWidget({@required this.playBtnFuc, Key key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SvgPicture.asset('assets/background/bg01.svg'),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: StandMenu(
                title: 'menu',
                items: [
                  StandMenuItem(title: 'play', onTap: widget.playBtnFuc),
                  StandMenuItem(title: 'option', onTap: () {}),
                  StandMenuItem(
                      title: 'exit',
                      onTap: () {
                        SystemNavigator.pop();

                        exit(0);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
