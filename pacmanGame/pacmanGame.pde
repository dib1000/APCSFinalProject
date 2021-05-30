int pelletCount;
int time; //for fruit
int level;
int moveTime;
Maze[][] game;
Pacman man; 
Ghost red;

void setup() {
  size(840, 1080);
  background(0);
  man = new Pacman();
  red = new Ghost(man.getXCoord(), man.getYCoord());
  game = new Maze[14][18];
  moveTime = millis();
  float w = width/14;
  float h = (height-100)/20;
  for(int i = 0; i < 14; i++) {
    for(int j = 0; j < 18; j++) {
      if((i > 0 && i < 13) && (j > 0 && j < 17)) {
        game[i][j] = new Pellet(w/2 +(i * w), h/2 + ((j + 1) * h));
        pelletCount++;
      }
      else {
        game[i][j] = new Wall(w/2 +(i * w), h/2 + ((j + 1) * h), w, h);
      }
    }
  }
}

void draw() {
  for(int i = 0; i < game.length; i++) {
    for(int j = 0; j < game[0].length; j++) {
      if((i > 0 && i < 13) && (j > 0 && j < 17)) {
        game[i][j].display();
      }
      else {
        game[i][j].display(game,i,j);
      }
    }
  }
  man.display();
  red.display();
  if(millis() - moveTime > 500) {
    red.move();
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
      red.changeTargetTile(man);
    }
    if (keyCode == DOWN) {
      man.moveDown();
      red.changeTargetTile(man);
    }
    if (keyCode == LEFT) {
      man.moveLeft();
      red.changeTargetTile(man);
    }
    if (keyCode == RIGHT) {
      man.moveRight();
      red.changeTargetTile(man);
    }
  }
}
