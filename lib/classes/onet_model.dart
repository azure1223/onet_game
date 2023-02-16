import 'package:flutter/material.dart';
import 'package:onet_mon/classes/algorithms.dart';
import 'dart:math' as math;

class OnetModel {
  List<int> data = [];
  DFSAlgorithm dfs = DFSAlgorithm();
  bool portrait = false;
  int width = 4;
  int height = 3;
  int dataLength = 0;
  List<math.Point> mPrevious = [];

  OnetModel() {
    dataLength = width * height;
    data = [];
    // portrait = width < height;
    newGame();
  }

  int get getWidth => width;

  int get getHeight => height;

  void pullHorizontal(int toX, int endX) {
    int dir;
    if (toX < endX) {
      dir = 1;
    } else {
      dir = -1;
    }
    for (int y = 0; y < getHeight; y++) {
      int x = toX;
      int xx = toX;
      while (true) {
        if (getData(x, y) != -1) {
          if (x != xx) {
            setData(xx, y, getData(x, y));
            setData(x, y, -1);
          }
          xx += dir;
        }
        if (x == endX) {
          break;
        }
        x += dir;
      }
    }
  }

  void pullVertical(int toY, int endY) {
    int dir;
    if (toY < endY) {
      dir = 1;
    } else {
      dir = -1;
    }
    for (int x = 0; x < getWidth; x++) {
      int y = toY;
      int yy = toY;
      while (true) {
        if (getData(x, y) != -1) {
          if (y != yy) {
            setData(x, yy, getData(x, y));
            setData(x, y, -1);
          }
          yy += dir;
        }
        if (y == endY) {
          break;
        }
        y += dir;
      }
    }
  }

  void gravitate(int gravity) {
    resetPrevious();
    bool lastPortrait = portrait;
    setPortrait(false);
    Rect r = Rect.fromLTRB(0, 0, (width - 1) * 1.0, (height - 1) * 1.0);
    Rect r1 = Rect.fromLTRB(0, 0, (width / 2) - 1, (height - 1) * 1.0);
    Rect r2 = Rect.fromLTRB(width / 2, 0, (width - 1) * 1.0, (height - 1) * 1.0);
    switch (gravity) {
      case 2:
        pull(0, -1, r);
        break;
      case 3:
        pull(0, 1, r);
        break;
      case 4:
        pull(1, 0, r);
        break;
      case 5:
        pull(-1, 0, r);
        break;
      case 6:
        pull(-1, 0, r1);
        pull(1, 0, r2);
        break;
      case 7:
        pull(1, 0, r1);
        pull(-1, 0, r2);
        break;
      case 8:
        pull(-1, -1, r);
        break;
      case 9:
        pull(1, -1, r);
        break;
      case 10:
        pull(-1, 1, r);
        break;
      case 11:
        pull(1, 1, r);
        break;
      case 12:
        rotate(true, true);
        break;
      case 13:
        rotate(false, false);
        break;
      case 14:
        rotate(true, false);
        break;
      case 15:
        rotate(false, true);
        break;
      case 16:
        snake();
        break;
      case 17:
        zigzagVertical();
        break;
      case 18:
        zigzagHorizontal();
        break;
    }
    setPortrait(lastPortrait);
  }

  void snake() {
    List<math.Point> points = [];
    for (int i = 0; i < width; i++) {
      points.add(math.Point(i, 0));
    }
    for (int i2 = width - 2; i2 >= 0; i2 -= 2) {
      for (int j = 1; j < height; j++) {
        points.add(math.Point(i2 + 1, j));
      }
      for (int j2 = height - 1; j2 >= 1; j2--) {
        points.add(math.Point(i2, j2));
      }
    }
    reversePoints(points);
    rotatePoints(points);
  }

  void rotate(bool cw1, bool cw2) {
    int count = (math.min(width, height) / 2).floor();
    for (int r = 0; r < count; r++) {
      List<math.Point> points = circlePoints(r);
      if (r % 2 == 0) {
        if (!cw1) {
          rotatePoints(points);
        }
      } else if (!cw2) {
        rotatePoints(points);
      }
      reversePoints(points);
      rotatePoints(points);
    }
  }

  void zigzagVertical() {
    Rect r = Rect.fromLTRB(0, 0, 0, (height - 1) * 1.0);
    for (int i = 0; i < width; i += 2) {
      r = Rect.fromLTRB(i * 1.0, r.top, i * 1.0, r.bottom);
      pull(0, -1, r);
    }
    for (int i2 = 1; i2 < width; i2 += 2) {
      r = Rect.fromLTRB(i2 * 1.0, r.top, i2 * 1.0, r.bottom);

      pull(0, 1, r);
    }
  }

  void zigzagHorizontal() {
    Rect r = Rect.fromLTRB(0, 0, (width - 1) * 1.0, 0);
    for (int i = 0; i < width; i += 2) {
      ;
      r = Rect.fromLTRB(r.left, i * 1.0, r.right, i * 1.0);
      pull(-1, 0, r);
    }
    for (int i2 = 1; i2 < width; i2 += 2) {
      r = Rect.fromLTRB(r.left, r.top, r.right, r.bottom);
      r = Rect.fromLTRB(r.left, i2 * 1.0, r.right, i2 * 1.0);

      pull(1, 0, r);
    }
  }

  void pull(int dx, int dy, Rect r) {
    if (dx != 0) {
      for (int y = r.top.floor(); y <= r.bottom; y++) {
        pullFromStart(dx < 0 ? r.left.floor() : r.right.floor(), y, dx, dy, r);
      }
    }
    if (dy != 0) {
      for (int x = r.left.floor(); x <= r.right; x++) {
        pullFromStart(x, dy < 0 ? r.top.floor() : r.bottom.floor(), dx, dy, r);
      }
    }
  }

  void pullFromStart(int x, int y, int dx, int dy, Rect r) {
    int fx = x;
    int fy = y;
    while (x >= r.left && x <= r.right && y >= r.top && y <= r.bottom) {
      if (getData(x, y) != -1) {
        if (!(x == fx && y == fy)) {
          setData(fx, fy, getData(x, y));
          setData(x, y, -1);
          setPrevious(fx, fy, getPrevious(x, y));
        }
        fx -= dx;
        fy -= dy;
      }
      x -= dx;
      y -= dy;
    }
  }

  void reversePoints(List<math.Point> points) {
    for (int i = 0; i < points.length / 2; i++) {
      points[i] = points[(points.length - i) - 1];
      points[(points.length - i) - 1] = points[i];
    }
  }

  List<math.Point> circlePoints(int r) {
    List<math.Point> ps = [];
    for (int x = r; x < width - r; x++) {
      ps.add(math.Point(x, r));
    }
    for (int y = r + 1; y < (height - r) - 1; y++) {
      ps.add(math.Point((width - r) - 1, y));
    }
    for (int x2 = (width - r) - 1; x2 >= r; x2--) {
      ps.add(math.Point(x2, (height - r) - 1));
    }
    for (int y2 = (height - r) - 2; y2 > r; y2--) {
      ps.add(math.Point(r, y2));
    }
    return ps;
  }

  void rotatePoints(List<math.Point> points) {
    math.Point first = points.first;
    int data = getData(first.x, first.y);
    math.Point prev = getPrevious(first.x, first.y);
    for (int i = 0; i < points.length - 1; i++) {
      math.Point p1 = points[i];
      math.Point p2 = points[i + 1];
      setData(p1.x, p1.y, getData(p2.x, p2.y));
      setPrevious(p1.x, p1.y, getPrevious(p2.x, p2.y));
    }
    math.Point p = points[points.length - 1];
    setData(p.x, p.y, data);
    setPrevious(p.x, p.y, prev);
  }

  bool isPortrait() {
    return portrait;
  }

  void setPortrait(bool portrait2) {
    int nx;
    if (portrait != portrait2) {
      portrait = portrait2;
      List<int> newData = getDataList;
      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          if (portrait2) {
            nx = (height - y) - 1;
          } else {
            nx = y;
          }
          newData[(height * (portrait2 ? x : (width - x) - 1)) + nx] = getData(x, y);
          // newData[(height * (portrait2 ? x : (width - x) - 1)) + nx] = getData(x, y);
        }
      }
      data = newData;
      int tmp = width;
      width = height;
      height = tmp;
    }
  }

  void setData(int x, int y, int value) {
    data[(width * y) + x] = value;
  }

  List<int> get getDataList => data;

  int getData(int x, int y) {
    if (x < 0 || x >= width || y < 0 || y >= height) {
      return -1;
    }
    return data[(width * y) + x];
  }

  void newGame() {
    int count = 0;
    int value = 0;
    for (int i = 0; i < dataLength; i++) {
      data.add(value);
      count++;
      if (count == 2) {
        value++;
        count = 0;
        if (value >= 36) {
          value = 0;
        }
      }
    }
    randomize();
  }

  bool isFinished() {
    for (int i in data) {
      if (i != -1) {
        return false;
      }
    }
    return true;
  }

  void randomize() {
    int random;
    if (!isFinished()) {
      do {
        for (int i = 0; i < data.length; i++) {
          if (data[i] != -1) {
            do {
              random = (math.Random().nextDouble() * (data.length)).floor();
            } while (data[random] == -1);
            int temp = data[i];
            data[i] = data[random];
            data[random] = temp;
          }
        }
      } while (!isPaired());
    }
  }

  /* access modifiers changed from: protected */
  bool isPaired() {
    if (isFinished()) {
      return false;
    }
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int data2 = getData(x, y);
        if (data2 != -1) {
          for (int k = x + (width * y) + 1; k < width * height; k++) {
            int i = k % width;
            int j = (k / width).floor();
            if (getData(i, j) == data2 && dfs.getNodeDFS(this, math.Point(x, y), math.Point(i, j)) != null) {
              return true;
            }
          }
          continue;
        }
      }
    }
    return false;
  }

  void resetPrevious() {
    int total = width * height;
    List<math.Point> prev = [];
    for (int i = 0; i < total; i++) {
      prev.add(math.Point(i % width, i / width));
    }
    mPrevious = prev;
  }

  math.Point getPrevious(int x, int y) {
    return mPrevious[(width * y) + x];
  }

  void setPrevious(int x, int y, math.Point p) {
    mPrevious[(width * y) + x] = p;
  }
}
