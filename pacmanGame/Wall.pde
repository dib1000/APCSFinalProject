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
    if(row == 0 || row == m.length - 1) {
      rectMode(CENTER);
      rect(r,c,20,hei);
    }
    else {
      rectMode(CENTER);
      rect(r,c,wid,20);
    }
    rectMode(CORNER);
    if(row == 0 && col == 0) {
      rect(20,((3 * hei) / 2) - 10,40,20);
      fill(0);
      rect(20, hei, 20, (hei/2)-10);
    }
  }
}
