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
  public boolean touching(Thing obj, float xpos, float ypos, float objx, float objy) {
    // check if this Thing is touching obj
    // get all pixels covered by this and object
    // testing:
    //System.out.println("this.x: " + xpos + "\n this.y: " + ypos + "\n this.xsize: " + this.xsize + "\n this.ysize: " + this.ysize + "\n obj.x: " + obj.x + "\n obj.y: " + obj.y + "\n obj.xsize: " + obj.xsize + "\n obj.ysize: " + obj.ysize);
    // end testing
    //println("reached super touching function");
    //println("obj.xsize: " + obj.xsize + "\n obj.ysize: " + obj.ysize);
    //println("this.xsize: " + this.xsize + "\n this.ysize: " + this.ysize);
    if (xpos <= obj.x + obj.xsize && xpos + this.xsize >= obj.x) {
      //
      //println("x condition in super touching function is true");
      if (ypos <= obj.y + obj.ysize && ypos + this.ysize >= obj.y) {
        // touching!
        //println("y condition in super touching function is true");
        return true;
      }
    }
    // placeholder:
    return false;
  }
  public boolean touching2(Thing obj, float xpos, float ypos, float objx, float objy) {
    // check if this Thing is touching obj
    // get all pixels covered by this and object
  if (!((xpos > objx + obj.xsize && xpos + this.xsize > objx + obj.xsize ) || (xpos < objx && xpos + this.xsize < objx))) {
      if (!((ypos > objy + obj.ysize && ypos + this.ysize > objy + obj.ysize ) || (ypos < objy && ypos + this.ysize < objy))) {
        // touching!
        //println("y condition in super touching function is true");
        return true;
      }
    }
    // placeholder:
    return false;
  }
  // check if two things are bordering
  public boolean bordering(Thing obj, int xpos, int ypos, int objx, int objy) {
    // check if this Thing is touching obj
    // get all pixels covered by this and object
    // testing:
    //System.out.println("this.x: " + xpos + "\n this.y: " + ypos + "\n this.xsize: " + this.xsize + "\n this.ysize: " + this.ysize + "\n obj.x: " + obj.x + "\n obj.y: " + obj.y + "\n obj.xsize: " + obj.xsize + "\n obj.ysize: " + obj.ysize);
    // end testing
    //println("reached super touching function");
    //println("obj.xsize: " + obj.xsize + "\n obj.ysize: " + obj.ysize);
    //println("this.xsize: " + this.xsize + "\n this.ysize: " + this.ysize);
    if (xpos == objx + obj.xsize || xpos + this.xsize == objx) {
      //
      //println("x condition in super bordering function is true");
      if (ypos == objy + obj.ysize || ypos + this.ysize == objy) {
        // touching!
        //println("y condition in super bordering function is true");
        return true;
      }
    }
    // testing
    if ((xpos == objx + obj.xsize || xpos + this.xsize == objx) && (ypos <= objy + obj.ysize && ypos + this.ysize >= objy)) {
      //
      //println("second x= condition in super bordering function is true");
      return true;
    }
    if ((ypos == objy + obj.ysize || ypos + this.ysize == objy) && (xpos <= objx + obj.xsize && xpos + this.xsize >= objx)) {
      //
      //println("second y= condition in super bordering function is true");
      return true;
    }
    // placeholder:
    return false;
  }
}
