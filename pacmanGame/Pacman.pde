public class Pacman {
  int points;
  int lives;
  float x;
  float y;
  float w = width/14;
  float h = (height-100)/20;
  String direction;
  Pacman() {
    points = 0;
    lives = 2;
    x = (width/14) * 10.5;
    y = ((height-100)/20) * 10.5;
    direction = "left";
    // we can change its default position later
  }

  Pacman(float xcoord, float ycoord) {
    x = xcoord;
    y = ycoord;
  }

  void moveUp() {
    //put speed in parameters later to increase the speeds?
    man.setYCoord(man.getYCoord() - h);
    fill(0);
    ellipse(man.getXCoord(), man.getYCoord() + h, 41, 41);
    direction = "up";
  }

  void moveDown() {
    man.setYCoord(man.getYCoord() + h);
    fill(0);
    ellipse(man.getXCoord(), man.getYCoord() - h, 41, 41);
    direction = "down";
  }

  void moveRight() {
    man.setXCoord(man.getXCoord() + w);
    fill(0);
    ellipse(man.getXCoord() - w, man.getYCoord(), 41, 41);
    direction = "right";
  }


  void moveLeft() {
    man.setXCoord(man.getXCoord() - w);
    fill(0);
    ellipse(man.getXCoord() + w, man.getYCoord(), 41, 41);
    direction = "left";
  }

  String withAnything() {
    return "";
  }

  void addPoints(String pelletType) {
    if (pelletType == "regular") {
      points += 10;
    }
    if (pelletType == "power") {
      points += 50;
    }
    // add fruits later
  }

  void loseLives() {
    lives--;
  }

  float getXCoord() {
    // returns the x coordinate of pacman
    return x;
  }

  float getYCoord() {
    // returns the y coordinate of pacman
    return y;
  }
  
  int getPoint(){
    return points;
  }
  
  int getLives(){
    return lives;
  }
  void setXCoord(float x) {
    this.x = x;
  }

  void setYCoord(float y) {
    this.y = y;
  }
  void display() {
    fill(#FAFF15);
    ellipse(x, y, 40, 40);
    //just yellow circle for now
    fill(255);
    textSize(24);
    text("POINTS: " + points, 50, 40);
    text("LIVES:" + lives, width - 200, 40);
    for (int i = 0; i < lives; i++) {
      fill(#FAFF15);
      ellipse(100 + (50 * (i + 1)), height-135, 40, 40);
    }
  }
  
  String getDirection() {
    return direction;
  }
}
