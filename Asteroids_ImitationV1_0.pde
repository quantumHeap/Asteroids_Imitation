BattleShip battleShip;
Asteroid asteroid;
float Hello;
boolean[] keys = new boolean[512];
ArrayList<GameObject> gameObjects;
ArrayList<Bullet> bullets;
ArrayList<Asteroid> asteroids;
int AsteroidAmount = 10;
void setup()
{
  size(750,750);
  gameObjects = new ArrayList<GameObject>();
  asteroids = new ArrayList<Asteroid>();
  // ps = new ParticleSystem(new PVector(width/2,50));
  
  for(int i = 0; i < AsteroidAmount; i++)
  {
      asteroids.add(new Asteroid(random(width,height),random(width,height),0));
  }
  bullets = new ArrayList<Bullet>();
  gameObjects.add(new BattleShip(width/2,height/2));
  //asteroids.add(new Asteroid(500,500,0));
 // gameObjects.add(new Asteroid(500,500));
  //battleShip = new BattleShip(100,100);
  //asteroid = new Asteroid(500,500);
  
}


void keyPressed()
{
 keys[keyCode] = true; 

}

void keyReleased()
{
 keys[keyCode] = false; 
}

void draw()
{
  background(125);
  //  ps.addParticle();
 // ps.run();
  for(int i = 0; i < gameObjects.size(); i++)
  {
   GameObject g = gameObjects.get(i);
   g.Render();
   g.Update();  
  }
  for(int i = 0; i < asteroids.size(); i ++)
  {
    Asteroid a = asteroids.get(i);
    a.Render();
    a.Update(); 
  }
   for (int i = bullets.size() -1 ; i >= 0  ; i --)
  {
    Bullet b = bullets.get(i);
    b.Update();
    b.Render(); 
    /*
    if (PVector.dist(b.pos, asteroid.pos) < asteroid.halfW)
    {
      asteroid.Health = 0;
    }
    */
  }   
}
