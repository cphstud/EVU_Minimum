class Catcher {
  // egenskaber
  float xPos;
  float yPos;
  int catcherColor;
  float catcherRadius;

  // konstruktør

  Catcher(int rad) {
    catcherRadius = rad;
    xPos = width/2;
    yPos = height - (2*catcherRadius);
  }

  void setPos(float x, float y) {
    xPos=x;
    yPos=y;
  }

  // metoder

  boolean interSect(Circle circle) {
    boolean hit = false;
    float mDist = dist(xPos, yPos, circle.xPos, circle.yPos);
    if (mDist < (catcherRadius+circle.rad)) {
      hit=true;
    }
    return hit;
  }

  void display() {
    colorMode(RGB);
    fill(120, 100, 100);
    circle(xPos, yPos, catcherRadius);
    colorMode(HSB);
  }
}
