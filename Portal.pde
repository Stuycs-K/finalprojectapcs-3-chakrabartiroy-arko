// Portal.pde

class Portal extends Platform {
  public boolean active = false;

  /** 
   * x,y,w,h are world coords & size; 
   * "portal" tells the super‐constructor to load portal.png 
   */
  Portal(float xpos, float ypos, int w, int h) {
    super("portal_open", xpos, ypos, w, h);
  }

  /** Only draw the portal sprite when its active */
  @Override
  public void draw() {
    // 1) Draw the portal sprite
    super.draw();

    // 2) If not active yet, overlay a red X
    if (!active) {
      // draw two diagonal lines across the portal image bounds
      stroke(255, 0, 0);
      strokeWeight(6);
      // top-left to bottom-right
      line(currentX, currentY, currentX + xsize, currentY + ysize);
      // bottom-left to top-right
      line(currentX, currentY + ysize, currentX + xsize, currentY);
      
      // reset stroke
      noStroke();
    }
  }

  /** The Platform.tick() already handles position() & draw(), so we can reuse it */
  @Override
  public void tick(boolean moveX, boolean moveY) {
    position(moveX, moveY);
    draw();
  }

  /** Win when player overlaps this portal world box */
  public boolean reached(Player p) {
    return active && p.touching2(this, p.x, p.y, this.x, this.y);
  }
}
