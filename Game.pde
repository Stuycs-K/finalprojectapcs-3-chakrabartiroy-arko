Player p;
Platform test22;
Platform[] platforms;
boolean gameRunning;

void setup() {
  //
  size(800, 500); // 800 is the length (horizontal), 500 is the height (vertical)
  // more testing
  test22 = new Platform("Test22", 40, height/2+150, 538, 91); // original dimensions 269*91
  // x = 40, y = 400
  // IMPORTANT: INITIALIZE PLATFORMS BEFORE PLAYER!
  platforms = new Platform[] {test22};
  p = new Player(width/2-10, height/2-10, 0, 0, platforms);
  // x = 390, y = 240
  gameRunning = true;
  // testing purposes, check if two things are touching
  //Player q = new Player(width/2+10, height/2+10, 0, 0);
  //if (p.touching(q)) {
  //  //
  //  System.out.println("p is touching q");
  //} else {
  //  //
  //  System.out.println("p is not touching q");
  //}
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
  //println("Iteration " + i);
  //test22.draw();
  for (int i = 0; i < platforms.length; i++) {
    // do stuff to each of the platforms
    platforms[i].scrollX = p.getScrollX();
    platforms[i].scrollY = p.getScrollY();
    platforms[i].tick(p.hasMoved);
  }
  //println("Called draw");
}


// TESTING MOVEMENT\

void keyPressed() {
  //
  //println(keyCode);
  //if (keyCode == RIGHT) {
  //  //
  //  //System.out.println("Right");
  //  p.right();
  //}
  //if (keyCode == LEFT) {
  //  p.left();
  //}
  if (key == ' ') {
    p.center();
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
