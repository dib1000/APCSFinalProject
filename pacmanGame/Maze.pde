public class Maze { //This is now used to make sure that we can use an 
  //array with multiple classes.
  String subclass;
  float x;
  float y;
  boolean eaten;
  
  Maze() {
  }
  Maze(String s) {
    subclass = s;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  Maze(String s, float x, float y) {
    subclass = s;
    this.x = x;
    this.y = y;
  }
  
   void eaten(boolean ate){
      
  }
  
  boolean isEaten(){
      return eaten;
  }
  void display() {
    //ellipse(50,50,20,20);
  }

  void display(Maze[][] m, int r, int c) {
  }

  String getSubclass() {
    return subclass;
  }
  
  void flashing() {
  }

  void setBack() {
  }
  //void release() {
  //  //would release ghosts from their box
  //}

  //void roundOver() {
  //  //called if Pacman touches a ghost, likely determined by some boolean
  //}
}
