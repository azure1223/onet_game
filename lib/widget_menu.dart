import 'package:flutter/material.dart';
import 'package:onet2/menu/stand_menu.dart';
import 'package:onet2/widget_option.dart';
import 'package:onet2/utils/scale_config.dart';

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
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: StandMenu(
                title: 'menu',
                items: [
                  StandMenuItem(title: 'play', onTap: widget.playBtnFuc),
                  StandMenuItem(
                      title: 'option',
                      onTap: () {
                        // showGeneralDialog(
                        //     barrierColor: Colors.black.withOpacity(.9),
                        //     transitionBuilder: (context, a1, a2, widget) {
                        //       final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
                        //       return Transform(
                        //         transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                        //         child: Opacity(
                        //           opacity: a1.value,
                        //           child: OptionWidget(),
                        //         ),
                        //       );
                        //     },
                        //     transitionDuration: Duration(milliseconds: 500),
                        //     barrierDismissible: true,
                        //     barrierLabel: '',
                        //     context: context,
                        //     pageBuilder: (context, animation1, animation2) {
                        //       return;
                        //     });
                      }),
                  StandMenuItem(title: 'exit', onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
