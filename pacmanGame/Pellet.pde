public class Pellet extends Maze {
  float x; 
  float y;
  
  Pellet(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(#ECBA96);
    ellipse(x,y,15,15);
  }
  
  void disappear(){
  }
}
