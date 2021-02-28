int[] cols, rads, xpos, ypos, speeds; //<>//
int unit, nums, delay, push, min, rounds;
boolean go;
PImage bg;

Circle[] circles;
Circle circle;
Catcher catcher;
Timer timer;

void setup() {
  size(600, 400);
  nums=200;
  delay=10;
  push=10;
  rounds=50;
  unit=width/nums;
  cols = new int[nums];
  rads = new int[nums];
  xpos = new int[nums];
  ypos = new int[nums];
  speeds = new int[nums];
  circles = new Circle[nums];
  catcher = new Catcher(min+30);
  timer = new Timer(100);
  min=3;
  go=true;
  bg = loadImage("cliff.jpeg"); 
  bg.resize(width,height);

  initArray();
  colorMode(HSB);
}

void draw() {
  background(bg);
  if (go) {
    if (timer.isDone()) {
    //if (frameCount%delay==0) {
    
      push++;
      timer.start();
      if (push > nums) {
        initArray();
        push=10;
      }
    }


    catcher.setPos(mouseX, mouseY);
    catcher.display();
    // tegne push-antal circler

    for (int i=0; i<push; i++) {
      circles[i].move();
      circles[i].display();
      if (catcher.interSect(circles[i])) {
        if (catcher.catcherRadius > circles[i].rad) {
          circles[i].yPos=0;
          catcher.catcherRadius =(catcher.catcherRadius+1)%rounds;
          //catcher.catcherRadius++;
        } else {
          if (catcher.catcherRadius < min) {
            go=false;
          } else {
            catcher.catcherRadius--;
          }
        }
      }
    }
  }
}


void initArray() {

  Circle tmpCircle = null;
  // initialiserer værdierl de 10 cirkler
  for (int i=0; i<nums; i++) {
    //farve
    int col=(int)(random(360));
    //radius
    int rad=(int)(random(min, unit+30));
    //xpos
    int xpos=(int)(random(width-unit));
    //ypos
    int ypos=unit;
    //drop-hastighed
    int speed=(int)(random(1, 4));
    // lav nu en cirkel
    tmpCircle = new Circle(col, xpos, ypos, rad, speed);
    circles[i]=tmpCircle;
  }
}

void keyPressed() {
  if (key=='g') {
    go=!go;
    initArray();
    push=10;
    catcher.catcherRadius=20;
  }
}
