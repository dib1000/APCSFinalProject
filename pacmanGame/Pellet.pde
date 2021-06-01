public class Pellet extends Maze {
  float x; 
  float y;
  String s;
  
  Pellet(float x, float y) {
    super("Pellet");
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(#ECBA96);
    ellipse(x,y,15,15);
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y; 
  }
  void disappear(){
  }
}
