PVector loc, vel, accl;
int sz=40;

void setup() {
  background(0);
  size(800, 600);

  colorMode(HSB, 360, 100, 100, 100);

  loc = new PVector(width/2, height/2,0);
  vel = new PVector(0, 0,0);
  accl = new PVector(random(-.1, .1), random(-.1, .1),0);
}

void draw() {
  accl.set(random(-.5, .5), random(-.5, .5),0);

  vel.add(accl);
  loc.add(vel);

  noStroke();
  fill(map(loc.x, 0, width, 0, 360), 75, 90, random(15, 30));
  ellipse(loc.x, loc.y, sz, sz);

  if (loc.x - sz/2 > width) {      
    loc.x = -sz/2;
  }

  if (loc.x + sz/2 < 0) {          
    loc.x = width + sz/2;
  }

  if (loc.y - sz/2 > height) {   
    loc.y = -sz/2;
  }

  if (loc.y + sz/2 < 0) {      
    loc.y = height + sz/2;
  }
}

