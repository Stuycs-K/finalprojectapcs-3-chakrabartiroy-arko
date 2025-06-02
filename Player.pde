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
  private boolean impY;
  // just in case ig?
  private float impulseX, impulseY;
  private String exit;
  // no idea what this is but:
  private int state;
  private boolean stateNull;
  // again, no idea what this is for but:
  private int distance; // hopefully this stays an int
  // okay i have maybe somewhat of an idea what this could be
  private float angle;
  private float scrollX;
  private float scrollY;
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
    this.inAir = 0;
    // test:
    this.impY = false;
    this.impulseX = super.impulseX;
    this.impulseY = super.impulseY;
    this.exit = super.exit;
    // test again:
    this.state = 0;
    this.stateNull = true;
    // test yet again:
    this.distance = 0; // ig??? this is very weird but ill keep it like this for now
    //
    this.angle = 0.0; // also weird but for now ig
    this.hidden = false;
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
    if (!this.hidden) {
      image(this.p, this.currentX, this.currentY);
    }
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
    this.x += this.sx; // i think sx is speed x
    // for now, just to make sure this still works:
    this.currentX += this.sx;
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
  public void changeY(float cy) {
    // copycat version of griffpatch's "change player y by [sy]" function
    // just in case, I'm going to add a parameter to this as well
    //println("reached changeY function from tick, line 100");
    this.y -= cy; // thankfully, cy will still be an int
    // actually nvm! its a float yayyy
    this.inAir += 1;
    this.position(); // will write this function later but it's pretty simple
    //println("changeY from tick, line 105");
    if (this.touchingPlatforms()) {
      println("changeY from tick, touchingPlatforms true");
      // ezpz
      if (cy > 0) {
        //
        //println("cy > 0");
        this.touchPlatformOut(1); // will also write this function later
      } else {
        //
        //println("cy < 0");
        this.touchPlatformOut(-1);
        //println("reached end");
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
    this.y -= out;
    this.position();
    //println("reached 132");
    // repeat until -> while not [condition]
    // repeat until (not touching platforms) becomes: while (touching platforms)
    if (this.touchingPlatforms()) {
      // I think this script is to move out of any platforms that player is touching
      println("Touching platforms true, from touchPlatformOut function");
      this.y -= out;
      this.position();
    }
    this.sy = 0.0;
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
        this.y -= 1;
        this.position();
        if (!this.touchingPlatforms()) {
          // I BELIEVE that the scratch "stop(this script)" function refers to the entire function as the "script" at hand but I'm not 100% sure
          return;
        }
      }
      // keep going
      this.y += 12;
      // "repeat until (not(touching(platforms)))"
      if (this.touchingPlatforms()) {
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
        this.currentY -= 2;
        if (this.touchingPlatforms()) {
          //
          this.sx = 0.0;
        } else {
          // oh nah
          // what the java is this
          this.sx = (cx / Math.abs(cx)) * -18;
          // okay the above looks like just a very very fancy AND SO UNNESSECARY way of setting this.sx to +-18
          // in particular, the resulting sign of this.sx is opposite of the original one
          // edit: it might be SLIGHTLY different because there are times when this function is called where the parameter on scratch is NOT sx
          // anyway, continuing...
          this.sy = -15.0; // so random but ok
          this.inAir = 0;
        }
      } else {
        //
        this.sx = 0.0;
      }
    }
  }
  // FINALLY DONE WITH THIS FUNCTION
  // this will probably be the most annoying function of all (at least in this file...) to write:
  public void tick() {
    //
    if (this.impY) {
      //
      //println("impY is true, line 201");
      this.touchPlatformOut(-1);
    }
    // new function that I'll write after this...
    this.handlePlatforms(this.x, this.y);
    if (!this.exit.equals("")) {
      // stop(this script)
      // println("Exit: " + this.exit);
      return;
    }
    //println("tick - reached line 211");
    if (this.impY) {
      // not sure why this condition is repeated but okay
      //println("impY is true, line 213");
      this.sx += this.impulseX;
      this.sy -= this.impulseY;
      // "set IMPULSE Y to [blank]"
      this.impY = false;
      this.inAir = 10;
    } else {
      //
      //println("impY is false, line 221");
      if (this.j.joyY > 0) {
        //
        if ((this.inAir > 2) || (this.sy > 8 && this.inAir < 1)) {
          //
          this.sy = 15.0;
        }
      }
    }
    //println("tick - reached line 231");
    // keep going...
    this.sy -= 2.0;
    if (this.sy < -24) {
      //
      this.sy = -24.0;
    }
    //println("tick - reached line 238");
    this.changeY(this.sy); // ugh i had to make everything floats because of this
    //println("tick - reached line 240");
    this.sx = (this.sx * 0.8) + (super.platformSX * 0.2);
    //println("tick - reached line 242");
    if (this.j.joyX < 0) {
      //
      this.sx -= 2;
      this.stateNull = false;
      this.state = 1;
    }
    if (this.j.joyX > 0) {
      //
      this.sx += 2;
      this.stateNull = false;
      this.state = 1;
    }
    //println("tick - reached line 262");
    // annoying math stuff below:
    if ((Math.abs(this.sx - super.platformSX)) > 1.5) {
      //
      //println("266");
      changeX((int) Math.round(this.sx)); // why round now?!?!?
    } else {
      //
      changeX((int) Math.round(super.platformSX));
    }
    // the below is checking edge case (i.e. scrolling mechanics stuff)
    // greater than/less than +- 10 of horizontal length (i.e. width)
    if (this.x < 10) {
      //
      this.x = 10.0;
    }
    //println("tick - reached line 277");
    this.position();
    this.testDie(); // will write this actual function later, just using a placeholder for now
  }
  // handle platforms function
  public void handlePlatforms(float xval, float yval) {
    //
    this.y -= super.platformSY;
    this.position();
    if (this.touchingPlatforms()) {
      // the rest of the function will be here
      this.distance = 1;
      // repeat 8...
      for (int i = 0; i < 8; i++) {
        //
        this.angle = 0;
        // repeat 8 again
        for (int j = 0; j < 8; j++) {
          // math again...
          this.x = Math.round(xval + (this.distance * Math.sin(Math.toRadians(this.angle)))); // this is a nightmare
          this.y = Math.round(yval - (this.distance * Math.cos(Math.toRadians(this.angle)))); // this is a nightmare
          // one question about the above though: doesn't x usually correspond to cos and y to sin?
          this.position();
          if (!this.touchingPlatforms()) {
            // stop this script -> return
            return;
          }
          this.angle += 45;
        }
        this.distance += 1;
      }
      this.x = xval;
      this.y = yval;
      this.position();
      //this.exit = "die"; // no idea why but ok
    }
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
    this.impY = false;
  }
  // scroll stage function, related to scrolling mechanics ig...
  public void scrollStage() {
    //
    this.scrollX = this.x;
    if (this.scrollX > 0) {
      //
      this.scrollX = 0;
    }
    this.scrollX += Math.round((this.y - this.scrollY) / 10);
    if (this.y - this.scrollY > 100) {
      // i think these are bounds?
      this.scrollY = this.y - 100;
    }
    if (this.scrollY > 0) {
      //
      this.scrollY = 0;
    }
    this.position();
    if (this.y > height) {
      //
      this.exit = "die";
    }
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
