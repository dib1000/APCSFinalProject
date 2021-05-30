public class Ghost { //class will code for red ghost
  boolean blueghost = false;
  boolean eaten = false;
  float targetRow;
  float targetCol;
  float row;
  float col;

  Ghost(float x, float y) {
    targetRow = x;
    targetCol = y;
    row = (width/14) * 3.5;
    col = ((height-100)/20) * 4.5;
  }

  void display() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(row, col, 40, 40);
  }

  void move() {
    float w = width/14;
    float h = (height-100)/20;
    float left = sq((row - w) - targetRow) + sq(col - targetCol);
    float right = sq((row + w) - targetRow) + sq(col - targetCol);
    float up = sq(row - targetRow) + sq((col - h) - targetCol);
    float down = sq(row  - targetRow) + sq((col + h) - targetCol);
    float[] directions = {left, right, up, down};
    directions = sort(directions);
    if (directions[0] == left) {
      row = row - w;
      fill(0);
      rect(row + w, col, 41, 41);
    }
    else if (directions[0] == right) {
      row = row + w;
      fill(0);
      rect(row - w, col, 41, 41);
    }
    else if (directions[0] == up) {
      col = col - h;
      fill(0);
      rect(row, col + h, 41, 41);
    }
    else {
      col = col + h;
      fill(0);
      rect(row, col - h, 41, 41);
    }
  }

  void changeTargetTile(Pacman man) {
    targetRow = man.getXCoord();
    targetCol = man.getYCoord();
  }
}
