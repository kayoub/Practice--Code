PVector loc, vel, accl;
PVector mouse;
int sz=50;

void setup() {
  size(800, 600);
  loc = new PVector(width/2, height/2);
  vel = new PVector(random(-2, 2), random(-2, 2));   
  accl = new PVector(0, 0);
  mouse = new PVector();
}

void draw() {
  mouse.set(mouseX, mouseY);
  background(0);
  vel.add(accl);
  loc.add(vel);

  noStroke();
  ellipse(loc.x, loc.y, sz, sz);

  if (loc.dist(mouse) < sz/2) {
    fill(255, 80, 100);
    vel.mult(-1);
  }
  else {
    fill(0, 210, 90);
  }

  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }
}

