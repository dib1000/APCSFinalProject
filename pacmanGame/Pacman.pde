public class Pacman {
  int points;
  int lives;
  float x;
  float y;
  Pacman() {
    points = 0;
    lives = 2;
    x = (width/14) * 10.5;
    y = ((height-100)/20) * 10.5;
    // we can change its default position later
  }
  
  Pacman(float xcoord, float ycoord){
    x = xcoord;
    y = ycoord;
  }
  
  void moveUp(){
 //put speed in parameters later to increase the speeds?
    y += 5;
  }
  
  void moveDown(){
    y -= 5;
    
  }
  
  void moveRight(){
    x += 5;
  }
  
  
  void moveLeft() {
    x -= 5;
  }
  
  String withAnything() {
    return "";
  }
  
  void addPoints(String pelletType) {
     if(pelletType == "regular") {
         points += 10;
     }
     if(pelletType == "power") {
         points += 50;
     }
// add fruits later
  }
  
  void loseLives(){
    lives--;
  }
  
  float getXCoord(){
    // returns the x coordinate of pacman
    return x;
  }
  
  float getYCoord(){
    // returns the y coordinate of pacman
    return y;
  }
  
  void setXCoord(float x) {
    this.x = x;
  }
  
  void setYCoord(float y) {
    this.y = y;
  }
  void display() {
     fill(#FAFF15);
     ellipse(x,y, 40, 40);
     //just yellow circle for now
  }
}
