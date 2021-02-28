class Timer {
  int startTime;
  int interval;

  Timer(int intervalPut) {
    interval = intervalPut;
  }

  void start() {
    startTime = millis();
  }

  boolean isDone() {
    boolean done=false;
    if (millis()-startTime>interval) {
      done=true;
    } 
    return done;
  }
}
