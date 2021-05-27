int pelletCount;
int time; //for fruit
int level;
Maze[][] game;

void setup() {
  size(840, 1080);
  background(0);
  game = new Maze[14][18];
  float w = width/14;
  float h = (height-100)/20;
  for(int i = 0; i < 14; i++) {
    for(int j = 0; j < 18; j++) {
      if((i > 0 && i < 13) && (j > 0 && j < 17)) {
        game[i][j] = new Pellet(w/2 +(i * w), h/2 + ((j + 1) * h));
      }
      else {
        game[i][j] = new Wall();
      }
    }
  }
}

void draw() {
  for(int i = 0; i < game.length; i++) {
    for(int j = 0; j < game[0].length; j++) {
      game[i][j].display();
      
    }
  }
}

void keyPressed() {
  //takes user input from the arrow keys to control the PacMan
  if (keyPressed) {
    if (key == UP) {
    }
    if (key == DOWN) {
    }
    if (key == RIGHT) {
    }
    if (key == LEFT) {
    }
  }
}
