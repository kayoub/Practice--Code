//creates an array list
ArrayList<Particle> allMyParticles = new ArrayList<Particle>();

//creates size of background
void setup() {
  size(displayWidth,displayHeight);
}

void draw() {
  //creates a new stream of particles whenever the mouse is pressed
  if (mousePressed) {
    allMyParticles.add(new Particle());
  }
  background(0);
  //declares each class
  for (int i = allMyParticles.size ()-1; i >= 0; i--) {
    Particle currentParticle = allMyParticles.get(i);
    currentParticle.display();
    currentParticle.move();
    currentParticle.grow();
    if (currentParticle.isDead()) {
      allMyParticles.remove(i);
    }
  }
}

//declares variables for the class Particle
class Particle {
  PVector loc, vel, acc;
  float sz;

//initializes variables
  Particle() {
    loc = new PVector(mouseX, mouseY);
    vel = new PVector(random(0.8, -0.8), random(-1.1, -0.8));
    acc = new PVector(random(.1, -.1), random(.1, -.1));
    sz = 5;
  }
  
//creates colored particles (ellipses)
  void display() {
    noStroke();
    colorMode(HSB, 360, 100, 100, 100);
    fill(frameCount%220, 75, 100, 10);
    ellipse(loc.x, loc.y, sz*.8, sz);
  }

//makes particles move beginning from its initial location
  void move() {
    vel.sub(acc);
    loc.add(vel);
  }
  
//makes particles grow larger
  void grow() {
    sz++;
  }

//if particles touch the top of the screen they are removed from the program
  boolean isDead() {
    if (loc.y -sz/2 > height) {
      return true;
    } else {
      return false;
    }
  }
}

