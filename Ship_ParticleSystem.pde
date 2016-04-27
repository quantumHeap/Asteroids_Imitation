class Ship_ParticleSystem 
{
  ArrayList<Ship_Particle> Ship_particles;
  PVector origin;

  Ship_ParticleSystem(PVector location) 
  {
    origin = location.get();
    Ship_particles = new ArrayList<Ship_Particle>();
  }

  void addParticle() 
  {
    Ship_particles.add(new Ship_Particle(origin));
  }

  void run() {
    for (int i = Ship_particles.size()-1; i >= 0; i--) {
      Ship_Particle p = Ship_particles.get(i);
      p.run();
      if (p.isDead()) {
        Ship_particles.remove(i);
      }
    }
  }
}
class Ship_Particle 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Ship_Particle(PVector l)
  {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }
  void run()
  {
     update();
    display();
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
