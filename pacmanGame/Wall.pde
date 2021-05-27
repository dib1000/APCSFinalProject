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
    rectMode(CENTER);
    if((row > 0 && m[row-1][col].getSubclass().equals("Wall")) &&
      (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
      rect(r,c,wid,20);
    }
    else if((col > 0 && m[row][col-1].getSubclass().equals("Wall")) &&
      (col < m[0].length - 1 && m[row][col+1].getSubclass().equals("Wall"))) {
      rect(r,c,20,hei);
    }
    else {
      rect(r,c,20,hei);
      if(( col < m[0].length - 1 && m[row][col+1].getSubclass().equals("Wall")) &&
      (row < m.length - 1 && m[row+1][col].getSubclass().equals("Wall"))) {
      }
    }  
  }
}
