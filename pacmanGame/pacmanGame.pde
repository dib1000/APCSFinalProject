int pelletCount;
int time; //for fruit
int level;
Maze[][] game;
Pacman man; 

void setup() {
  size(840, 1080);
  background(0);
  man = new Pacman();
  game = new Maze[14][18];
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
  
}

void keyPressed() {
  //takes user input from the arrow keys to control the PacMan
  if (keyPressed) {
    if (keyCode == UP) {
      man.moveUp();
    }
    if (keyCode == DOWN) {
      man.moveDown();
    }
    if (keyCode == LEFT) {
      man.setXChord(man.getXCoord() - 10);
      fill(0);
      ellipse(man.getXCoord() + 10, man.getYCoord(), 40, 40);
    }
    if (keyCode == RIGHT) {
      man.moveLeft();
    }
  }
}
