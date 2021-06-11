public class Pellet extends Maze {
  String s;
  boolean eaten;

  Pellet(float x, float y) {
    super("Pellet", x, y);
  }

  Pellet(String type, float x, float y) {
    super(type, x, y);
  }

  void display() {
    if (!eaten) {
      fill(#ECBA96);
      ellipse(x, y, 15, 15);
    }
  }

  void eaten(boolean ate) {
    eaten = ate;
  }

  boolean isEaten() {
    return eaten;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
  void disappear() {
  }
}

class powerPellet extends Pellet {
  powerPellet(float x, float y) {
    super("power", x, y);
  }

  void display() {
    if (!eaten) {
      fill(#ECBA96);
      ellipse(x, y, 30, 30);
    }
  }
}

class Fruit extends Pellet {
   Fruit(float x, float y){
      super("fruit", x, y);
      }
      
   void display() {
    if (!eaten) {
      fill(#ECBA96);
      ellipse(x, y, 10, 10);
   }
   }
   }
  
  
