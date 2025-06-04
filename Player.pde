class Player extends Thing {
  // do stuff
  private float x;
  private float y;
  private float sx;
  private float sy;
  private PImage p;
  private Joystick j;
  private int inAir;
  private Platform[] platforms;
  // just in case
  private float currentX, currentY;
  // just in case ig?
  private String exit;
  private int state;
  private boolean stateNull;
  private int distance;
  private float angle;
  private float scrollX;
  private float scrollY;
  private boolean keyPress;
  private int jumpCounter;
  // for handling multiple keypresses at the same time:
  public boolean[] keys; // THIS IS PUBLIC
  private boolean doubleJump;
  public boolean hasMoved;
  //
  private boolean hidden;
  public Player(float xpos, float ypos, float scrollX, float scrollY, Platform[] platformList) {
    //
    super(20, 20, xpos, ypos);
    this.x = xpos;
    this.y = ypos;
    this.currentX = xpos;
    this.currentY = ypos;
    this.sx = 5.0; // random init value
    this.sy = 0;
    this.inAir = 0;
    // test:
    this.exit = super.exit;
    // test again:
    this.state = 0;
    this.stateNull = true;
    // test yet again:
    this.distance = 0;
    //
    this.angle = 0.0;
    this.hidden = false;
    this.keyPress = false;
    this.jumpCounter = 0;
    this.keys = new boolean[3]; // right, left, up keys, respectively
    for (int i = 0; i < this.keys.length; i++) {
      this.keys[i] = false;
    }
    this.doubleJump = false;
    this.scrollX = scrollX;
    this.scrollY = scrollY;
    this.hasMoved = false;
    this.platforms = platformList; // this will be a list of all the platform objects in the level, so we can go through this list whenever checking if player is touching platforms
    //
    PImage img;
    img = loadImage("player.png");
    // 40x40, we want to resize to 20x20
    img.resize(20, 20);
    this.p = img;
    image(p, xpos, ypos);
    j = new Joystick();
  }
  // function to move right, this will be changed later but I just want to check/test basic movement functionality in processing
  public void draw() {
    //
    image(this.p, this.x, this.y);
    j.tick(); // not sure if this should go in the if statement
  }
  // get methods
  public float getX() {
    return this.x;
  }
  public float getY() {
    return this.y;
  }
  public float getScrollX() {
    return this.scrollX;
  }
  public float getScrollY() {
    return this.scrollY;
  }
  public void right() {
    //
    for (int i = 0; i < this.sx*10; i++) {
      //
      this.x += 0.1;
      this.currentX += 0.1;
      this.scrollX += 0.1;
    }
    //this.x += sx;
  }
  public void left() {
    //
    for (int i = 0; i < this.sx; i++) {
      //
      this.x -= 1;
      this.currentX -= 1;
      this.scrollX -= 1;
    }
  }
  public void center() {
    // dev function
    this.x = width/2-10;
    this.y = height/2-10;
    this.scrollX = 0;
    this.scrollY = 0;
  }
  public boolean touchingPlatforms() {
    //
    for (int i = 0; i < this.platforms.length; i++) {
      //
      if (super.touching(this.platforms[i], this.x, this.y, this.platforms[i].getX(), this.platforms[i].getY())) {
        //println("Touching platforms");
        return true;
      }
    }
    return false; // there we go1
  }
  public boolean borderingPlatforms() {
    //
    for (int i = 0; i < this.platforms.length; i++) {
      //
      if (super.bordering(this.platforms[i], (int) this.x, (int) this.y, (int) this.platforms[i].getX(), (int) this.platforms[i].getY())) {
        //println("Touching platforms");
        return true;
      }
    }
    return false; // there we go1
  }
  // position function:
  public void position() {
    // there is a big difference between saying "this.x -= this.scrollX" and having a new variable equal this value because the first one actually changes the value of this.x, which we don't want to do.
    this.currentX = this.x - this.scrollX;
    this.currentY = this.y - this.scrollY;
  }
  // game on function, mainly initializing variables and stuff
  public void gameOn() {
    //
    this.x = width/2-10;
    this.y = height/2-10; // these are the starting positions, placeholders for now
    this.scrollX = this.x;
    this.scrollY = this.y;
    this.sx = 0;
    this.sy = 0;
    this.inAir = 0;
    this.exit = "";
  }
  public void tick() {
    // tick function!
    this.x = this.currentX;
    this.y = this.currentY;
    this.hasMoved = false;
    if (this.touchingPlatforms()) {
      //
      this.doubleJump = false;
    }
    if (jumpCounter > 0) {
      //
      this.y -= 2*jumpCounter;
      this.jumpCounter -= 1;
      this.hasMoved = true;
    } else {
      for (float i = 0; i < sy; i+= 0.3) {
        if (!this.touchingPlatforms()) {
          this.hasMoved = true;
          //
          //println("not touching platforms");
          this.y += 0.3; // processing is wacky
          //this.sy += 0.3; //
        } else {
          this.sy = 0;
        }
    }
    }
    this.sy += 0.3;
    //this.sy = 0;
    //if (keyPressed && keyCode == RIGHT) {
    //  this.right();
    //}
    //if (keyPressed && keyCode == LEFT) {
    //  this.left();
    //}
    //if (keyPressed && keyCode == UP && this.borderingPlatforms()) {
    //  //
    //  this.jumpCounter = 10;
    //}
    // NEW KEYPRESS CODE:
    if (this.keys[0]) {
      this.right();
      this.hasMoved = true;
    }
    if (this.keys[1]) {
      this.left();
      this.hasMoved = true;
    }
    if (this.keys[2] && (this.borderingPlatforms() || this.jumpCounter == 0)) {
      //
      if (this.borderingPlatforms()) {
        this.jumpCounter = 10;
        this.hasMoved = true;
      } else if (!this.doubleJump) {
        this.jumpCounter = 7;
        this.doubleJump = true;
        this.hasMoved = true;
      }
    }
    // end of tick function:
    this.position();
    //for (int i = 0; i < 12; i++) {
    //  //
    //  if (!this.touchingPlatforms()) {
    //    //
    //    this.y += 1;
    //  }
    //}
    //if (!this.touchingPlatforms()) {
    //  this.y += 12;
    //}
    //else {
    //  //
    //  while (this.touchingPlatforms() && !this.borderingPlatforms()) {
    //    // move back up/out of the platforms
    //    this.y -= 0.3;
    //  }
    //  this.sy = 0;
    //}
  }
  // game die
  public void gameDie() {
    //
    this.exit = "";
  }
  // I'll do the game win function later because that involves the exit sprite
  //
  public void testDie() {
    // will actually write this later
    return;
  }
}
