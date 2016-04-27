class Asteroid_ParticleSystem 
{
  ArrayList<Asteroid_Particle> Asteroid_particles;
  PVector origin;

  Asteroid_ParticleSystem(PVector location) 
  {
    origin = location.get();
    Asteroid_particles = new ArrayList<Asteroid_Particle>();
  }

  void addParticle() 
  {
    Asteroid_particles.add(new Asteroid_Particle(origin));
  }

  void run() {
    for (int i = Asteroid_particles.size()-1; i >= 0; i--) {
      Asteroid_Particle p = Asteroid_particles.get(i);
      p.run();
      if (p.isDead()) {
        Asteroid_particles.remove(i);
      }
    }
  }
}
class Asteroid_Particle 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Asteroid_Particle(PVector l)
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
