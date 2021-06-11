int pelletCount;
int time; //for fruit
int level;
int numGhosts;
int eatenGhosts;
int pacTime;
int ghostTime;
int moveTime;
int redTime;
int pauseTime;
int blueTime;
int flashTime;
int eatenTime;
int moveWhen;
int backWhen;
int redFast;
int wallFlash;
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
  level = 0;
  ghosts[0] = new Ghost(man.getXCoord(), man.getYCoord(), (width/14) * 6.5, ((height-100)/20) * 6.5);
  ghosts[1] = new Pink(man.getXCoord() - (2 * w), man.getYCoord(), (width/14) * 7.5, ((height-100)/20) * 9.5);
  ghosts[3] = new Orange(w * 2.5, h * 17.5, w * 6.5, h * 9.5);
  ghosts[2] = new Blue(man.getXCoord(), man.getYCoord(), w * 8.5, h * 9.5);
  ghosts[2].changeTargetTile(man, ghosts[0]);
  moveWhen = 500;
  wallFlash = 50;
  backWhen = 7000;
  moveTime = millis();
  pauseTime = millis();
  ghostTime = millis();
  flashTime = millis();
  pacTime = millis();
  for (int i = 0; i < 14; i++) {
    for (int j = 0; j < 18; j++) {
      if ((i > 0 && i < 13) && (j > 0 && j < 17) && !((j==7 || j==9) && (i>4 && i<10)) && !(j==8 && (i==5 || i==9))
        && !((j==2 || j == 3) && ((i > 1 && i < 5) || (i > 8 && i < 12)))
        && !((j==12 && (i==2 || i==3)) || (i==3 && (j==13 || j==14)))) {
        if ((i == 1 || i == 12) && (j == 3 || j==14)) {
          game[i][j] = new powerPellet(w/2 +(i * w), h/2 + ((j + 1) * h));
          pelletCount++;
        } else {
          game[i][j] = new Pellet(w/2 +(i * w), h/2 + ((j + 1) * h));
          pelletCount++;
          if (j == 8 && i > 5 && i < 9) {
            game[i][j].eaten(true);
            pelletCount--;
          }
        }
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
  } else if (level == 3) {
    fill(0);
    rect(0, 0, width * 3, height * 3);
    textFont(gameFont);
    fill(255);
    text("YOU WON", width/2 - 150, height/2 - 50);
    textSize(32);
    fill(255);
    text("FINAL SCORE: " + man.getPoint(), width/2 - 230, height/2);
  } else if (pelletCount <= 0) {
    restart();
    float w = width/14;
    float h = (height-100)/20;
    level++;
    moveWhen -= 50;
    backWhen -= 1000;
    for (int i = 0; i < 14; i++) {
      for (int j = 0; j < 18; j++) {
        if ((i > 0 && i < 13) && (j > 0 && j < 17) && !((j==7 || j==9) && (i>4 && i<10)) && !(j==8 && (i==5 || i==9))
          && !((j==2 || j == 3) && ((i > 1 && i < 5) || (i > 8 && i < 12)))
          && !(((j==12 && (i==2 || i==3)) || (i==3 && (j==13 || j==14))))) {
          if ((i == 1 || i == 12) && (j == 3 || j==14)) {
            game[i][j] = new powerPellet(w/2 +(i * w), h/2 + ((j + 1) * h));
            pelletCount++;
          } else {
            game[i][j] = new Pellet(w/2 +(i * w), h/2 + ((j + 1) * h));
            pelletCount++;
            if (j == 8 && i > 5 && i < 9) {
              game[i][j].eaten(true);
              pelletCount--;
            }
          }
        } else {
          game[i][j] = new Wall(w/2 +(i * w), (3 * h)/2 +(j * h), w, h);
        }
      }
    }
  } else if (millis() - pauseTime < 700) {
    for (int i = 0; i < game.length; i++) {
      for (int j = 0; j < game[0].length; j++) {
        if ((i > 0 && i < 13) && (j > 0 && j < 17) && !((j==7 || j==9) && (i>4 && i<10)) && !(j==8 && (i==5 || i==9))
          && !((j==2 || j == 3) && ((i > 1 && i < 5) || (i > 8 && i < 12)))
          && !(((j==12 && (i==2 || i==3)) || (i==3 && (j==13 || j==14))))) {
          game[i][j].display();
        } else {
          game[i][j].display(game, i, j);
          if (millis() - flashTime > wallFlash) {
            game[i][j].flashing();
          }
        }
      }
    }
    wallFlash += 10;
  } else {
    fill(255);
    textFont(gameFont);
    textSize(20);
    text("POINTS: " + man.getPoint(), 50, 40);
    for (int i = 0; i < game.length; i++) {
      for (int j = 0; j < game[0].length; j++) {
        if ((i > 0 && i < 13) && (j > 0 && j < 17) && !((j==7 || j==9) && (i>4 && i<10)) && !(j==8 && (i==5 || i==9))
          && !((j==2 || j == 3) && ((i > 1 && i < 5) || (i > 8 && i < 12)))
          && !(((j==12 && (i==2 || i==3)) || (i==3 && (j==13 || j==14))))) {
          if (game[i][j].getX()==man.getXCoord() && game[i][j].getY()==man.getYCoord() && (!game[i][j].isEaten())) {
            if ((i == 1 || i == 12) && (j == 3 || j==14)) {
              man.addPoints("power");
              pelletCount--;
              eatenGhosts = 200;
              for (int b = 0; b < ghosts.length; b++) {
                ghosts[b].turnBlue();
              }
              blueTime = millis();
            } else {
              man.addPoints("regular");
              pelletCount--;
            }
            if (pelletCount == 20) {
              if (pelletCount <= 10) {
                redFast = moveWhen - 100;
              } else {
                redFast = moveWhen - 50;
              }
              redTime = millis();
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
          game[i][j].setBack();
          game[i][j].display(game, i, j);
        }
      }
    }
    man.display();
    float w = width/14;
    float h = (height-100)/20;
    int x = int((man.getXCoord() -  w / 2) / w);
    int y = int((man.getYCoord() - (3 * h / 2)) / h);
    if (keyCode == RIGHT && millis() - pacTime > 200 && !(game[x+1][y].getSubclass().equals("Wall"))) {
      man.moveRight();
      pacTime = millis();
    }
    if (keyCode == LEFT && millis() - pacTime > 200 && !(game[x-1][y].getSubclass().equals("Wall"))) {
      man.moveLeft();
      pacTime = millis();
    }
    if (keyCode == UP && millis() - pacTime > 200 && !(game[x][y-1].getSubclass().equals("Wall"))) {
      man.moveUp();
      pacTime = millis();
    }
    if (keyCode == DOWN && millis() - pacTime > 200 && !(game[x][y+1].getSubclass().equals("Wall"))) {
      man.moveDown();
      pacTime = millis();
    }
    for (int i = 0; i < ghosts.length; i++) {
      ghosts[i].display();
    }
    if (millis() - blueTime > backWhen) {
      for (int f = 0; f < ghosts.length; f++) {
        ghosts[f].turnBack();
        eatenGhosts = 200;
      }
    } else if (millis() - blueTime > backWhen-2000 && millis() - flashTime > 200) {
      for (int l = 0; l < ghosts.length; l++) {
        if (ghosts[l].getBlue() && !(ghosts[l].getEaten())) {
          ghosts[l].flash();
        }
      }
      flashTime = millis();
    }
  }
  if (millis() - eatenTime > moveWhen/2) {
    int e = 0;
    while (e < numGhosts) {
      if (ghosts[e].getEaten()) {
        if (e > 0 && ghosts[e].getRow() == 7.5 * width/14 && (ghosts[e].getCol() == 7.5 * (height-100) / 20 || ghosts[e].getCol() == 8.5 * (height-100) / 20 )) {
          ghosts[e].moveDown();
        } else {
          ghosts[e].move(game);
        }
      }
      e++;
      eatenTime = millis();
    }
  }
  if (pelletCount <= 20 && millis() - redTime > redFast && !(ghosts[0].getEaten()) && !(ghosts[0].getBlue())) {
    ghosts[0].move(game);
    redTime = millis();
  }
  if (millis() - moveTime > moveWhen) {
    int g = 0;
    while (g < numGhosts) {
      if (!(ghosts[g].getEaten())) {
        if (ghosts[g].getRow() == 7.5 * width/14 && (ghosts[g].getCol() == 9.5 * (height-100) / 20 || ghosts[g].getCol() == 8.5 * (height-100) / 20 )) {
          ghosts[g].moveUp();
        } else if (g != 0 || (g == 0 && pelletCount > 20) || ghosts[g].getBlue()) {
          ghosts[g].move(game);
        }
      }
      if (g == 2) {
        ghosts[g].changeTargetTile(man, ghosts[0]);
      } else {
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
      for (int i = 0; i < ghosts.length; i++) {
        if (i == 2) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        } else {
          ghosts[i].changeTargetTile(man);
        }
      }
    }
    if (keyCode == DOWN && !(game[x][y+1].getSubclass().equals("Wall"))) {
      for (int i = 0; i < ghosts.length; i++) {
        if (i == 2) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        } else {
          ghosts[i].changeTargetTile(man);
        }
      }
    }
    if (keyCode == LEFT && !(game[x-1][y].getSubclass().equals("Wall"))) {
      for (int i = 0; i < ghosts.length; i++) {
        if (i == 2) {
          ghosts[i].changeTargetTile(man, ghosts[0]);
        } else {
          ghosts[i].changeTargetTile(man);
        }
      }
    }
    if (keyCode == RIGHT && !(game[x+1][y].getSubclass().equals("Wall"))) {
      // man.moveRight();
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
  if (pelletCount > 0) {
    man.loseLives();
  }
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
  ghosts[0].setRow(w * 6.5);
  ghosts[0].setCol(h * 6.5);
  ghosts[1].setRow(w * 7.5);
  ghosts[1].setCol(h * 9.5);
  ghosts[3].setRow(w * 8.5);
  ghosts[3].setCol(h * 9.5);
  ghosts[2].setRow(w * 6.5);
  ghosts[2].setCol(h * 9.5);
  for (int i = 0; i < ghosts.length; i++) {
    if (i == 2) {
      ghosts[i].changeTargetTile(man, ghosts[0]);
    } else {
      ghosts[i].changeTargetTile(man);
    }
  }
  numGhosts = 1;
  wallFlash = 50;
  pauseTime = millis();
  ghostTime = millis();
  flashTime = millis();
}
