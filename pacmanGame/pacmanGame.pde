int pelletCount;
int time; //for fruit
int level;
int numGhosts;
int ghostTime;
int moveTime;
int pauseTime;
int blueTime;
PFont gameFont;
boolean pause;
Maze[][] game;
Pacman man; 
Ghost[] ghosts;

void setup() {
  size(686, 1080);
  background(0);
  gameFont = createFont("Early GameBoy.ttf", 48);
  float w = width/14;
  float h = (height-100)/20;
  man = new Pacman();
  game = new Maze[14][18];
  ghosts = new Ghost[4];
  numGhosts = 1;
  ghosts[0] = new Ghost(man.getXCoord(), man.getYCoord(), (width/14) * 3.5, ((height-100)/20) * 4.5);
  ghosts[1] = new Pink(man.getXCoord() - (2 * w), man.getYCoord(), (width/14) * 5.5, ((height-100)/20) * 8.5);
  ghosts[3] = new Orange(w * 2.5, h * 17.5, w * 8.5, h * 8.5);
  ghosts[2] = new Blue(man.getXCoord(), man.getYCoord(), w * 8.5, h * 2.5);
  ghosts[2].changeTargetTile(man, ghosts[0]);
  moveTime = millis();
  pauseTime = millis();
  ghostTime = millis();
  for (int i = 0; i < 14; i++) {
    for (int j = 0; j < 18; j++) {
      if ((i > 0 && i < 13) && (j > 0 && j < 17)) {
        if (i == j && i % 4 == 0) {
          game[i][j] = new powerPellet(w/2 +(i * w), h/2 + ((j + 1) * h));
        } else {
          game[i][j] = new Pellet(w/2 +(i * w), h/2 + ((j + 1) * h));
        }
        pelletCount++;
      } else {
        game[i][j] = new Wall(w/2 +(i * w), (3 * h)/2 +(j * h), w, h);
      }
    }
  }
}

void draw() {
  if (man.getLives() < 0) {
    fill(0);
    rect(0, 0, width * 3, height * 3);
    textFont(gameFont);
    fill(255);
    text("GAME OVER", width/2 - 200, height/2 - 50);
    textSize(32);
    fill(255);
    text("FINAL SCORE: " + man.getPoint(), width/2 - 230, height/2);
  } else if (man.getPoint() >= 1920) {
    // minimum amount of points to win is 1920
    fill(0);
    rect(0, 0, width * 3, height * 3);
    textFont(gameFont);
    fill(255);
    text("YOU WON", width/2 - 150, height/2 - 50);
    textSize(32);
    fill(255);
    text("FINAL SCORE: " + man.getPoint(), width/2 - 230, height/2);
  } else if (millis() - pauseTime < 300) {
    for (int i = 0; i < game.length; i++) {
      for (int j = 0; j < game[0].length; j++) {
        if ((i > 0 && i < 13) && (j > 0 && j < 17)) {
          game[i][j].display();
        } else {
          // displays walls
          game[i][j].display(game, i, j);
        }
      }
    }
  } else {
    fill(255);
    textFont(gameFont);
    textSize(20);
    text("POINTS: " + man.getPoint(), 50, 40);
    for (int i = 0; i < game.length; i++) {
      for (int j = 0; j < game[0].length; j++) {
        if ((i > 0 && i < 13) && (j > 0 && j < 17)) {
          if (game[i][j].getX()==man.getXCoord() && game[i][j].getY()==man.getYCoord() && (!game[i][j].isEaten())) {
            if (i == j && i % 4 == 0) {
              man.addPoints("power");
              for(int b = 0; b < ghosts.length; b++) {
                ghosts[b].turnBlue();
              }
              blueTime = millis();
            } else {
              man.addPoints("regular");
            }
            fill(#050000);
            rect(55, 39, 500, 50);
            fill(255);
            textSize(20);
            text("POINTS: " + man.getPoint(), 50, 40);
            game[i][j].eaten(true);
          } else { 
            game[i][j].display();
          }
        } else {
          // displays walls
          game[i][j].display(game, i, j);
        }
      }
    }
    man.display();
    if(ghosts[0].getBlue() && millis() - ghostTime > 3200) {
      for(int f = 0; f < ghosts.length; f++) {
        ghosts[f].turnBlue();
      }
    }
    for (int i = 0; i < ghosts.length; i++) {
      ghosts[i].display();
    }
    if (millis() - moveTime > 300) {
      int g = 0;
      while (g < numGhosts) {
        ghosts[g].move();
        if (g == 2) {
          ghosts[g].changeTargetTile(man, ghosts[0]);
        }
        if (g == 3) {
          ghosts[g].changeTargetTile(man);
        }
        g++;
      }
      moveTime = millis();
    }
  }
  if (man.withGhost(ghosts)) {
    restart();
  }
  if (millis() - ghostTime > 1750 && numGhosts < 4) {
    numGhosts+= 1;
    ghostTime = millis();
  }
}

void keyPressed() {
  float w = width/14;
  float h = (height-100)/20;
  int y = int((man.getYCoord() - (3 * h / 2)) / h);
  int x = int((man.getXCoord() -  w / 2) / w);
  //takes user input from the arrow keys to control the PacMan
  if (keyPressed) {
    if (keyCode == UP && !(game[x][y-1].getSubclass().equals("Wall"))) {
      man.moveUp();
      for (int i = 0; i < ghosts.length; i++) {
        if (i == 2) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        } else {
          ghosts[i].changeTargetTile(man);
        }
      }
    }
    if (keyCode == DOWN && !(game[x][y+1].getSubclass().equals("Wall"))) {
      man.moveDown();
      for (int i = 0; i < ghosts.length; i++) {
        if (i == 2) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        } else {
          ghosts[i].changeTargetTile(man);
        }
      }
    }
    if (keyCode == LEFT && !(game[x-1][y].getSubclass().equals("Wall"))) {
      man.moveLeft();
      for (int i = 0; i < ghosts.length; i++) {
        if (i == 2) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        } else {
          ghosts[i].changeTargetTile(man);
        }
      }
    }
    if (keyCode == RIGHT && !(game[x+1][y].getSubclass().equals("Wall"))) {
      man.moveRight();
      for (int i = 0; i < ghosts.length; i++) {
        if (i == 2) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        } else {
          ghosts[i].changeTargetTile(man);
        }
      }
    }
  }
}

void restart() {
  float w = width/14;
  float h = (height-100)/20;
  fill(0);
  text("LIVES:", width - 200, 40);
  for (int i = 0; i <= man.getLives(); i++) {
    fill(#FAFF15);
    ellipse(450 + (50 * (i + 1)), 30, 40, 40);
  }
  fill(0);
  rect(450, 40, 600, 85); 
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
  ghosts[3].setRow(w * 8.5);
  ghosts[3].setCol(h * 8.5);
  ghosts[2].setRow(w * 8.5);
  ghosts[2].setCol(h * 2.5);
  for (int i = 0; i < ghosts.length; i++) {
    if (i == 2) {
      ghosts[i].changeTargetTile(man, ghosts[0]);
    } else {
      ghosts[i].changeTargetTile(man);
    }
  }
  numGhosts = 1;
  pauseTime = millis();
  ghostTime = millis();
}
