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
  
  void isEaten(boolean ate){
     eaten = ate;
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
