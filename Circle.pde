class Circle {
  // egenskaber
  int col;
  int xPos;
  int yPos;
  int rad;
  int speed;
   
  // konstruktør
  Circle(int newCol,int newxPos,int newyPos, int newRad, int newSpeed) {
    col=newCol;
    xPos=newxPos;
    yPos=newyPos;
    rad=newRad;
    speed=newSpeed;
  }
  // metoder
  void display() {
    fill(col,200,200);
    circle(xPos, yPos, rad);  
  }
  void move() {
    yPos+=speed;
  }
    void move(int xdir) {
      
    xPos+=xdir;
  }
}

 
