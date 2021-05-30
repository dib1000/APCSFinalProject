public class Ghost { //class will code for red ghost
  boolean blueghost = false;
  boolean eaten = false;
  float targetRow;
  float targetCol;
  float row;
  float col;
  
  Ghost(float x, float y){
    targetRow = x;
    targetCol = y;
    row = (width/14) * 3.5;
    col = ((height-100)/20) * 4.5;
    
  }
  
  void display(){
    rectMode(CENTER);
    fill(255,0,0);
    rect(row,col,40,40);
  }
  
  void move() {
  }
  
  void changeTargetTile(){
  }
}
