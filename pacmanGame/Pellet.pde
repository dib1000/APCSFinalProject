public class Pellet extends Maze {
  String s;
  boolean eaten;
 
  Pellet(float x, float y) {
    super("Pellet",x,y);
  }
  
  void display() {
    if (!eaten){
    fill(#ECBA96);
    ellipse(x,y,15,15);
  }
  }
  
  void eaten(boolean ate){
     eaten = ate;
  }
  
  boolean isEaten(){
      return eaten;
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
