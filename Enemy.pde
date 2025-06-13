public class Enemy extends Danger {
  //
  private final float originX, originY;
  private final float finalX, finalY;
  private final float adjustX, adjustY;
  private final float time;
  private final float frames;
  private boolean forward;
  private final PImage p;
  public boolean devReset = false;

  public Enemy(String costume, float ox, float oy, float fx, float fy, int w, int h, float glideTime) {
    super(ox, oy, w, h);
    originX = ox; 
    originY = oy;
    finalX = fx;
    finalY = fy;
    time = glideTime;
    frames = time/60;
    adjustX = (fx-ox) / frames;
    adjustY = (fy-oy) / frames;
    p = loadImage(costume + ".png");
    p.resize(w, h);
    forward = true;
  }

  @Override
  public void draw() {
    // assuming speed of about 60 FPS (i.e. draw happens 60 times per second)
    // draw using screen coords
    image(p, currentX, currentY);
  }

  @Override
  public void tick(boolean moveX, boolean moveY) {
    if (devReset) {
      x = originX;
      y = originY;
      devReset = false;
    }
    //super.tick(moveX, moveY);  // calls Danger.position(moveX,moveY) + draw()
    super.position(moveX, moveY);
    if (currentX == finalX && currentY == finalY) {
      forward = false; // we go back now
    }
    if (currentX == originX && currentY == originY) {
      forward = true; // we go forward now
    }
    if (forward) {
      // move forward
      currentX = x + adjustX;
      currentY = y + adjustY;
    } else {
      // move backward
      currentX = x - adjustX;
      currentY = y - adjustY;
    }
    //super.tick(false, false);
    this.draw();
    // gliding/animation:
    
    //this.draw();
  }

  /** Reset this spike back to its original world position */
  public void center() {
    x = originX;
    y = originY;
    // if you ever scroll outside of draw, clear those too:
    scrollX = 0;
    scrollY = 0;
    devReset = false;
  }
}
