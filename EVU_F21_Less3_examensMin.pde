int tal,x;
int[] flereTal;
float[] flereFTal;

void setup() {
  size(500, 500);
  tal=10;
  flereTal=new int[25];
  flereFTal = new float[240];
  initArray();
}

void draw() {
  background(255);
  x = x + 1;
  int col = 0;

  int retValDist = distFromWall();
  if (retValDist < width/10) {
     col = 256;
  } else {
     col = 100;
  }
  if (x>width || x < 0) {
    fill(col);
    circle(x, 10, 50);
  }
}

int distFromWall() {
  if(tal > 400) {
    return 34;
  }
  return 0;
}

void initArray() {
  for(int i=0;i < flereTal.length;i++) {
    println(i);
    flereTal[i]=(int) random(1,360);
  } 
}
