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
    if (blueghost) {
      fill(#2020f7);
    } else {
      fill(255, 0, 0);
    }
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
    if (directions[0] == left && row > 2*w) {
      row = row - w;
      fill(0);
      rect(row + w, col, 41, 41);
    } else if (directions[0] == right && row < width - (2*w)) {
      row = row + w;
      fill(0);
      rect(row - w, col, 41, 41);
    } else if (directions[0] == up && col > 122.5) {
      col = col - h;
      fill(0);
      rect(row, col + h, 41, 41);
    } else {
      if (col < 857.5) {
        col = col + h;
        fill(0);
        rect(row, col - h, 41, 41);
      }
    }
  }

  void changeTargetTile(Pacman man) {
    targetRow = man.getXCoord();
    targetCol = man.getYCoord();
  }

  void changeTargetTile(Pacman man, Ghost ghost) {
  }

  float getCol() {
    return col;
  }

  float getRow() {
    return row;
  }

  void setCol(float c) {
    col = c;
  }

  void setRow(float r) {
    row = r;
  }

  void turnBlue() {
    blueghost = !(blueghost);
  }
}

class Pink extends Ghost {
  Pink(float x, float y, float r, float c) {
    super(x, y, r, c);
  }
  void display() {
    rectMode(CENTER);
    if (blueghost) {
      fill(#2020f7);
    } else {
      fill(#FFB9DE);
    }
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
    if (blueghost) {
      fill(#2020f7);
    } else {
      fill(#FDB846);
    }
    rect(row, col, 40, 40);
  }

  void changeTargetTile(Pacman man) {
    float w = width/14;
    float h = (height-100)/20;
    float distance = sqrt(sq(row - man.getXCoord()) + sq(col - man.getYCoord()));
    if (distance > (49 * 4)) {
      targetRow = man.getXCoord();
      targetCol = man.getYCoord();
    } else {
      targetRow = w * 2.5;
      targetCol = h * 17.5;
    }
  }
}

class Blue extends Ghost {
  Blue(float x, float y, float r, float c) {
    super(x, y, r, c);
  }

  void display() {
    rectMode(CENTER);
    if (blueghost) {
      fill(#2020f7);
    } else {
      fill(#00FFFF);
    }
    rect(row, col, 40, 40);
  }

  void changeTargetTile(Pacman man, Ghost red) {
    float w = width/14;
    float h = (height-100)/20;
    float manX = man.getXCoord();
    float manY = man.getYCoord();
    if (man.getDirection().equals("up")) {
      manY -= h;
    } else if (man.getDirection().equals("down")) {
      manY += h;
    } else if (man.getDirection().equals("left")) {
      manX -= w;
    } else {
      manX += w;
    }
    if (red.getRow() > manX) {
      targetRow = red.getRow() - abs(manX - red.getRow()) * 2;
    } else {
      targetRow = red.getRow() + abs(manX - red.getRow()) * 2;
    }
    if (red.getCol() > manY) {
      targetCol = red.getCol() + abs(manY - red.getCol()) * 2;
    } else {
      targetCol = red.getCol() - abs(manY - red.getCol()) * 2;
    }
    if (targetRow >= width) {
      targetRow = w * 12.5;
    }
    if (targetRow <= 0) {
      targetRow = w * 2.5;
    }
    if (targetCol >= height) {
      targetCol = h * 17.5;
    }
    if (targetCol < 0) {
      targetCol = h * 4.5;
    }
  }
}
