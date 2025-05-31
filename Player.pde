class Player extends Thing {
  // do stuff
  private int x;
  private int y;
  private int sx;
  private int sy;
  private PImage p;
  private Joystick j;
  private int inAir;
  private Platform[] platforms;
  // just in case
  private int currentX, currentY;
  public Player(int xpos, int ypos, int scrollX, int scrollY, Platform[] platformList) {
    //
    super(20, 20, xpos, ypos);
    this.x = xpos;
    this.y = ypos;
    this.currentX = xpos;
    this.currentY = ypos;
    this.sx = 5; // random init value
    this.inAir = 0;
    //
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
    image(this.p, this.currentX, this.currentY);
    j.tick();
  }
  public void right() {
    //
    this.x += this.sx; // i think sx is speed x
    // for now, just to make sure this still works:
    this.currentX += this.sx;
    this.currentY += this.sy;
  }
  public boolean touchingPlatforms() {
    //
    for (int i = 0; i < this.platforms.length; i++) {
      //
      if (super.touching(this.platforms[i])) {
        return true;
      }
    }
    return false; // there we go1
  }
  public void changeY() {
    // copycat version of griffpatch's "change player y by [sy]" function
    this.y += this.sy;
    this.inAir += 1;
    this.position(); // will write this function later but it's pretty simple
    if (this.touchingPlatforms()) {
      // ezpz
      if (this.sy > 0) {
        //
        this.touchPlatformOut(-1); // will also write this function later
      } else {
        //
        this.touchPlatformOut(1);
      }
    }
  }
  // position function:
  public void position() {
    // there is a big difference between saying "this.x -= this.scrollX" and having a new variable equal this value because the first one actually changes the value of this.x, which we don't want to do.
    this.currentX = this.x - this.scrollX;
    this.currentY = this.y - this.scrollY;
  }
  // on scratch, this function is called "Touching Platform: out [out]".
  public void touchPlatformOut(int out) {
    //
    this.y += out;
    this.position();
    // repeat until -> while not [condition]
    // repeat until (not touching platforms) becomes: while (touching platforms)
    while (this.touchingPlatforms()) {
      // I think this script is to move out of any platforms that player is touching
      this.y += out;
      this.position();
    }
    this.sy = 0;
    if (out > 0) {
      this.inAir = 0;
    }
  }
}
