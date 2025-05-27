class Thing {
  //
  public int scrollX, scrollY, level, collected, collectedMax, tick, platformSX, platformSY;
  public float time, impulseX, impulseY;
  public float[] highScores;
  public int[] levels;
  public String collectedDisplay, exit;
  public Thing() {
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
  }
}
