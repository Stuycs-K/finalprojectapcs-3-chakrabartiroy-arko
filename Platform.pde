class Platform extends Thing {
  // private variables
  private float originX, originY;
  private float pDir, pOffset, pRadius, pTimer;
  private String name; // costume
  private int typ; // is it stationary, gliding, temporary, trampoline, etc?
  private boolean visible; // 0 = hidden, 1 = visible I think
  private float x, y;
  private PImage p;
  public float scrollX, scrollY;
  private float currentX, currentY;
  public Platform(String costume, float xpos, float ypos, int xlen, int ylen) {
    //
    //super()
    // xlen, ylen will be given in an array in Game.pde based on the lengths of the different platforms
    super(xlen, ylen, xpos, ypos);
    this.x = xpos;
    this.y = ypos;
    this.originX = xpos;
    this.originY = ypos;
    this.name = costume;
    this.typ = 0;
    this.pTimer = 0;
    this.scrollX = 0;
    this.scrollY = 0;
    this.currentX = this.x;
    this.currentY = this.y;
    PImage img;
    img = loadImage(this.name + ".png");
    img.resize(xlen, ylen);
    this.p = img;
    image(p, this.x, this.y);
  }
  public void draw() {
    // draw all platforms
    image(this.p, this.x, this.y);
  }
  public float getX() {
    //
    return this.x;
  }
  public float getY() {
    //
    return this.y;
  }
  // position function:
  public void position(boolean moveX, boolean moveY) {
    // there is a big difference between saying "this.x -= this.scrollX" and having a new variable equal this value because the first one actually changes the value of this.x, which we don't want to do.
    if (moveX) {
      //this.currentX = this.x - this.scrollX;
      this.x -= this.scrollX;
    }
    if (moveY) {
      //this.currentY = this.y + this.scrollY;
      this.y -= this.scrollY;
    }
    //println("scrollX: " + scrollX + "\n scrollY: " + scrollY);
  }
  public void tick(boolean moveX, boolean moveY) {
    //
    //this.x = this.currentX;
    //this.y = this.currentY;
    this.position(moveX, moveY);
    this.draw();
  }
}
