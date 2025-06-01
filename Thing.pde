class Thing {
  //
  public int level, collected, collectedMax, tick, platformSX, platformSY;
  public float time, impulseX, impulseY;
  public float[] highScores;
  public int[] levels;
  public String collectedDisplay, exit;
  public int xsize, ysize;
  public float x, y;
  public float scrollX, scrollY;
  public Thing(int xlen, int ylen, float xpos, float ypos) {
    //
    this.scrollX = 0;
    this.scrollY = 0;
    this.level = 1;
    this.collected = 0;
    this.collectedMax = 20; // placeholder
    this.tick = 0;
    this.platformSX = 0;
    this.platformSY = 0;
    this.time = 0.0;
    this.xsize = xlen;
    this.ysize = ylen;
    this.x = xpos;
    this.y = ypos;
    this.exit = "";
  }
  // check if two things are touching
  public boolean touching(Thing obj) {
    // check if this Thing is touching obj
    // get all pixels covered by this and object
    // testing:
    //System.out.println("this.x: " + this.x + "\n this.y: " + this.y + "\n this.xsize: " + this.xsize + "\n this.ysize: " + this.ysize + "\n obj.x: " + obj.x + "\n obj.y: " + obj.y + "\n obj.xsize: " + obj.xsize + "\n obj.ysize: " + obj.ysize);
    // end testing
    if (this.x <= obj.x + obj.xsize && this.x + this.xsize >= obj.x) {
      //
      if (this.y <= obj.y + obj.ysize && this.y + this.ysize >= obj.y) {
        // touching!
        return true;
      }
    }
    // placeholder:
    return false;
  }
}
