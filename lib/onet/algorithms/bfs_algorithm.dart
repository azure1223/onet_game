import 'dart:math';

import 'package:onet2/onet/onet_model.dart';
import 'package:onet2/onet/search_node.dart';

class BFSAlgorithm {
  OnetModel model;
  List<SearchNode> queue = [];

  SearchNode getNodeBFS(OnetModel model2, Point a, Point b) {
    model = model2;
    queue.clear();
    SearchNode node = SearchNode(x: a.x, y: a.y, cells: 0, lines: 0, direction: 0);
    queue.add(node);
    while (queue.isNotEmpty) {
      SearchNode node3 = queue.first;
      queue.removeAt(0);
      if (node3.x == b.x && node3.y == b.y) {
        return node3;
      }
      if (node3.parent == null || model.getData(node3.x, node3.y) == -1) {
        bfsVisit(node3.x - 1, node3.y, node3, 1);
        bfsVisit(node3.x, node3.y - 1, node3, 2);
        bfsVisit(node3.x + 1, node3.y, node3, 3);
        bfsVisit(node3.x, node3.y + 1, node3, 4);
      }
    }
    return null;
  }

  void bfsVisit(int x, int y, SearchNode parent, int direction) {
    if (x >= -1 && x <= model.getWidth && y >= -1 && y <= model.getHeight) {
      int totLines = parent.lines;
      if ((parent.direction == direction || (totLines = totLines + 1) <= 3) && !isVisit(x, y, parent)) {
        queue.add(SearchNode(x: x, y: y, cells: parent.cells + 1, lines: totLines, parent: parent, direction: direction));
      }
    }
  }

  bool isVisit(int x, int y, SearchNode node) {
    while (node.parent != null) {
      node = node.parent;
      if (node.x == x && node.y == y) {
        return true;
      }
    }
    return false;
  }
}
