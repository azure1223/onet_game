import 'package:flutter/material.dart';
import 'package:onet2/menu/menu_back_painter.dart';
import 'package:onet2/menu/stand_menu_button.dart';
import 'package:onet2/utils/scale_config.dart';

class StandMenu extends StatelessWidget {
  String title;
  String message;
  List<StandMenuItem> items;
  StandMenu({@required this.title, @required this.items, this.message = '', Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wid = 300.w;
    return SizedBox(
      width: wid,
      height: (items.length * 75.h) + 120 + (message.isNotEmpty ? 0 : 0),
      child: CustomPaint(
        painter: MenuBackPainter(title),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...items.map(
              (e) => Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: GestureDetector(
                    onTap: () {
                      if (e.onTap != null) {
                        e.onTap();
                      }
                    },
                    child: StandMenuButton(title: e.title)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StandMenuItem {
  String title;
  Function onTap;
  StandMenuItem({this.title = '', this.onTap});
}
