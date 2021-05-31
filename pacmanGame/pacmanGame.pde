int pelletCount;
int time; //for fruit
int level;
int moveTime;
Maze[][] game;
Pacman man; 
Ghost[] ghosts;

void setup() {
  size(840, 1080);
  background(0);
  float w = width/14;
  float h = (height-100)/20;
  man = new Pacman();
  game = new Maze[14][18];
  ghosts = new Ghost[2];
  ghosts[0] = new Ghost(man.getXCoord(), man.getYCoord(), (width/14) * 3.5, ((height-100)/20) * 4.5);
  ghosts[1] = new Pink(man.getXCoord() - (2 * w), man.getYCoord(), (width/14) * 5.5, ((height-100)/20) * 8.5);
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
    ghosts[0].move();
    moveTime = millis();
  }
}

void keyPressed() {
  //takes user input from the arrow keys to control the PacMan
  float w = width/14;
  float h = (height-100)/20;
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
