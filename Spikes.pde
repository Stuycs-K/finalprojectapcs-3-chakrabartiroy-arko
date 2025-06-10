public class Spikes extends Danger {
  //
  private PImage p;
  public Spikes(int xlen, int ylen, float xpos, float ypos, int sxp, float syp) {
    //
    super(xlen, ylen, xpos, ypos, sxp, syp);
    // placeholder for now
    this.p = loadImage("Spikes.png");
  }
  public void draw() {
    // draw all platforms
    image(this.p, super.x, super.y);
  }
}
