import 'package:flutter/material.dart';
import 'package:onet_mon/classes/constants.dart';
import 'package:onet_mon/classes/game_settings.dart';
import 'package:onet_mon/classes/shared_data.dart';
import 'package:onet_mon/menu/stand_menu.dart';
import 'package:onet_mon/utils/scale_config.dart';

class OptionWidget extends StatefulWidget {
  OptionWidget({Key key}) : super(key: key);

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  bool onMusic = false;
  bool onSound = false;
  void setStates() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomMenu(
              title: 'Option',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      titleWidget('Icon'),
                      if (gs != null)
                        ...List.generate(icon_list.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (gs.gameIcon != icon_list[index]) {
                                gs.gameIcon = icon_list[index];
                                setStates();
                                SharedSettings.saveSettings(gs);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: gs.gameIcon == icon_list[index] ? color_list[gs.bgColor] : Colors.transparent,
                                border: Border.all(
                                  width: 2,
                                  color: gs.gameIcon == icon_list[index] ? TEXT_COLOR : Colors.transparent,
                                ),
                              ),
                              child: Image.asset('assets/images/ic_${icon_list[index]}.png'),
                            ),
                          );
                        })
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      titleWidget('size'),
                      if (gs != null)
                        ...List.generate(resu_list.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (gs.gameResolution != resu_list[index]) {
                                gs.gameResolution = resu_list[index];
                                setStates();
                                SharedSettings.saveSettings(gs);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: gs.gameResolution == resu_list[index] ? TEXT_COLOR : Colors.transparent,
                                ),
                                // color: gs.gameResolution == resu_list[index] ? Colors.red : Colors.transparent,
                              ),
                              child: Text(
                                'X : ${resu_list[index]}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: gs.gameResolution == resu_list[index] ? TEXT_COLOR : WHITE_COLOR,
                                ),
                              ),
                            ),
                          );
                        })
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      titleWidget('time'),
                      if (gs != null)
                        ...List.generate(time_list.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (gs.gameTime != time_list[index]) {
                                gs.gameTime = time_list[index];
                                setStates();
                                SharedSettings.saveSettings(gs);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: gs.gameTime == time_list[index] ? TEXT_COLOR : Colors.transparent,
                                ),
                              ),
                              child: Text(
                                '${(time_list[index] / 60).round()} min',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: gs.gameTime == time_list[index] ? TEXT_COLOR : WHITE_COLOR,
                                ),
                              ),
                            ),
                          );
                        })
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      titleWidget('Color'),
                      if (gs != null)
                        ...List.generate(color_list.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (gs.bgColor != index) {
                                gs.bgColor = index;
                                setStates();
                                SharedSettings.saveSettings(gs);
                              }
                            },
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: color_list[index],
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  width: 2,
                                  color: gs.bgColor == index ? WHITE_COLOR : Colors.transparent,
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                color: gs.bgColor == index ? BACK_COLOR : Colors.transparent,
                              ),
                            ),
                          );
                        })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWidget(String text) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 80.w,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: TextStyle(
            color: TEXT_COLOR,
            fontFamily: 'Shades',
            fontSize: 30.sp,
          ),
        ),
      ),
    );
  }
}
