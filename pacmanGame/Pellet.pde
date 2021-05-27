public class Pellet extends Maze {
  float x; 
  float y;
  
  Pellet(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    color(#E6A485);
    ellipse(x,y,30,30);
  }
  
  void disappear(){
  }
}
