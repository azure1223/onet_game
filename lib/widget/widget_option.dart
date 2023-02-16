import 'package:flutter/material.dart';
import 'package:onet_mon/menu/stand_menu.dart';
import 'package:onet_mon/utils/scale_config.dart';

class OptionWidget extends StatefulWidget {
  OptionWidget({Key key}) : super(key: key);

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
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
                title: 'Option',
                items: [
                  StandMenuItem(title: 'menu', onTap: () {}),
                  StandMenuItem(title: 'menu', onTap: () {}),
                  StandMenuItem(
                      title: 'exit',
                      onTap: () {
                        Navigator.pop(context);
                      }),
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
    // return Center(
    //   child: Material(
    //     child: Hero(
    //       tag: 'option',
    //       child: Container(
    //         width: 350,
    //         height: 350,
    //         color: Colors.red,
    //         child: Column(
    //           children: [
    //             Container(
    //               margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    //               width: 350,
    //               height: 50,
    //               color: Colors.amber,
    //               child: Material(
    //                 child: Container(
    //                   color: Colors.amber,
    //                   child: Center(
    //                     child: Text(
    //                       'Option',
    //                       style: TextStyle(
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.w500,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               width: 350,
    //               height: 250,
    //               color: Colors.cyan,
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     children: [],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
