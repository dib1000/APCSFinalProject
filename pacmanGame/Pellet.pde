public class Pellet extends Maze {
  String s;
  
  Pellet(float x, float y) {
    super("Pellet",x,y);
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
