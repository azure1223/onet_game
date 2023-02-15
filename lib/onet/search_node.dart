class SearchNode {
  int cells;
  int direction;
  int lines;
  SearchNode parent;

  int x;
  int y;
  SearchNode({
    this.x,
    this.y,
    this.cells,
    this.lines,
    this.parent,
    this.direction,
  });
}
