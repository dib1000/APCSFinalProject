public class Pacman {
  int points;
  int lives;
  float x;
  float y;
  Pacman() {
    points = 0;
    lives = 2;
    x = 690;
    y = 660;
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
  
  void moveLeft(){
    x += 5;
  }
  
  
  void moveRight() {
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
  void display() {
     fill(#FAFF15);
     ellipse(x,y, 40, 40);
     //just yellow circle for now
  }
}
