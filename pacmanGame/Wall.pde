public class Wall extends Maze {
  float r;
  float c;
  float wid;
  float hei;
  Wall(float x, float y, float w, float h) {
    super("Wall");
    r = x;
    c = y;
    wid = w;
    hei = h;
  }
  void display(Maze[][] m, int row, int col) {
    fill(#1818BF);
    if((row > 0 && m[row-1][col].getSubclass().equals("Wall")) &&
      (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
      rectMode(CENTER);
      rect(r,c,wid,20);
    }
    else {
      rectMode(CENTER);
      rect(r,c,20,hei);
    }
  }
}
