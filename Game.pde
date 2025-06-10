Player p;
Platform lv1p1;
Platform lv1p2;
Platform lv1p3;
Platform lv1p4;
Platform lv1p5;
Platform lv1p6;
Platform lv1p7;
//Platform lv1p8;
Spike lv1d1;
Platform[] platforms;
Spike[] spikes;
boolean gameRunning;

void setup() {
  //
  size(800, 500); // 800 is the length (horizontal), 500 is the height (vertical)
  // more testing
  lv1p1 = new Platform("Test22", 40, height/2+150, 538, 85); // original dimensions 269*85
  lv1p2 = new Platform("Test22", 700, height/2+100, 538, 85); // original dimensions 269*85
  lv1p3 = new Platform("Test22", 1238, height/2+15, 538, 85); // original dimensions 269*85
  lv1p4 = new Platform("Test22", 1776, height/2+80, 538, 85); // original dimensions 269*85
  lv1p5 = new Platform("Test22", 2400, height/2-50, 269, 50); // original dimensions 269*85
  lv1p6 = new Platform("Test22", 2700, height/2-120, 1076, 85); // original dimensions 269*85
  lv1p7 = new Platform("Test22", 800, height/2-110, 538, 85); // original dimensions 269*85
  lv1d1 = new Spike("Spikes", 250, height/2+150-21, 65, 21); // original dimensions 65*21
  //lv1p8 = new Platform("Floating Island", 1500, height/2-160, 117, 48); // original dimensions 117*48
  
  // x = 40, y = 400
  // IMPORTANT: INITIALIZE PLATFORMS BEFORE PLAYER!
  platforms = new Platform[] {lv1p1, lv1p2, lv1p3, lv1p4, lv1p5, lv1p6, lv1p7};
  spikes = new Spike[] {lv1d1};
  p = new Player(width/2-10, height/2-10, 0, 0, platforms);
  // x = 390, y = 240
  gameRunning = true;
}



void draw() {
  //
  // testing
  background(255); // clear the background
  textSize(16);
  text("Player x: " + p.getX(), width-200, 64);
  text("Player y: " + p.getY(), width-200, 96);
  //p.gameOn();
  p.draw();
  p.tick();
  for (int i = 0; i < platforms.length; i++) {
    // do stuff to each of the platforms
    platforms[i].scrollX = p.getScrollX();
    platforms[i].scrollY = p.getScrollY();
    platforms[i].tick(p.hasMovedX, p.hasMovedY);
  }
  // danger/spikes does stuff here:
  for (int j = 0; j < spikes.length; j++) {
    // do stuff to each of the spikes/danger
    spikes[j].scrollX = p.getScrollX();
    spikes[j].scrollY = p.getScrollY();
    spikes[j].tick(p.hasMovedX, p.hasMovedY);
  }
  // reset player scrollX and scrollY
  p.scrollX = 0;
  p.scrollY = 0;
  //println("Called draw");
}


// TESTING MOVEMENT

void keyPressed() {
  //
  if (key == ' ') {
    p.center();
    for (int i = 0; i < platforms.length; i++) {
      // reset platforms
      platforms[i].devReset = true;
    }
    for (int j = 0; j < spikes.length; j++) {
      // reset spikes
      spikes[j].devReset = true;
    }
  }
  // below is in order to handle multiple keypresses at once:
  if (keyCode == RIGHT) {
    p.keys[0] = true;
  }
  if (keyCode == LEFT) {
    p.keys[1] = true;
  }
  if (keyCode == UP) {
    p.keys[2] = true;
  }
}

// releasing keys:

void keyReleased() {
  //
  if (key == ' ') {
    for (int i = 0; i < platforms.length; i++) {
      // stop resetting platforms
      platforms[i].devReset = false;
    }
    for (int j = 0; j < spikes.length; j++) {
      // stop resetting spikes
      spikes[j].devReset = false;
    }
  }
  if (keyCode == RIGHT) {
    p.keys[0] = false;
  }
  if (keyCode == LEFT) {
    p.keys[1] = false;
  }
  if (keyCode == UP) {
    p.keys[2] = false;
  }
}
