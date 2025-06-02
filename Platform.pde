class Platform extends Thing {
  // private variables
  private float originX, originY;
  private float pDir, pOffset, pRadius, pTimer;
  private String name; // costume
  private int typ; // is it stationary, gliding, temporary, trampoline, etc?
  private boolean visible; // 0 = hidden, 1 = visible I think
  private float x, y;
  private PImage p;
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
  public void tick() {
    //
  }
}
