int pelletCount;
int time; //for fruit
int level;
int moveTime;
Maze[][] game;
Pacman man; 
Ghost[] ghosts;

void setup() {
  size(686, 1080);
  background(0);
  float w = width/14;
  float h = (height-100)/20;
  man = new Pacman();
  game = new Maze[14][18];
  ghosts = new Ghost[4];
  ghosts[0] = new Ghost(man.getXCoord(), man.getYCoord(), (width/14) * 3.5, ((height-100)/20) * 4.5);
  ghosts[1] = new Pink(man.getXCoord() - (2 * w), man.getYCoord(), (width/14) * 5.5, ((height-100)/20) * 8.5);
  ghosts[2] = new Orange(w * 2.5, h * 17.5, w * 8.5, h * 8.5);
  ghosts[3] = new Blue(man.getXCoord(), man.getYCoord(), w * 8.5, h * 2.5);
  ghosts[3].changeTargetTile(man, ghosts[0]);
  moveTime = millis();
  for (int i = 0; i < 14; i++) {
    for (int j = 0; j < 18; j++) {
      if ((i > 0 && i < 13) && (j > 0 && j < 17)) {
        game[i][j] = new Pellet(w/2 +(i * w), h/2 + ((j + 1) * h));
        pelletCount++;
      } else {
        game[i][j] = new Wall(w/2 +(i * w), h/2 + ((j + 1) * h), w, h);
      }
    }
  }
}

void draw() {
  if (man.getLives() < 0) {
    fill(0);
    rect(0, 0, width * 3, height * 3);
    textSize(64);
    fill(255);
    text("GAME OVER", width/2 - 175, height/2 - 50);
  } else {
    for (int i = 0; i < game.length; i++) {
      for (int j = 0; j < game[0].length; j++) {
        if ((i > 0 && i < 13) && (j > 0 && j < 17)) {
          game[i][j].display();
        } else {
          game[i][j].display(game, i, j);
        }
      }
    }
    man.display();
    for (int i = 0; i < ghosts.length; i++) {
      ghosts[i].display();
    }
    if (millis() - moveTime > 500) {
      for (int i = 0; i < ghosts.length; i++) {
        ghosts[i].move();
        if (i==2) {
          ghosts[i].changeTargetTile(man);
        }
        if (i == 3) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        }
      }
      moveTime = millis();
    }
    if (man.withGhost(ghosts)) {
      restart();
    }
  }
}

void keyPressed() {
  //takes user input from the arrow keys to control the PacMan
  if (keyPressed) {
    if (keyCode == UP) {
      man.moveUp();
      ghosts[0].changeTargetTile(man);
      for (int i = 0; i < ghosts.length; i++) {
        ghosts[i].changeTargetTile(man);
      }
    }
    if (keyCode == DOWN) {
      man.moveDown();
      ghosts[0].changeTargetTile(man);
      for (int i = 0; i < ghosts.length; i++) {
        ghosts[i].changeTargetTile(man);
      }
    }
    if (keyCode == LEFT) {
      man.moveLeft();
      ghosts[0].changeTargetTile(man);
      for (int i = 0; i < ghosts.length; i++) {
        ghosts[i].changeTargetTile(man);
      }
    }
    if (keyCode == RIGHT) {
      man.moveRight();
      ghosts[0].changeTargetTile(man);
      for (int i = 0; i < ghosts.length; i++) {
        ghosts[i].changeTargetTile(man);
      }
    }
  }
}

void restart() {
  float w = width/14;
  float h = (height-100)/20;
  fill(0);
  text("LIVES:" + man.getLives(), width - 200, 40);
  rect(width - 200, 40, 200, 200); 
  man.loseLives();
  ellipse(man.getXCoord(), man.getYCoord(), 41, 41);
  man.setXCoord( w * 10.5);
  man.setYCoord( h * 10.5);
  rectMode(CENTER);
  for (int i = 0; i < ghosts.length; i++) {
    rect(ghosts[i].getRow(), ghosts[i].getCol(), 41, 41);
  }
  ghosts[0].setRow(w * 3.5);
  ghosts[0].setCol(h * 4.5);
  ghosts[1].setRow(w * 5.5);
  ghosts[1].setCol(h * 8.5);
  ghosts[2].setRow(w * 8.5);
  ghosts[2].setCol(h * 8.5);
  ghosts[3].setRow(w * 8.5);
  ghosts[3].setCol(h * 2.5);
  for (int i = 0; i < ghosts.length; i++) {
    if (i == 3) {
      ghosts[i].changeTargetTile(man, ghosts[0]);
    } else {
      ghosts[i].changeTargetTile(man);
    }
  }
}
