public class Ghost { //class will code for red ghost
  boolean blueghost = false;
  boolean eaten = false;
  float targetRow;
  float targetCol;
  float row;
  float col;

  Ghost(float x, float y, float r, float c) {
    targetRow = x;
    targetCol = y;
    row = r;
    col = c;
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
    } else if (directions[0] == right) {
      row = row + w;
      fill(0);
      rect(row - w, col, 41, 41);
    } else if (directions[0] == up) {
      col = col - h;
      fill(0);
      rect(row, col + h, 41, 41);
    } else {
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

class Pink extends Ghost {
  Pink(float x, float y, float r, float c) {
    super(x, y, r, c);
  }
  void display() {
    rectMode(CENTER);
    fill(#FFB9DE);
    rect(row, col, 40, 40);
  }

  void changeTargetTile(Pacman man) {
    float w = width/14;
    float h = (height-100)/20;
    if (man.getDirection().equals("up")) {
      targetRow = man.getXCoord();
      targetCol = man.getYCoord() - (2 * h);
    }
    if (man.getDirection().equals("down")) {
      targetRow = man.getXCoord();
      targetCol = man.getYCoord() + (2 * h);
    }
    if (man.getDirection().equals("right")) {
      targetRow = man.getXCoord() + (2 * w);
      targetCol = man.getYCoord();
    }
    if (man.getDirection().equals("left")) {
      targetRow = man.getXCoord() - (2 * w);
      targetCol = man.getYCoord();
    }
  }
}
class Orange extends Ghost {
  Orange(float x, float y, float r, float c) {
    super(x, y, r, c);
  }

  void display() {
    rectMode(CENTER);
    fill(#FDB846);
    rect(row, col, 40, 40);
  }
}
