public class Wall extends Maze {
  float r;
  float c;
  Wall(float x, float y) {
    r = x;
    c = y;
  }
  void display() {
    fill(#1818BF);
    rectMode(CENTER);
    rect(r,c,50,30);
  }
}
