public class Pacman {
  int points;
  int lives;
  
  Pacman() {
    points = 0;
    lives = 2;
  }
  
  void moveUp(){
    
  }
  
  void moveDown(){
  }
  
  void moveLeft(){
  }
  
  void moveRight() {
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
  
  void display() {
   
  }
}
