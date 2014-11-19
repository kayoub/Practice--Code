PVector loc, vel, accl;
PVector mouse;
int sz=50;

void setup() {
  size(800, 600);
  loc = new PVector(width/2, height/2);
  vel = new PVector(random(-2, 2), random(-2, 2));   
  accl = new PVector(random(-.1,.1),random(-.1,.1));
  mouse = new PVector();
  noCursor();
}

void draw() {
  mouse.set(mouseX, mouseY);
  background(0);
  vel.add(accl);
  loc.add(vel);

  noStroke();
  ellipse(loc.x, loc.y, sz, sz);

  if (loc.dist(mouse) < sz/2) {     
    fill(0,120,200);          
    if (loc.x < mouse.x) {   
      vel.x = -abs(vel.x);
    } else {                     
      vel.x = abs(vel.x);
    }
    if (loc.y < mouse.y) {     
      vel.y = -abs(vel.y);
    } else {
      vel.y = abs(vel.y);
    }
  } 
  
  else {                                       
    fill(150,0,190);
  }
  
  if (loc.x + sz/2 > width) {
    vel.x = -abs(vel.x);
  }
  if (loc.y + sz/2 > height) {
    vel.y = -abs(vel.y);
  }
  if( loc.x - sz/2 < 0) {
    vel.x = abs(vel.x);
  } 
  if( loc.y - sz/2 < 0) {
    vel.y = abs(vel.y);
  } 
  ellipse(mouseX,mouseY, sz/2,sz/2);
  
}

