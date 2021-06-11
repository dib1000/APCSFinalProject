public class Wall extends Maze {
  float wid;
  float hei;
  boolean flash;
  Wall(float x, float y, float w, float h) {
    super("Wall", x, y);
    wid = w;
    hei = h;
    flash = false;
  }
  void display(Maze[][] m, int row, int col) {
    if (flash) {
      fill(255);
    } else if (col == 9 && row == 7) {
      fill(#f498b0);
    } else {
      fill(#1818BF);
    }
    rectMode(CENTER);
    if ((row > 0 && m[row-1][col].getSubclass().equals("Wall")) &&
      (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
      if (col == 9 && row == 7) {
        rect(x, y, wid, 10);
      } else {
        rect(x, y, wid, 20);
      }
    } else if ((col > 0 && m[row][col-1].getSubclass().equals("Wall")) &&
      (col < m[0].length - 1 && m[row][col+1].getSubclass().equals("Wall"))) {
      rect(x, y, 20, hei);
    } else {
      if (( col < m[0].length - 1 && m[row][col+1].getSubclass().equals("Wall")) &&
        (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
        rectMode(CORNER);
        rect( x - 10, y - 10, 20, 40);
        rect(x - 10, y - 10, 40, 20);
      } else if (( col < m[0].length - 1 && m[row][col+1].getSubclass().equals("Wall")) &&
        (row <= m.length - 1 && m[row-1][col].getSubclass().equals("Wall"))) {
        rectMode(CORNER);
        rect(x-10, y-10, 20, 40);
        rect(x-30, y-10, 40, 20);
      } else if (( col < m[0].length && m[row][col-1].getSubclass().equals("Wall")) &&
        (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
        rectMode(CORNER);
        rect(x - 10, y - 30, 20, 40);
        rect(x - 10, y - 10, 40, 20);
      } else {
        rectMode(CORNER);
        rect(x-10, y-30, 20, 40);
        rect(x-30, y-10, 40, 20);
      }
    }
  }
  void flashing() {
    flash = !flash;
  }

  void setBack() {
    flash = false;
  }
}
