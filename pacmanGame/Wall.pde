public class Wall extends Maze {
  float wid;
  float hei;
  Wall(float x, float y, float w, float h) {
    super("Wall",x,y);
    wid = w;
    hei = h;
  }
  void display(Maze[][] m, int row, int col) {
    fill(#1818BF);
    rectMode(CENTER);
    if ((row > 0 && m[row-1][col].getSubclass().equals("Wall")) &&
      (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
      rect(x, y, wid, 20);
    } else if ((col > 0 && m[row][col-1].getSubclass().equals("Wall")) &&
      (col < m[0].length - 1 && m[row][col+1].getSubclass().equals("Wall"))) {
      rect(x, y, 20, hei);
    } else {
      if (( col < m[0].length - 1 && m[row][col+1].getSubclass().equals("Wall")) &&
        (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
        rectMode(CORNER);
        rect( x - 10, y - 10, 20, 40);
        rect(x - 10, y - 10, 40 , 20);
      }

      if (( col > m[0].length - 1 && m[row][col-1].getSubclass().equals("Wall")) &&
        (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
        rectMode(CORNER);
      }
    }
  }
}
