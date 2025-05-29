class Player extends Thing {
  // do stuff
  private int x;
  private int y;
  private int sx;
  private int sy;
  public Player(int xpos, int ypos, int scrollX, int scrollY) {
    //
    super(20, 20, xpos, ypos);
    PImage img;
    img = loadImage("player.png");
    // 40x40, we want to resize to 20x20
    img.resize(20, 20);
    image(img, xpos, ypos);
  }
}
