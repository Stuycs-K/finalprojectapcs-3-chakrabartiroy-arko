Player p;
Platform test14;
Platform[] platforms;

void setup() {
  //
  size(800, 500); // 800 is the length (horizontal), 500 is the height (vertical)
  // more testing
  test14 = new Platform("Test14", 40, height/2-20, 448, 218); // original dimensions 448*218
  // IMPORTANT: INITIALIZE PLATFORMS BEFORE PLAYER!
  platforms = new Platform[] {test14};
  p = new Player(width/2-10, height/2-10, 0, 0, platforms);
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
  //background(255); // clear the background
  textSize(16);
  text("Player x: " + p.getX(), width-200, 64);
  text("Player y: " + p.getY(), width-200, 96);
  //p.gameOn();
  p.draw();
  p.tick();
  test14.draw();
  // testing:
  
  //System.out.println("draw");
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
}
