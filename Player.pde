class Player extends Thing {
  // do stuff
  private int x;
  private int y;
  private int sx;
  private int sy;
  public Player(int xpos, int ypos, int scrollX, int scrollY) {
    //
    super();
    PImage img;
    img = loadImage("player.png");
    image(img, xpos, ypos);
  }
}
