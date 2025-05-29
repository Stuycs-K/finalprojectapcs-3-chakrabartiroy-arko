Player p;

void setup() {
  //
  size(800, 500); // 800 is the length (horizontal), 500 is the height (vertical)
  p = new Player(width/2-10, height/2-10, 0, 0);
  // testing purposes, check if two things are touching
  Player q = new Player(width/2+10, height/2+10, 0, 0);
  if (p.touching(q)) {
    //
    System.out.println("p is touching q");
  } else {
    //
    System.out.println("p is not touching q");
  }
}

void draw() {
  //
  background(255); // clear the background
  p.draw();
  //System.out.println("draw");
}


// TESTING MOVEMENT\

void keyPressed() {
  //
  //println(keyCode);
  if (keyCode == RIGHT) {
    //
    //System.out.println("Right");
    p.right();
  }
}
