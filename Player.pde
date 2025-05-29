class Player extends Thing {
  // do stuff
  private int x;
  private int y;
  private int sx;
  private int sy;
  private PImage p;
  public Player(int xpos, int ypos, int scrollX, int scrollY) {
    //
    super(20, 20, xpos, ypos);
    this.x = xpos;
    this.y = ypos;
    this.sx = 5; // random init value
    PImage img;
    img = loadImage("player.png");
    // 40x40, we want to resize to 20x20
    img.resize(20, 20);
    this.p = img;
    image(p, xpos, ypos);
  }
  // function to move right, this will be changed later but I just want to check/test basic movement functionality in processing
  public void draw() {
    //
    image(this.p, this.x, this.y);
  }
  public void right() {
    //
    this.x += sx; // i think sx is speed x
  }
}
