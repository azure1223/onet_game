import 'package:flutter/material.dart';
import 'package:onet_mon/classes/constants.dart';
import 'package:onet_mon/classes/game_state.dart';
import 'package:onet_mon/components/audio_component.dart';
import 'package:onet_mon/menu/custom_button.dart';
import 'package:onet_mon/menu/stand_menu.dart';

import 'package:onet_mon/utils/scale_config.dart';
import 'package:provider/provider.dart';

class PauseMenuWidget extends StatefulWidget {
  PauseMenuWidget({Key key}) : super(key: key);

  @override
  State<PauseMenuWidget> createState() => _PauseMenuWidgetState();
}

class _PauseMenuWidgetState extends State<PauseMenuWidget> {
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
                title: 'paused',
                child: Column(
                  children: [
                    AnarButton(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      onTap: () {
                        context.read<GameState>().setGameState(GameType.playing);
                      },
                      child: Text(
                        'Resume',
                        style: TextStyle(
                          color: TEXT_COLOR,
                          fontFamily: 'Shades',
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnarToggleButton(
                          isEnabled: GameData.soundEnabled,
                          padding: EdgeInsets.all(5.r),
                          onChange: (value) {
                            GameData.soundEnabled = value;
                          },
                          clickedChild: Icon(
                            Icons.volume_off,
                            color: Colors.red,
                            size: 40.h,
                          ),
                          child: Icon(
                            Icons.volume_up,
                            color: Colors.amber,
                            size: 40.h,
                          ),
                        ),
                        AnarToggleButton(
                          isEnabled: GameData.musicEnabled,
                          padding: EdgeInsets.all(5.r),
                          onChange: (value) {
                            if (value) {
                              audioplayer.stopBgm();
                              audioplayer.playBgm();
                            } else {
                              audioplayer.stopBgm();
                            }
                            GameData.musicEnabled;
                          },
                          clickedChild: Icon(
                            Icons.music_off,
                            color: Colors.red,
                            size: 40.h,
                          ),
                          child: Icon(
                            Icons.music_note,
                            color: Colors.amber,
                            size: 40.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    AnarButton(
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      onTap: () {
                        context.read<GameState>().setGameState(GameType.none);
                      },
                      child: Text(
                        'Exit',
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
