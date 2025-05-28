class Thing {
  //
  public int scrollX, scrollY, level, collected, collectedMax, tick, platformSX, platformSY;
  public float time, impulseX, impulseY;
  public float[] highScores;
  public int[] levels;
  public String collectedDisplay, exit;
  public int xsize, ysize;
  public Thing(int xlen, int ylen) {
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
  }
  // check if two things are touching
  public boolean touching(Thing obj) {
    // check if this Thing is touching obj
    // get all pixels covered by this and object
    // placeholder:
    return false;
  }
}
