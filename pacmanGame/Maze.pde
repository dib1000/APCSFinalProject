public class Maze {
  int pelletCount;
  int time; //for fruit
  int level;
  Object[][] game;

  Maze() {
  }

  void display() {
    ellipse(50,50,20,20);
  }

  //void release() {
  //  //would release ghosts from their box
  //}

  //void roundOver() {
  //  //called if Pacman touches a ghost, likely determined by some boolean
  //}
}
