Player p;
Platform lv1p1, lv1p2, lv1p3, lv1p4, lv1p5, lv1p6;
Spike lv1d1, lv1d2, lv1d3, lv1d4, lv1d5, lv1d6, lv1d7;
Spike lv2d1, lv2d2, lv2d3, lv2d4, lv2d5, lv2d6, lv2d7, lv2d8, lv2d9, lv2d10;
Coin lv1c1, lv1c2, lv1c3, lv1c4, lv1c5, lv1c6, lv1c7, lv1c8, lv1c9, lv1c10;
Coin lv2c1, lv2c2, lv2c3, lv2c4, lv2c5, lv2c6, lv2c7, lv2c8, lv2c9, lv2c10, lv2c11;
Enemy lv2e1;
Platform[] platforms;
Spike[] spikes;
Coin[] coins;
Enemy[] enemies;
int level = 1;
// complete ig

boolean gameRunning;
boolean immortal;

int deathTimer = 0; // counts frames since death began
int deathDuration = 60; // e.g. 60 frames ≈ 1 second at 60 FPS
int passTimer = 0;
int passDuration = 120;
boolean isDead = false;

// new portal stuff
Portal exitPortal;
boolean levelPassed = false;
boolean coinsCollected = false;

void setup() {
  size(800, 500);
  level = 1;
  // — Platforms —
  lv1p1 = new Platform("Test22",  40,  height/2+150, 538, 85);
  lv1p2 = new Platform("Test22", 700,  height/2+100, 538, 85);
  lv1p3 = new Platform("Test22", 1238,  height/2+15,  538, 85);
  lv1p4 = new Platform("Test22", 1776,  height/2+80,  538, 85);
  //lv1p5 = new Platform("Test22", 1776+538, height/2+80, 538, 85);
  platforms = new Platform[]{lv1p1,lv1p2,lv1p3,lv1p4};
  
  // — Spikes —
  lv1d1 = new Spike("Spikes", 250,  height/2+150-21, 65,21);
  lv1d2 = new Spike("Spikes", 800,  height/2+100-21, 65,21);
  lv1d3 = new Spike("Spike", 1050, height/2+100-21, 21, 21); // spike: 21*21
  lv1d4 = new Spike("Spike", 1300, height/2+15-21, 21, 21);
  lv1d5 = new Spike("Spears", 1800, height/2+15-60-122, 83, 122); // spears: 122*83, vertical
  lv1d6 = new Spike("Spears", 2000, height/2+15-60-122, 83, 122);
  lv1d7 = new Spike("Spears", 2200, height/2+15-60-122, 83, 122);
  spikes = new Spike[]{lv1d1, lv1d2, lv1d3, lv1d4, lv1d5, lv1d6, lv1d7};
  
  // — coins —
  //coins = new Coin[] {};
  //int coinSize = 32;
  // adjustment for coins: when positioned on top of set of three spikes, adjustment = +1 * (65-32) / 2 = 16.5
  // adjustment for coins: when positioned on top of one spike, adjustment = +1 * (21-32) / 2 = -5.5
  lv1c1 = new Coin(250+16.5, height/2+150-21-90, 32, 32); // coin: 32*32
  lv1c2 = new Coin(800+16.5, height/2+100-21-90, 32, 32); // the height/ypos equation looks weird, but it's just because the (first two, at least) coins are positioned on top of the spikes
  lv1c3 = new Coin(1050-5.5, height/2+100-21-90, 32, 32);
  lv1c4 = new Coin(1300-5.5, height/2+15-21-90, 32, 32);
  lv1c5 = new Coin(1500, height/2+15-21-30, 32, 32); // coins just on the platforms
  lv1c6 = new Coin(1570, height/2+15-21-30, 32, 32);
  lv1c7 = new Coin(1640, height/2+15-21-30, 32, 32);
  lv1c8 = new Coin(1720, height/2+15-21-30, 32, 32);
  lv1c9 = new Coin(1883+117/2-16, height/2+15-60-32, 32, 32);
  lv1c10 = new Coin(2083+117/2-16, height/2+15-60-32, 32, 32);
  coins = new Coin[] {lv1c1, lv1c2, lv1c3, lv1c4, lv1c5, lv1c6, lv1c7, lv1c8, lv1c9, lv1c10};
  
  // — Player —
  p = new Player(width/2-10, height/2-10, 0, 0, platforms, spikes);
  gameRunning = true;
  
  // no enemy here
  enemies = new Enemy[] {};

  // — Portal —
  exitPortal = new Portal(2350.0, height/2+15-60, 86, 86);
  exitPortal.active = false;
}

void draw() {
  if (immortal) {
    isDead = false;
  }
  if (isDead) {
    // — DEATH BLINK & MESSAGE —
    background(0);
    for (Platform plt : platforms) plt.draw();
    for (Spike sp : spikes)    sp.draw();
    for (Enemy en : enemies)   en.draw();

    fill(255, 255, 0); // bright yellow
    textSize(64);
    text("You Died!", width/2-110, 100);

    if ((deathTimer / 10) % 2 == 0) {
      p.draw();
    }
    deathTimer++;
    if (deathTimer >= deathDuration) {
      resetLevel();
    }
  } else if (levelPassed && level == 1) {
    //try {
    //  Thread.sleep(2000);
    //} catch (Exception g) {
    //  println("exception");
    //}
    // — PASS SCREEN —
    background(0, 150, 200);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(48);
    text("YOU PASSED!", width/2, height/2);
    passTimer++;
    if (passTimer >= passDuration) {
      // go to next level
      level += 1;
      generateLevel(2);
      levelPassed = false;
    }
  } else if (levelPassed) {
    // — WIN SCREEN —
    background(0, 150, 200);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(48);
    text("YOU WON!", width/2, height/2);
  } else {
    // — NORMAL GAMEPLAY —
    background(0); //

    // 1) Player
    p.draw();
    p.tick();

    // 2) Fall‐off‐screen death
    if (p.getY() > height) {
      isDead = true;
      deathTimer = 0;
    }

    // 3) Platforms
    for (Platform plt : platforms) {
      plt.scrollX = p.getScrollX();
      plt.scrollY = p.getScrollY();
      plt.tick(p.hasMovedX, p.hasMovedY);
    }

    // 4) Spikes & death
    for (Spike sp : spikes) {
      sp.scrollX = p.getScrollX();
      sp.scrollY = p.getScrollY();
      sp.tick(p.hasMovedX, p.hasMovedY);
    }
    // 4.5) Enemies & death
    for (Enemy en : enemies) {
      en.scrollX = p.getScrollX();
      en.scrollY = p.getScrollY();
      //println("enemy");
      en.tick(p.hasMovedX, p.hasMovedY);
    }
    if ((!isDead && p.touchingSpikes()) || (!isDead && p.touchingEnemies())) {
      isDead = true;
      deathTimer = 0;
    }

    // 5) Portal
    boolean allCollected = true;
    for (Coin c : coins) {
      if (!c.collected) {
        allCollected = false;
        break;
      }
    }
    exitPortal.active = allCollected;
    
    // 5b) Draw & tick portal
    exitPortal.scrollX = p.getScrollX();
    exitPortal.scrollY = p.getScrollY();
    exitPortal.tick(p.hasMovedX, p.hasMovedY);
    if (!levelPassed && exitPortal.reached(p)) {
      levelPassed = true;
    }
    
    // 6) Coins
    int collectedCount = 0;
    for (Coin c : coins) {
      c.scrollX = p.getScrollX();
      c.scrollY = p.getScrollY();
      c.tick(p.hasMovedX, p.hasMovedY, p);
      if (c.collected) collectedCount++;
    }
    // draw coin counter in the corner
    fill(255);                   // black text
    textSize(20);              // adjust legibility
    textAlign(LEFT, TOP);
    text("Coins: " + collectedCount + " / " + coins.length, 10, 10);

    // 6) Reset camera scroll
    p.scrollX = 0;
    p.scrollY = 0;
  }
}

void resetLevel() {
  // reset player
  p.center();
  p.sy = 0;
  p.doubleJump = false;
  p.jumpCounter = 0;

  // reset platforms & spikes
  for (Platform plt : platforms) {
    plt.center();
    plt.devReset = false;
  }
  for (Spike sp : spikes) {
    sp.center();
    sp.devReset = false;
  }
  for (Enemy en : enemies) {
    en.center();
    en.devReset = false;
  }
  // reset coins not collected
  for (Coin c : coins) {
    if (!c.collected) {
      c.center();
    }
  }
  
  // — RESET THE PORTAL TOO! —
  exitPortal.center();
  exitPortal.devReset = false;

  // clear death & pass flags
  isDead = false;
  deathTimer = 0;
  levelPassed = false;
}

// generating levels (level != 1)
void generateLevel(int l) {
  //
  if (l == 2) {
    //
    // — Platforms —
    lv1p1 = new Platform("Test22",  40,  height/2+150, 538, 85);
    lv1p2 = new Platform("Test22", 700,  height/2+100, 538, 85);
    lv1p3 = new Platform("Test22", 1238,  height/2+15,  538, 85);
    lv1p4 = new Platform("Test22", 1776,  height/2+80,  538, 85);
    //lv1p5 = new Platform("Test22", 1776+538, height/2+80, 538, 85);
    platforms = new Platform[]{lv1p1,lv1p2,lv1p3,lv1p4}; // reused the same platforms from level 1 because I don't really need a different setup for lvl2
    
    // — Spikes —
    lv1d1 = new Spike("Spikes", 250,  height/2+150-21, 65,21);
    spikes = new Spike[]{lv1d1};
    
    // — coins —
    coins = new Coin[] {};
    int coinSize = 32;
    
    // — Player —
    p = new Player(width/2-10, height/2-10, 0, 0, platforms, spikes);
    gameRunning = true;
    
    // ~ Enemies ~
    //lv2e1 = new Enemy("Big Green", 750, height/2+100-26*3, 1238-50-23*3, height/2+100-26*3, 26*3, 23*3, 5); // he can move across the second platform from about start to about end 
    // constructor:
    // public Enemy(String costume, float ox, float oy, float fx, float fy, int w, int h, float glideTime)
    // big green dimensions: 104 * 92 -> 92*104 I think??? processing is so weird
    //enemies = new Enemy[] {lv2e1};
  
    // — Portal —
    exitPortal = new Portal(2350.0, height/2+15-60, 86, 86);
    exitPortal.active = false;
  }
}





// Movement testing
void keyPressed() {
  if (key==' ') {
    p.center();
    for (Platform plt : platforms) plt.devReset = true;
    for (Spike sp : spikes)    sp.devReset = true;
    for (Enemy en : enemies)   en.devReset = true;
  }
  if (keyCode==RIGHT) p.keys[0]=true;
  if (keyCode==LEFT)  p.keys[1]=true;
  if (keyCode==UP)    p.keys[2]=true;
  if (key=='i') {
    immortal = true;
  }
}
void keyReleased() {
  if (key==' ') {
    for (Platform plt : platforms) plt.devReset = false;
    for (Spike sp : spikes)    sp.devReset = false;
    for (Enemy en : enemies)   en.devReset = false;
  }
  if (keyCode==RIGHT) p.keys[0]=false;
  if (keyCode==LEFT)  p.keys[1]=false;
  if (keyCode==UP)    p.keys[2]=false;
}
