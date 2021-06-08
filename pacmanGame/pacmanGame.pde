int pelletCount;
int time; //for fruit
int level;
int numGhosts;
int eatenGhosts;
int ghostTime;
int moveTime;
int pauseTime;
int blueTime;
int flashTime;
int eatenTime;
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
  eatenGhosts = 200;
  ghosts[0] = new Ghost(man.getXCoord(), man.getYCoord(), (width/14) * 4.5, ((height-100)/20) * 4.5);
  ghosts[1] = new Pink(man.getXCoord() - (2 * w), man.getYCoord(), (width/14) * 5.5, ((height-100)/20) * 8.5);
  ghosts[3] = new Orange(w * 2.5, h * 17.5, w * 8.5, h * 8.5);
  ghosts[2] = new Blue(man.getXCoord(), man.getYCoord(), w * 8.5, h * 2.5);
  ghosts[2].changeTargetTile(man, ghosts[0]);
  moveTime = millis();
  pauseTime = millis();
  ghostTime = millis();
  flashTime = millis();
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
  } else if (pelletCount <= 0) {
    // minimum amount of points to win is 1920
    fill(0);
    rect(0, 0, width * 3, height * 3);
    textFont(gameFont);
    fill(255);
    text("YOU WON", width/2 - 150, height/2 - 50);
    textSize(32);
    fill(255);
    text("FINAL SCORE: " + man.getPoint(), width/2 - 230, height/2);
  } else if (millis() - pauseTime < 450) {
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
              eatenGhosts = 200;
              for (int b = 0; b < ghosts.length; b++) {
                ghosts[b].turnBlue();
              }
              pelletCount--;
              blueTime = millis();
            } else {
              man.addPoints("regular");
              pelletCount--;
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
    if (ghosts[0].getBlue() && millis() - blueTime > 7000) {
      for (int f = 0; f < ghosts.length; f++) {
        ghosts[f].turnBack();
        eatenGhosts = 200;
      }
    } else if (ghosts[0].getBlue() && millis() - blueTime > 5000 && millis() - flashTime > 200) {
      for (int l = 0; l < ghosts.length; l++) {
        ghosts[l].flash();
      }
      flashTime = millis();
    }
    for (int i = 0; i < ghosts.length; i++) {
      ghosts[i].display();
    }
  }
  if(millis() - eatenTime > 200) {
    int e = 0;
    while(e < numGhosts) {
      if(ghosts[e].getEaten()) {
        ghosts[e].move();
      }
      e++;
      eatenTime = millis();
    }
  }
  if (millis() - moveTime > 400) {
    int g = 0;
    while (g < numGhosts) {
      if(!(ghosts[g].getEaten())) {
        ghosts[g].move();
      }
      if (g == 2) {
        ghosts[g].changeTargetTile(man, ghosts[0]);
      }
      else {
        ghosts[g].changeTargetTile(man);
      }
      g++;
    }
    moveTime = millis();
  }
  for (int c = 0; c < ghosts.length; c++) {
    if (man.getXCoord() == ghosts[c].getRow() && man.getYCoord() == ghosts[c].getCol()) {
      if (!(ghosts[c].getBlue()) && !(ghosts[c].getEaten())) {
        restart();
      } else if (ghosts[c].getBlue() && !ghosts[c].getEaten()) {
        ghosts[c].eaten();
        man.addPoints(eatenGhosts);
        if (eatenGhosts < 1600) {
          eatenGhosts += eatenGhosts;
        }
        eatenTime = millis();
      }
    }
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
  for (int g = 0; g < ghosts.length; g++) {
    ghosts[g].turnBack();
    ghosts[g].food();
    ghosts[g].SCATTER();
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
