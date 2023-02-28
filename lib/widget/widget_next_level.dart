import 'package:flutter/material.dart';
import 'package:onet_mon/classes/constants.dart';
import 'package:onet_mon/classes/game_state.dart';
import 'package:onet_mon/menu/custom_button.dart';
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
              child: CustomMenu(
                title: 'Victory',
                child: Column(
                  children: [
                    Text(
                      'Level : ${GameData.level}',
                      style: TextStyle(
                        color: TEXT_COLOR,
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Score : ${GameData.score}',
                      style: TextStyle(
                        color: TEXT_COLOR,
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AnarButton(
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      onTap: widget.nexLevelBtn,
                      child: Text(
                        'Next LEVEL',
                        style: TextStyle(
                          color: TEXT_COLOR,
                          fontFamily: 'Shades',
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                  ],
                ),
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
