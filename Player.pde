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
  public void changeY(int cy) {
    // copycat version of griffpatch's "change player y by [sy]" function
    // just in case, I'm going to add a parameter to this as well
    this.y += cy;
    this.inAir += 1;
    this.position(); // will write this function later but it's pretty simple
    if (this.touchingPlatforms()) {
      // ezpz
      if (cy > 0) {
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
  // okay this function is going to be REALLY annoying to write:
  public void changeX(int cx) {
    // copycat version of griffpatch's "change player x by [sx]" function
    // it looks like i actually need a parameter for this one ugh
    this.x += cx;
    this.position();
    if (this.touchingPlatforms()) {
      // "repeat 12"
      for (int k = 0; k < 12; k++) {
        //
        this.y += 1;
        this.position();
        if (!this.touchingPlatforms()) {
          // I BELIEVE that the scratch "stop(this script)" function refers to the entire function as the "script" at hand but I'm not 100% sure
          return;
        }
      }
      // keep going
      this.y -= 12;
      // "repeat until (not(touching(platforms)))"
      while (this.touchingPlatforms()) {
        //
        if (cx > 0) {
          //
          this.x -= 1;
        } else {
          //
          this.x += 1;
        }
        this.position();
      }
      // next!
      // this is the most annoying part...
      if (this.j.joyY > 0 && this.inAir > 6) {
        // "change y by 2", where y is NOT the variable but the built-in scratch y-position
        // this is very annoying to translate to java/processing but I THINK this should mean changing the currentY variable
        this.currentY += 2;
        if (this.touchingPlatforms()) {
          //
          this.sx = 0;
        } else {
          // oh nah
          // what the java is this
          this.sx = (cx / Math.abs(cx)) * -18;
          // okay the above looks like just a very very fancy AND SO UNNESSECARY way of setting this.sx to +-18
          // in particular, the resulting sign of this.sx is opposite of the original one
          // edit: it might be SLIGHTLY different because there are times when this function is called where the parameter on scratch is NOT sx
          // anyway, continuing...
          this.sy = 15; // so random but ok
          this.inAir = 0;
        }
      } else {
        //
        this.sx = 0;
      }
    }
    // FINALLY DONE WITH THIS FUNCTION
  }
}
