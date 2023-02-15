import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ToggleButton extends PositionComponent with Tappable {
  bool isEnable;
  Sprite onSprite;
  Sprite offSprite;
  Function onTap;
  ToggleButton({
    this.isEnable = false,
    this.onSprite,
    this.offSprite,
    Vector2 size,
    Vector2 position,
    this.onTap,
  }) : super(size: size, position: position);
  @override
  void render(Canvas canvas) {
    Sprite sp = isEnable ? onSprite : offSprite;
    sp.render(
      canvas,
      size: size,
    );
  }

  @override
  @mustCallSuper
  bool onTapDown(_) {
    isEnable = !isEnable;
    if (onTap != null) {
      onTap(isEnable);
    }
    return false;
  }

  @override
  @mustCallSuper
  bool onTapUp(_) {
    onTapCancel();
    return false;
  }

  @override
  @mustCallSuper
  bool onTapCancel() {
    return false;
  }
}
