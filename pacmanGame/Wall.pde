public class Wall extends Maze {
  float r;
  float c;
  float wid;
  float hei;
  Wall(float x, float y, float w, float h) {
    r = x;
    c = y;
    wid = w;
    hei = h;
  }
  void display(Maze[][] m, int row, int col) {
    fill(#1818BF);
    rectMode(CENTER);
    if(row == 0 || row == m.length - 1) {
      rect(r,c,20,hei);
    }
    else {
      rect(r,c,wid,20);
    }
  }
}
