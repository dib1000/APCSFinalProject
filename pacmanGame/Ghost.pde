import java.util.Random;

public class Ghost { //class will code for red ghost
  boolean blueghost = false;
  boolean eaten = false;
  boolean flash = false;
  boolean scatter;
  float targetRow;
  float targetCol;
  float row;
  float col;


  Ghost(float x, float y, float r, float c) {
    targetRow = x;
    targetCol = y;
    row = r;
    col = c;
    scatter = true;
  }

  void display() {
    rectMode(CENTER);
    if (eaten) {
      fill(0);
      rect(row, col, 41, 41);
      fill(255);
      ellipse(row - 10, col - 10, 7.5, 7.5);
      ellipse(row + 10, col - 10, 7.5, 7.5);
    } else {
      if (blueghost) {
        if (flash) {
          fill(255);
        } else {
          fill(#2020f7);
        }
      } else {
        fill(255, 0, 0);
      }
      rect(row, col, 40, 40);
    }
  }

  void move(Maze[][] maze) {
    float w = width/14;
    float h = (height-100)/20;
    float startRow = row;
    float startCol = col;
    int x = int((getRow() -  w / 2) / w);
    int y = int((getCol() - (3 * h / 2)) / h);
    if (eaten && (y == 10 || y==6) && (x>4 && x<10)) {
      if (x > 4 && x < 8) {
        if (y == 10) {
          row = row - w;
          fill(0);
          rect(row + w, col, 41, 41);
        } else {
          row = row + w;
          fill(0);
          rect(row - w, col, 41, 41);
        }
      } else {
        if (y == 10) {
          row = row + w;
          fill(0);
          rect(row - w, col, 41, 41);
        } else {
          row = row - w;
          fill(0);
          rect(row + w, col, 41, 41);
        }
      }
    } else if (eaten && (x == 4 || x == 10) && (y < 11 && y > 6)) {
      col = col - h;
      fill(0);
      rect(row, col + h, 41, 41);
    } else {
      float left = sq((row - w) - targetRow) + sq(col - targetCol);
      float right = sq((row + w) - targetRow) + sq(col - targetCol);
      float up = sq(row - targetRow) + sq((col - h) - targetCol);
      float down = sq(row  - targetRow) + sq((col + h) - targetCol);
      float[] directions = {left, right, up, down};
      Random rng = new Random();
      if (blueghost && !(eaten)) {
        for (int a = directions.length; a > 1; a--) {
          int r = rng.nextInt(a);
          float storage = directions[r];
          directions[r] = directions[a-1];
          directions[a-1] = storage;
        }
      } else {
        directions = sort(directions);
      }
      int go = 0;
      while ((startRow == row && startCol == col) && go < directions.length) {
        if (directions[go] == left && !(maze[x-1][y].getSubclass().equals("Wall"))) {
          row = row - w;
          fill(0);
          rect(row + w, col, 41, 41);
        } else if (directions[go] == right && !(maze[x+1][y].getSubclass().equals("Wall"))) {
          row = row + w;
          fill(0);
          rect(row - w, col, 41, 41);
        } else if (directions[go] == up && !(maze[x][y-1].getSubclass().equals("Wall"))) {
          col = col - h;
          fill(0);
          rect(row, col + h, 41, 41);
        } else {
          if (!(maze[x][y+1].getSubclass().equals("Wall")) && directions[go] == down) {
            col = col + h;
            fill(0);
            rect(row, col - h, 41, 41);
          }
        }
        go++;
      }
    }
  }

  void moveUp() {
    float h = (height-100)/20;
    col = col - h;
    fill(0);
    rect(row, col + h, 41, 41);
  }

  void moveDown() {
    float h = (height-100)/20;
    col = col + h;
    fill(0);
    rect(row, col - h, 41, 41);
  }

  void changeTargetTile(Pacman man) {
    if (eaten) {
      targetRow = width/14 * 6.5;
      targetCol = (height - 100) /20 * 6.5;
      if (eaten && targetRow == row && targetCol == col) {
        eaten = false;
        blueghost = false;
        scatter = true;
      }
    } else if (scatter) {
      targetRow = width/14 * 12.5;
      targetCol = (height-100) / 20 * 2.5;
      if (targetRow == row && targetCol == col) {
        scatter = false;
      }
    } else {
      targetRow = man.getXCoord();
      targetCol = man.getYCoord();
    }
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
    blueghost = true;
    flash = false;
  }
  void turnBack() {
    blueghost = false;
    flash = false;
  }
  boolean getBlue() {
    return blueghost;
  }

  void flash() {
    flash = !flash;
  }

  void eaten() {
    eaten = true;
  }

  void food() {
    eaten = false;
  }

  boolean getEaten() {
    return eaten;
  }

  void SCATTER() {
    scatter = true;
  }
}

class Pink extends Ghost {
  Pink(float x, float y, float r, float c) {
    super(x, y, r, c);
    scatter = true;
  }
  void display() {
    rectMode(CENTER);
    if (eaten) {
      fill(0);
      rect(row, col, 41, 41);
      fill(255);
      ellipse(row - 10, col - 10, 7.5, 7.5);
      ellipse(row + 10, col - 10, 7.5, 7.5);
    } else {
      if (blueghost) {
        if (flash) {
          fill(255);
        } else {
          fill(#2020f7);
        }
      } else {
        fill(#FFB9DE);
      }
      rect(row, col, 40, 40);
    }
  }

  void changeTargetTile(Pacman man) {
    if (eaten) {
      targetRow = width/14 * 7.5;
      targetCol = (height - 100) /20 * 9.5;
      if (eaten && (targetRow == row || targetRow == row + width/14 || targetRow == row - width/14) && targetCol == col) {
        eaten = false;
        blueghost = false;
        scatter = true;
      }
    } else if (scatter) {
      targetRow = width/14 * 1.5;
      targetCol = (height - 100) / 20 * 2.5;
      if (targetRow == row && targetCol == col) {
        scatter = false;
      }
    } else {
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
}
class Orange extends Ghost {
  Orange(float x, float y, float r, float c) {
    super(x, y, r, c);
    scatter = true;
  }

  void display() {
    rectMode(CENTER);
    if (eaten) {
      fill(0);
      rect(row, col, 41, 41);
      fill(255);
      ellipse(row - 10, col - 10, 7.5, 7.5);
      ellipse(row + 10, col - 10, 7.5, 7.5);
    } else {
      if (blueghost) {
        if (flash) {
          fill(255);
        } else {
          fill(#2020f7);
        }
      } else {
        fill(#FDB846);
      }
      rect(row, col, 40, 40);
    }
  }

  void changeTargetTile(Pacman man) {
    if (eaten) {
      targetRow = width/14 * 6.5;
      targetCol = (height - 100) /20 * 9.5;
      if (eaten && (targetRow == row) && targetCol == col) {
        eaten = false;
        blueghost = false;
        scatter = true;
      }
    } else if (scatter) {
      targetRow = width/14 * 1.5;
      targetCol = (height - 100) / 20 * 17.5;
      if (targetRow == row && targetCol == col) {
        scatter = false;
      }
    } else {
      float w = width/14;
      float h = (height-100)/20;
      float distance = sqrt(sq(row - man.getXCoord()) + sq(col - man.getYCoord()));
      if (distance > (49 * 4)) {
        targetRow = man.getXCoord();
        targetCol = man.getYCoord();
      } else {
        targetRow = w * 1.5;
        targetCol = h * 17.5;
      }
    }
  }
}

class Blue extends Ghost {
  Blue(float x, float y, float r, float c) {
    super(x, y, r, c);
    scatter = true;
  }

  void display() {
    rectMode(CENTER);
    if (eaten) {
      fill(0);
      rect(row, col, 41, 41);
      fill(255);
      ellipse(row - 10, col - 10, 7.5, 7.5);
      ellipse(row + 10, col - 10, 7.5, 7.5);
    } else {
      if (blueghost) {
        if (flash) {
          fill(255);
        } else {
          fill(#2020f7);
        }
      } else {
        fill(#00FFFF);
      }
      rect(row, col, 40, 40);
    }
  }

  void changeTargetTile(Pacman man, Ghost red) {
    if (eaten) {
      targetRow = width/14 * 8.5;
      targetCol = (height - 100) /20 * 9.5;
      if (eaten && (targetRow == row) && targetCol == col) {
        eaten = false;
        blueghost = false;
        scatter = true;
      }
    } else if (scatter) {
      targetRow = width/14 * 12.5;
      targetCol = (height - 100) / 20 * 17.5;
      if (targetRow == row && targetCol == col) {
        scatter = false;
      }
    } else {
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
        targetRow = w * 1.5;
      }
      if (targetCol >= height) {
        targetCol = h * 17.5;
      }
      if (targetCol < 0) {
        targetCol = h * 2.5;
      }
    }
  }
}
