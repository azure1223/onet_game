import 'package:flutter/material.dart';

class AnarToggleButton extends StatefulWidget {
  AnarToggleButton({
    Key key,
    @required this.isEnabled,
    @required this.child,
    @required this.clickedChild,
    this.onChange,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  bool isEnabled;
  Widget child;
  Widget clickedChild;
  Function onChange;
  String type;
  EdgeInsets margin;
  EdgeInsets padding;

  @override
  AnarToggleButtonState createState() => AnarToggleButtonState();
}

class AnarToggleButtonState extends State<AnarToggleButton> with SingleTickerProviderStateMixin {
  AnimationController controller;
  // bool isEnable = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 50));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          widget.isEnabled = !widget.isEnabled;
        });
        widget.onChange(widget.isEnabled);
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward();
      },
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.red.withOpacity(controller.value < 0.5 ? controller.value : (1 - controller.value)),
          border: Border.all(
            color: Colors.amber,
            width: 2,
          ),
        ),
        child: Center(child: widget.isEnabled ? widget.child : widget.clickedChild),
      ),
    );
  }
}

class AnarButton extends StatefulWidget {
  AnarButton({
    Key key,
    this.child,
    this.clickedChild,
    this.onTap,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  Widget child;
  Widget clickedChild;
  VoidCallback onTap;
  String type;
  EdgeInsets margin;
  EdgeInsets padding;

  @override
  AnarButtonState createState() => AnarButtonState();
}

class AnarButtonState extends State<AnarButton> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 50));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        widget.onTap();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward();
      },
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.red.withOpacity(controller.value < 0.5 ? controller.value : (1 - controller.value)),
          border: Border.all(
            color: Colors.amber,
            width: 2,
          ),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
