import 'package:flutter/material.dart';
import 'package:onet_mon/menu/stand_menu.dart';
import 'package:onet_mon/utils/scale_config.dart';

class NextLevelWidget extends StatefulWidget {
  Function nexLevelBtn;
  NextLevelWidget({this.nexLevelBtn});
  @override
  State<NextLevelWidget> createState() => _NextLevelWidgetState();
}

class _NextLevelWidgetState extends State<NextLevelWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: StandMenu(
                title: 'victory',
                items: [
                  StandMenuItem(title: 'congrat', onTap: () {}),
                  StandMenuItem(title: 'next', onTap: widget.nexLevelBtn),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
