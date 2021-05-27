public class Maze { //This is now used to make sure that we can use an 
  //array with multiple classes.
  String subclass;
  Maze() {
  }
  Maze(String s) {
    subclass = s;
  }

  void display() {
    //ellipse(50,50,20,20);
  }

  void display(Maze[][] m, int r, int c) {
  }
  
  String getSubclass() {
    return subclass;
  }

  //void release() {
  //  //would release ghosts from their box
  //}

  //void roundOver() {
  //  //called if Pacman touches a ghost, likely determined by some boolean
  //}
}
