import 'dart:math';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:onet_mon/classes/algorithms.dart';
import 'package:onet_mon/classes/game_state.dart';
import 'package:onet_mon/classes/onet_model.dart';
import 'package:onet_mon/classes/search_node.dart';
import 'dart:math' as math;

import 'package:onet_mon/game_widget.dart';
import 'package:onet_mon/utils/scale_config.dart';

class GameView extends PositionComponent with HasGameRef<MyGame>, Tappable {
  Images images;
  Function nextLevel;
  Function playSound;

  GameView({
    @required Vector2 size,
    @required this.images,
    @required this.model,
    @required this.nextLevel,
    @required this.playSound,
  }) : super(size: size);
  double SIDE_CELL_MULT = 0.2;

  BFSAlgorithm bfsAlgorithm = BFSAlgorithm();
  DFSAlgorithm dfsAlgorithm = DFSAlgorithm();

  SearchNode finalNode;
  double cellSize;
  double top;
  double left;

  double mBorderWidth;
  int mCellColor;
  double mLineWidth;
  Paint mPaint = Paint();
  int mSelectedColor;

  OnetModel model;

  List<Point> selected = [];
  List<Point> hinted = [];
  double sideCellSize;

  void check() {
    if (finalNode != null) {
      finalNode = null;
      Point a = selected.first;
      Point b = selected.last;
      model.setData(a.x, a.y, -1);
      model.setData(b.x, b.y, -1);
      onMatched();
    } else {
      playSound('bad.wav');
    }
    selected.clear();
    if (!model.isFinished() && !model.isPaired()) {
      playSound('random.wav');
      model.randomize();
    }
  }

  @override
  @mustCallSuper
  bool onTapDown(info) {
    onTouchEvent(info.eventPosition.global);
    return true;
  }

  void onMatched() {
    playSound('good.wav');
    // int delta = mGame.lastMatch - mGame.timeLeft;
    // mGame.lastMatch = mGame.timeLeft;
    // int bonus = 10 - ((delta * 10) / 200);
    // if (bonus < 0) {
    //   bonus = 0;
    // }
    if (model.isFinished()) {
      // bonus += timeLeft / 10;
      nextLevel();
    } else {
      GameState.score++;
      model.gravitate(GameState.level);
    }
    // final int finalBonus = bonus + 20;

    // if (finalBonus > 0) {
    //   // addBonus(finalBonus);
    // }
    // updateScore();
  }

  @override
  void render(Canvas canvas) {
    if (model != null) {
      cellSize = math.min((size.x / (model.getWidth + .4)), (size.y / (model.getHeight + .4)));
      sideCellSize = cellSize * SIDE_CELL_MULT;
      left = (size.x - (cellSize * model.getWidth)) / 2;
      top = (size.y - (cellSize * model.getHeight)) / 2;
      for (int y = 0; y < model.getHeight; y++) {
        for (int x = 0; x < model.getWidth; x++) {
          drawCell(canvas, x, y);
        }
      }
      if (finalNode != null) {
        mPaint.style;
        mPaint.color = Colors.red;
        SearchNode node = finalNode;
        while (node.parent != null) {
          SearchNode parent = node.parent;
          Rect r1 = getCellRect(node.x, node.y);
          Rect r2 = getCellRect(parent.x, parent.y);
          canvas.drawLine(
            r1.center,
            r2.center,
            mPaint
              ..color = Colors.red
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3,
          );
          node = parent;
        }
      }
    }
  }

  onSizeChanged(int w, int h, int oldw, int oldh) {}

  Rect getCellRect(int x, int y, {double padding = 0}) {
    double l = left + (cellSize * x) + padding;
    double t = top + (cellSize * y) + padding;
    double w = cellSize;
    double h = cellSize;
    if (x == -1 || x == model.getWidth) {
      w = sideCellSize;
    }
    if (y == -1 || y == model.getHeight) {
      h = sideCellSize;
    }
    if (x == -1) {
      l = left - w;
    }
    if (y == -1) {
      t = top - h;
    }
    return Rect.fromLTRB(l, t, l + w - (padding * 2), t + h - (padding * 2));
  }

  drawCell(Canvas canvas, int x, int y) {
    int value = model.getData(x, y);
    if (value != -1) {
      Rect r = getCellRect(x, y);
      Rect r2 = getCellRect(x, y, padding: 10.w);

      canvas.drawRect(
          r,
          mPaint
            ..style = PaintingStyle.fill
            ..color = hinted.contains(Point(x, y))
                ? Colors.red
                : selected.contains(Point(x, y))
                    ? Colors.blue
                    : Color(0xFFFFDCFA));

      canvas.drawRect(
        r,
        mPaint
          ..color = Color.fromARGB(255, 96, 63, 101)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
      var img = images.fromCache('icon$value.png');
      canvas.drawImageNine(img, r, r2, Paint());
    }
  }

  void showHint() {
    int total = model.getWidth * model.getHeight;

    for (int i = 0; i < total - 1; i++) {
      int x1 = i % model.getWidth;
      int y1 = (i / model.getWidth).floor();
      if (model.getData(x1, y1) != -1) {
        for (int j = i + 1; j < total; j++) {
          int x2 = j % model.getWidth;
          int y2 = (j / model.getWidth).floor();

          if (model.getData(x1, y1) == model.getData(x2, y2)) {
            Point p1 = Point(x1, y1);
            Point p2 = Point(x2, y2);
            if (algorithmOption(p1, p2) != null) {
              hinted.clear();
              hinted.add(p1);
              hinted.add(p2);

              return;
            }
          }
        }
      }
    }
  }

  bool onTouchEvent(Vector2 event) {
    if (selected.length != 2 && cellSize != 0) {
      int x = (((event.x) - left) / cellSize).floor();
      int y = (((event.y) - top) / cellSize).floor();
      if (event.x < left) {
        x = -1;
      }
      if (event.y < top) {
        y = -1;
      }
      if (x >= 0 && x < model.getWidth && y >= 0 && y < model.getHeight && model.getData(x, y) != -1
          // && event.getAction() == 1
          ) {
        hinted.clear();
        playSound('click.wav');
        selected.add(Point(x, y));
        // listener.onSelected();
        // invalidate();
        if (selected.length == 2) {
          Point a = selected.first;
          Point b = selected.last;
          if ((a.x != b.x || a.y != b.y) && model.getData(a.x, a.y) == model.getData(b.x, b.y)) {
            finalNode = algorithmOption(a, b);
          }
          Future.delayed(Duration(milliseconds: 400)).then((value) {
            check();
          });
        }
      }
    }
    return true;
  }

  SearchNode algorithmOption(Point a, Point b) {
    if (a.y != b.y || b.x >= a.x) {
      return bfsAlgorithm.getNodeBFS(model, a, b);
    }
    return dfsAlgorithm.getNodeDFS(model, a, b);
  }
}
